void draw() {
  // if you have new data and it's valid (>0), graph it:
  if ((rssi > 0 ) && (rssi != lastReading)) {

    // set the background:
    background(0);

    // set the bar height and width:
    // rssi should range from 92 to 0:
    int rectHeight = 92 - rssi;
    int rectWidth = 50;

    // draw the rect:
    stroke(23, 127, 255);
    fill (23, 127, 255);
    rect(width/2 - rectWidth, height-rectHeight, rectWidth, height);

    // write the number:
    text("Xbee Radio Signal Strength test", 10, 20);
    text("From: " + hex(address), 10, 40);
    text ("RSSI: -" + rssi + " dB", 10, 60);

    // save the current byte for next read:
    lastReading = rssi;
  }
  
  
    if (theVolume < 1) {
    theVolume = theVolume + 0.005;
    myChannel.volume(theVolume);
  }

  if (theVolume > 0) {
    theVolume = theVolume - 0.005;
    myChannel.volume(theVolume);
  }

}


public void stop() {  
  Ess.stop();  
  super.stop();  
}
