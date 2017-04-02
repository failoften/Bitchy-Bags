void serialEvent(Serial xbee) {
  // read a byte from the port:
  int thisByte = xbee.read();

  // if the byte = 0x7E, the value of a start byte, you have a new packet:
  if (thisByte == 0x7E) {   // start byte

    // parse the previous packet if there's data:
    if (packet[2] > 0) {
      parseData(packet);
    }

    // reset the byte counter:
    byteCounter = 0;
  }

  // put the current byte into the packet at the current position:
  packet[byteCounter] = thisByte;

  //  increment the byte counter:
  byteCounter++;
}
