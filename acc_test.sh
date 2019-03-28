# TEST 1 #
# Packet Error Rate Test
# We can do this by ensuring the packet error rate saved


# TEST 2 #
# Historical Data SD card Test #


# TEST 3 #
# Artificial Congestion Test #
# we can simulate the network traffic by streaming youtube on all of our devices simultaneosly
# then the behavior of the router during this congestion will be printed to std out



# TEST 4 #
# Ensure the data from the RF sensor is being properly processed
# We can just use scp to send the chart generated in the python files to another computer
# and compare it to charts generated by 3rd party apps and make sure we are seeing the same


# TEST 5 #
# Ensure the router isnt switching channels too often under high 2.4 GHz traffic
# We can check this by introducing interference (jamming) to the network and 
# jam all channels. Then we can make sure the router recognizes that the traffic
# is unavoidable and remains on its own channel

# TEST 6 #
# Ensure the router does switch when a better channel is available
# Here we will switch to channel that we have purposely added interference to,
# to make sure the router switches back


# TEST 7 #
# Hysteresis 
# To perform this test we will need to use the jammer to jam only the channel that the router is on,
# and make sure that in this scenario the router recognizes it cant escape the interference and 
# doesnt infinitely switch back and forth between channels just because it appears to be better


# TEST 8 #
# ensure the router is properly communicating with the other routers in the mesh network
# this can be done by using 2 routers that communicate with each other to avoid sharing channels.
# We can test this by using a 'fake' router that claims to be connected to channel x,
# while the channel will actually be wide open, and ensure the router doesnt switch to it
# despite seeming like the most open channel since it thinks the other router in the mesh is occupying it. 
