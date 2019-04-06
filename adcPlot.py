import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import csv
x = []
y = []

with open('specValues.csv', 'r') as csvfile:
    plots = csv.reader(csvfile, delimiter='\n')
    i = 0
    for line in plots:
        x.append(i)
        y.append(float(line[0]))
        i+=1


plt.plot(x,y, label='Congestion')
plt.xlabel('sample #')
plt.ylabel('spectrum value')
plt.title('Spectrum Graph')
plt.savefig('adcplot.pdf', bbox_inches='tight')
