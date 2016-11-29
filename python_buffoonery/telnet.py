import telnetlib
import time

HOST='193.226.12.217'
PORT='20231'
tn=telnetlib.Telnet(HOST, PORT)
data=tn.read_until("Escape character is '^]'.", timeout=1)

n=10
while n>0:
    print 'sending ffs'
    tn.write("ffs")
    print 'ffs sent, sleeping 2 sec'
    time.sleep(2)
    n-=1

tn.close()

print 'connection terminated'
