import XBee_Threaded
from time import sleep
print 'Enter port  number /dev/ttyACM'
st="/dev/ttyACM"
port = raw_input()
if __name__ == "__main__":
    xbee = XBee_Threaded.XBee(st+port)
    #sent = xbee.SendStr("Srikrishna")#uncomment for debugging
    Msg = xbee.Receive()
    if Msg:
        content = Msg[7:-1].decode('ascii')
        print("Msg: " + content)
    xbee.shutdown()
