sudo sed -i '$s/$/\ndisable_pvt=1/' /boot/config.txt

/*
*	Developed by Daniel Pelikan 2013,2014
*	http://digibird1.wordpress.com/
*	Reviewed by @kelu124
*/

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include <linux/time.h>
#include <linux/io.h>
#include <linux/vmalloc.h>

static int device_open(struct inode *, struct file *);
static int device_release(struct inode *, struct file *);
static ssize_t device_read(struct file *, char *, size_t, loff_t *);
static ssize_t device_write(struct file *, const char *, size_t, loff_t *);

#define SUCCESS 0
/* Dev name */
#define DEVICE_NAME "chardev"
/* Max length of device message */
#define BUF_LEN 80

/* Things for the GPIO Port */

#define BCM2708_PERI_BASE       0x3f000000
/* GPIO controller */
#define GPIO_BASE (BCM2708_PERI_BASE + 0x200000)
/* #define BLOCK_SIZE (4*1024) */

#define INP_GPIO(g)   ((*(gpio.addr + ((g) / 10))) &= ~(7 << (((g) % 10) * 3)))
#define OUT_GPIO(g)   ((*(gpio.addr + ((g) / 10))) |=  (1 << (((g) % 10) * 3)))
/* alternative function */
#define SET_GPIO_ALT(g, a) (*(gpio.addr + (((g) / 10))) |= (((a) <= 3 ? (a) + 4 : (a) == 4 ? 3 : 2) << (((g) % 10) * 3)))

/* sets   bits which are 1 ignores bits which are 0 */
#define GPIO_SET  (*(gpio.addr + 7))

/* clears bits which are 1 ignores bits which are 0 */
#define GPIO_CLR  (*(gpio.addr + 10))

#define GPIO_READ(g)  ((*(gpio.addr + 13)) &= (1 << (g)))

/* GPIO Clock */
#define CLOCK_BASE              (BCM2708_PERI_BASE + 0x00101000)
#define GZ_CLK_BUSY BIT(7)


/* How many samples to capture */
#define SAMPLE_SIZE	10000

/* Define GPIO Pins */

/* ADC 1 */
#define BIT0_PIN 19
#define BIT1_PIN 13
#define BIT2_PIN 6
#define BIT3_PIN 22
#define BIT4_PIN 27
#define BIT5_PIN 17
#define BIT6_PIN 4
#define BIT7_PIN 5


#define MY_NOP(__N)                 __asm ("nop");    // or sth like "MOV R0,R0"


//---------------------------------------------------------------------------------------------------------

// IO Acces
/* IO Acces */
struct bcm2835_peripheral {
	unsigned long addr_p;
	int mem_fd;
	void *map;

	volatile unsigned int *addr;
};

static int map_peripheral(struct bcm2835_peripheral *p);
static void unmap_peripheral(struct bcm2835_peripheral *p);
static void readScope(void);

static int Major; /* Major number assigned to our device driver */

/* Is device open?
* Used to prevent multiple access to device
*/
static int Device_Open;
static char msg[BUF_LEN]; /* The msg the device will give when asked */
static char *msg_Ptr;

static unsigned char *buf_p;

static const struct file_operations fops = {
	.read = device_read,
	.write = device_write,
	.open = device_open,
	.release = device_release
};

/*
* We need to assign the addresses of GPIO and the clock to a variable that we
* can find the hardware. A data structure is defined to hold our values we read
* out from the ADC, as well as the time from start of the readout to the end of
* the readout. This time is needed in order to calculate the time step between
* each sample. Additional two pointers are defined for later operations.
*/
static struct bcm2835_peripheral myclock = { CLOCK_BASE };

static struct bcm2835_peripheral gpio = { GPIO_BASE };

struct DataStruct {
	u32 Buffer[SAMPLE_SIZE];
	u32 time;
};

struct DataStruct dataStruct;

static unsigned char *ScopeBufferStart;
static unsigned char *ScopeBufferStop;

/*
* Since we want to manipulate hardware registers we need to map the hardware
* registers into memory. This can be done by two functions, one for the mapping
* and one for the unmapping.
*/
static int map_peripheral(struct bcm2835_peripheral *p)
{
	p->addr = (uint32_t *)ioremap(GPIO_BASE, 41 * 4);
	return 0;
}

static void unmap_peripheral(struct bcm2835_peripheral *p)
{
	iounmap(p->addr); /* unmap the address */
}

/*
* In our case we are only taking 10k samples so not too much time. Before the
* sample taking we take a time stamp. Then we read out 10k times the GPIO
* register and save it in our data structure. The GPIO register is a 32bit
* value so it is made out of 32 ‘1’s and ‘0’s each defining if
* the GPIO port is high (3.3V) or low (GND). After the read out we take
* another time stamp and turn on all interrupts again. The two time
* stamps we took are important since we can calculate how long it took to
* read in the 10k samples. The time difference divided by 10k gives us
* the time between each sample point. In case the sample frequency is too
* high and should be reduced one can add some delay and waste some time
* during each readout step. Here the aim is to achieve the maximal
* performance.
*/
static void readScope(void)
{
	int counter=0;
	int Pon=0;
	int Poff=0;
	//int Fail=0;

	//disable IRQ
	local_irq_disable();
	local_fiq_disable();

	struct timespec ts_start,ts_stop;
	//Start time

        GPIO_SET = 1 << 23;

	while(Pon<10){
MY_NOP(__N);
Pon++;
}
        GPIO_CLR = 1 << 23;

        GPIO_SET = 1 << 24;
	while(Poff<1500){
MY_NOP(__N);
Poff++;
}
        GPIO_CLR = 1 << 24;




	getnstimeofday(&ts_start);
	//take samples
	while(counter<SAMPLE_SIZE){
		dataStruct.Buffer[counter++]= *(gpio.addr + 13); 
	}

	struct timespec ts_start;
	struct timespec ts_stop;

	/* int Fail=0; */
	counter = 0;

	/* disable IRQ */
	local_irq_disable();
	local_fiq_disable();

	/* Start time */
	getnstimeofday(&ts_start);

	/* take samples */
	while (counter < SAMPLE_SIZE)
		dataStruct.Buffer[counter++] = *(gpio.addr + 13);

	/* Stop time */
	getnstimeofday(&ts_stop);

	//enable IRQ
	/* enable IRQ */
	local_fiq_enable();
	local_irq_enable();

	/* save the time difference */
	dataStruct.time = timespec_to_ns(&ts_stop) - timespec_to_ns(&ts_start);

	buf_p = &dataStruct;

	ScopeBufferStart = &dataStruct;

	ScopeBufferStop = ScopeBufferStart + sizeof(struct DataStruct);
}

/*
* In order to make a kernel module work the module needs some special entry
* functions. One of these functions is the init_module(void) which is called
* when the kernel module is loaded. Here the function to map the periphery is
* called, the GPIO pins are defined as inputs and a device file in /dev/ is
* created for communication with the kernel module. Additionally a 10 MHz clock
* signal on the GPIO Pin 4 is defined. This clock signal is needed in order to
* feed the ADC with an input clock. A 500 MHz signal from a PLL is used and the
* clock divider is set to divide by 50, which gives the required 10 MHz signal.
* More details on this clock can found in chapter 6.3 General Purpose GPIO
* Clocks in [4].
*
* This function is called when the module is loaded
*/
int __init init_module(void)
{
	int speed_id;
	struct bcm2835_peripheral *p;

	Major = register_chrdev(0, DEVICE_NAME, &fops);

	if (Major < 0) {
		pr_alert("Registering char device failed with %d\n",
			 Major);
		return Major;
	}

	pr_info("I was assigned major number %d. To talk to\n", Major);
	pr_info("the driver, create a dev file with\n");
	pr_info("'mknod /dev/%s c %d 0'.\n", DEVICE_NAME, Major);
	pr_info("Try various minor numbers. Try to cat and echo to\n");
	pr_info("the device file.\n");
	pr_info("Remove the device file and module when done.\n");

	/* Map GPIO */

	if (map_peripheral(&gpio) == -1) {
		pr_alert("Failed to map the physical GPIO registers into the virtual memory space.\n");
		return -1;
	}

	/* Define Scope pins */
	/* Define as  Input */
	INP_GPIO(BIT0_PIN);
	INP_GPIO(BIT1_PIN);
	INP_GPIO(BIT2_PIN);
	INP_GPIO(BIT3_PIN);
	INP_GPIO(BIT4_PIN);
	INP_GPIO(BIT5_PIN);
	INP_GPIO(BIT6_PIN);
	INP_GPIO(BIT7_PIN);

	OUT_GPIO(23);
	OUT_GPIO(24);

	//Set a clock signal on Pin 4
	struct bcm2835_peripheral *p=&myclock;
	p->addr = (uint32_t *)ioremap(CLOCK_BASE, 41 * 4);

	INP_GPIO(4);
	SET_GPIO_ALT(4, 0);

	speed_id = 6; /* 1 for to start with 19Mhz or 6 to start with 500 MHz */
	*(myclock.addr + 28) = 0x5A000000 | speed_id;
	while (*(myclock.addr + 28) & GZ_CLK_BUSY) {};
	*(myclock.addr + 29) = 0x5A000000 | (0x32 << 12) | 0;
	*(myclock.addr + 28) = 0x5A000010 | speed_id;

	return SUCCESS;
}

/*
* This function is called when the module is unloaded
*/
void __exit cleanup_module(void)
{
	unregister_chrdev(Major, DEVICE_NAME);
	unmap_peripheral(&gpio);
	unmap_peripheral(&myclock);
}

/*
* Called when a process tries to open the device file, like
* "cat /dev/mycharfile"
*
* Furthermore a function is needed which is called when the device file
* belonging to our kernel module is opened. When this happens the measurement
* is done by calling the readScope() function and saved in memory.
*/
static int device_open(struct inode *inode, struct file *file)
{
	static int counter = 0;

	if (Device_Open)
		return -EBUSY;

	Device_Open++;
	msg_Ptr = msg;

	readScope();/* Read n Samples into memory */

	try_module_get(THIS_MODULE);

	return SUCCESS;
}

/*
 * Called when a process closes the device file.
 */
static int device_release(struct inode *inode, struct file *file)
{
	Device_Open--; /* We're now ready for our next caller */
	module_put(THIS_MODULE);
	return 0;
}

/*
 * Called when a process, which already opened the dev file, attempts to
 * read from it.
 */
static ssize_t device_read(struct file *filp, char *buffer, size_t length,
			   loff_t *offset)
{
	/* Number of bytes actually written to the buffer */
	int bytes_read = 0;

	if (*msg_Ptr == 0)
		return 0;

	/* Check that we do not overfill the buffer */

	while (length && buf_p < ScopeBufferStop) {
		if (0 != put_user(*(buf_p++), buffer++))
			pr_info("Problem with copy\n");
		length--;
		bytes_read++;
	}

	return bytes_read;
}

/*
 * Called when a process writes to dev file: echo "hi" > /dev/hello
 */
static ssize_t
device_write(struct file *filp, const char *buff, size_t len,
			    loff_t *off)
{
	pr_alert("Sorry, this operation isn't supported.\n");
	return -EINVAL;
}

MODULE_AUTHOR("kelu124");
MODULE_LICENSE("GPL"); /* HOLY GPL ! */
MODULE_VERSION("1");


obj-m += Scope-drv.o

all:
make -C /lib/modules/$(shell uname -r)/build \
M=$(PWD) modules

clean:
make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

KERNEL_TREE=Set_your_path_here/linux-rpi-x.x.x"
CCPREFIX=Set_your_path_here/arm-bcm2708-linux-gnueabi-

obj-m += Scope-drv.o

all:
make -C ${KERNEL_TREE} ARCH=arm CROSS_COMPILE=${CCPREFIX} M=$(PWD) modules

sudo insmod ./Scope-drv.ko
sudo mknod /dev/chardev c 248 0



#include <iostream>
#include <cmath>
#include <fstream>
#include <bitset>
 
typedef unsigned short    uint16_t;
typedef unsigned int      uint32_t;
 
const int DataPointsRPi=10000;
//This is the structre we get from the Raspberry pi
struct DataStructRPi{
    uint32_t Buffer[DataPointsRPi];
    uint32_t time;
};

int main(){
 
    //Read the RPi
    struct DataStructRPi dataStruct;
    unsigned char *ScopeBufferStart;
    unsigned char *ScopeBufferStop;
    unsigned char *buf_p;
 
    buf_p=(unsigned char*)&dataStruct;
    ScopeBufferStart=(unsigned char*)&dataStruct;
    ScopeBufferStop=ScopeBufferStart+
        sizeof(struct DataStructRPi);
 
    std::string line;
    std::ifstream myfile ("/dev/chardev");
    if (myfile.is_open())
    {
      while ( std::getline (myfile,line) )
      {
        for(int i=0;i<line.size();i++){
          if(buf_p>ScopeBufferStop) 
            std::cerr<<"buf_p out of range!"<<std::endl;
          *(buf_p)=line[i];
          buf_p++;
        }
      }
      myfile.close();
    }
    else std::cerr << "Unable to open file"<<std::endl;
	
	    //convert structure we get from RPi to text output
    //time step in ns
    double time=dataStruct.time/(double)DataPointsRPi;
 
    for(int i=0;i<DataPointsRPi;i++){
 
        int valueADC1=0;//ADC 1
        //move the bits to the right pos
        int tmp = dataStruct.Buffer[i] & (0b11111<<(7));
        valueADC1=tmp>>(7);
        tmp = dataStruct.Buffer[i] & (0b1<<(25));
        valueADC1+=(tmp>>(20));
 
 
        int valueADC2=0;//ADC2
        tmp = dataStruct.Buffer[i] & (0b11<<(17));
        valueADC2=tmp>>17;
        tmp=dataStruct.Buffer[i] & (0b111<<(22));
        valueADC2+=(tmp>>20);
        tmp=dataStruct.Buffer[i] & (0b1<<27);
        valueADC2+=(tmp>>22);
 
        std::cout<<i*time<<"\t"<<valueADC1*(5./63.)
            <<"\t"<<valueADC2*(5./63.)<<std::endl;
    }
    return 0;
}//end main 

#!/bin/bash
 
FV=`zgrep "* firmware as of" /usr/share/doc/raspberrypi-bootloader/changelog.Debian.gz \
| head -1 | awk '{ print $5 }'`
 
mkdir -p k_tmp/linux
 
wget https://raw.github.com/raspberrypi/firmware/$FV/extra/git_hash -O k_tmp/git_hash
wget https://raw.github.com/raspberrypi/firmware/$FV/extra/Module.symvers \
-O k_tmp/Module.symvers
 
HASH=`cat k_tmp/git_hash`
 
wget -c https://github.com/raspberrypi/linux/tarball/$HASH -O k_tmp/linux.tar.gz
 
cd k_tmp
tar -xzf linux.tar.gz
 
KV=`uname -r` 
 
sudo mv raspberrypi-linux* /usr/src/linux-source-$KV
sudo ln -s /usr/src/linux-source-$KV /lib/modules/$KV/build
 
sudo cp Module.symvers /usr/src/linux-source-$KV/
 
sudo zcat /proc/config.gz &gt; /usr/src/linux-source-$KV/.config
 
cd /usr/src/linux-source-$KV/
sudo make oldconfig
sudo make prepare
sudo make scripts