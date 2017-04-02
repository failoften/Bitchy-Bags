/*
 Once you've got a packet, you need to extract the useful data.
 This method gets the address of the sender and RSSI.
 */
void parseData(int[] thisPacket) {

  // read the address. It's a two-byte value, so you
  // add the two bytes as follows:
  address = thisPacket[5] + thisPacket[4] * 256;

  // get RSSI:
  rssi = thisPacket[6];

}
