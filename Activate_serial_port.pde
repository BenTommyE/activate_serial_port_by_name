/**
 * Activate_serial_port_by_name
 * Search part of the name of a serial port and activate it
 * 
 * Typical serialname of an Arduino for a:
 *
 * Mac is /dev/tty.usbmodem1411 or /dev/tty.usbmodem1421 Exclude 1411, 1421 
 * You will not connect to "/dev/cu.usbmodem1411"
 * You then need to search for only: "/dev/tty.usbmodem" or even sorter "tty.usbmodem"
 *
 * PC - help!
 *
 * By Ben-Tommy Eriksen
 * www.nornet.no
 */

import processing.serial.*;
Serial port;


void setup() {
  
  boolean portNr = activateSerialPort("tty.usbmodem", 9600);  // Search Phrase and speed
  
}

void draw() {
  
}

boolean activateSerialPort(String partOfPortName, int SerialSpeed) {
  boolean portIsActivated = false;
  int portIndex = -1;
  
  for(int i = 0; i < Serial.list().length; i++) {   // go thru all serial ports
    print(i);    
    
    if(Serial.list()[i].indexOf(partOfPortName) > 0) { // chech if name match
      portIndex = i;
      print("*");
    }
    println("\t" + Serial.list()[i]);
  }
  
  if(portIndex < 0 ) {
    println("Error: No serial port found - " + partOfPortName);
  }else{
    port = new Serial(this, Serial.list()[portIndex], SerialSpeed);
    println("Serial conection: " + Serial.list()[portIndex] + " speed: " + SerialSpeed);  // activate
  }
  return portIsActivated;  
}
