/* 
PCO
by Chris Novello
chrisnovello.com

2013 note:
This is rough&quick code that I wrote over a weekend a few years back when I was learning to program. 
I figure others might like to tinker with it, just be warned that my design is from when I was starting and is kind of clumsy. 
If I ever find myself expanding it, I'll rewrite it, likely with a more robust regard for threads. 
All that said, I've used the program a lot (including dozens of live performances) and have yet to experience a single crash.

You'll need the oscP5 library.
http://www.sojamo.de/libraries/oscP5/

I've also released the code because it makes a quick way to change simple things like OSC ports & hosts, as well as the screen resolution.
As a result, I've cut the tiny GUI window that was in previous compiled releases.
*/

import processing.opengl.*;
import oscP5.*;
import netP5.*;

//Constants for OSC input and output ports - change these here if you want different ports.
final int PORT_FOR_INCOMING_OSC_MESSAGES = 8800;
final int PORT_FOR_OUTGOING_OSC_MESSAGES = 8801;

//By default, OSC messages are sent within this same machine (127.0.0.1 aka 'localhost')
//This can be changed so that OSC messages are sent to any remote machine on the network
final String ADDRESS_OUTGOING_OSC_MESSAGES_ARE_SENT_TO = "127.0.0.1";

 //OSC Ranges! Can easily change them across the program
  final float LOW = 0.0;
  final float HIGH = 1.0;
  final float MID = 0.5;

OscP5 oscP5;
NetAddress myRemoteLocation;
PaddleGame paddleGame;

void setup() {
  
  //Set the resoultion
  size(640, 480, OPENGL);  
  frameRate(30);
  oscP5 = new OscP5(this, PORT_FOR_INCOMING_OSC_MESSAGES);
  myRemoteLocation = new NetAddress(ADDRESS_OUTGOING_OSC_MESSAGES_ARE_SENT_TO, PORT_FOR_OUTGOING_OSC_MESSAGES);

  paddleGame = new PaddleGame(0, 0, width, height, "PCO");
}


void oscEvent(OscMessage theOscMessage) {
  
    String[] msgSplit = theOscMessage.addrPattern().split("/"); // splits OSC msg

    //If the OSC msg matches the name of the game
    if (msgSplit[1].equals(paddleGame.getName())) {

      //send the message along with the address it came in on
      paddleGame.parseMsg(msgSplit[2], theOscMessage);
    }
}


void draw() {
  paddleGame.play();
}




