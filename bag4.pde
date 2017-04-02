/* Language: Processing
 Original Xbee Signal Strength Reader code by Tom Igoe
 */

import processing.core.*;
import processing.serial.*;
import krister.Ess.*;

AudioChannel myChannel;  
float theVolume;

Serial xbee;                    // input serial port from the Xbee Radio
int[] packet = new int[22];     // with 5 samples, the Xbee packet is 22 bytes long
int byteCounter;                // keeps track of where you are in the packet
int rssi = 0;                   // received signal strength
int address = 0;                // the sending Xbee's address

Serial myPort;                  // The serial port

int fontSize = 18;              // size of the text on the screen
int lastReading = 0;               // value of the previous incoming byte

void setup () {
  size(400, 300);        // window size

  // create a font with the second font available to the system:
  PFont myFont = createFont(PFont.list()[2], fontSize);
  textFont(myFont);

  // get a list of the serial ports:
  println(Serial.list());
  // open the serial port attached to your Xbee radio:
  xbee = new Serial(this, Serial.list()[0], 9600);


  // start up Ess  
  Ess.start(this);  

  // load "Intro.mp3" into a new Channel  
  myChannel=new AudioChannel();  
  myChannel.loadSound("groove.mp3");  

  // start the sound looping forever  
  myChannel.play(Ess.FOREVER); 
}

