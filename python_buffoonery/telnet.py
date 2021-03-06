import telnetlib
import time

HOST='193.226.12.217'
PORT='20231'
tn=telnetlib.Telnet(HOST, PORT)
data=tn.read_until("Escape character is '^]'.", timeout=1)

increment=3

def goForward(distance):
    print 'initiating goForward'
    while distance>0:
        tn.write("fs")
        distance-=1
        time.sleep(1)
    print 'terminating goForward'

def goBackward(distance):
    while distance>0:
        tn.write("bs")
        distance-=1
        time.sleep(1)

def leftTurn(angle):
    tn.write("l")
    time.sleep(angle)
    tn.write("s")

def rightTurn(angle):
    tn.write("r")
    time.sleep(angle)
    tn.write("s")

n=10

#leftTurn(0.7)
#time.sleep(1)
#leftTurn(0.7)
#rightTurn(0.7)

goForward(10)
time.sleep(1)
leftTurn(1.2)
time.sleep(1)
goForward(3)
time.sleep(1)
rightTurn(1.2)
time.sleep(1)
goBackward(7)
time.sleep(10)

while n>0:
    print 'sending ffs'
    tn.write("ffs")
    print 'ffs sent, sleeping 2 sec'
    time.sleep(2)
    n-=1

tn.close()

print 'connection terminated'
