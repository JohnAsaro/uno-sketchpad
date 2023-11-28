import processing.serial.*;
Serial myPort;

//initial vars
int drawX = 0; //set x to 0
int drawY = 0; //set y to 0
int prevX = 0; //set prev x to 0
int prevY = 0; //set prev y to 0

void setup() {
  //setup code, runs once
  size(1000, 1000); //1000x1000 window
  background(#C4C4C4); //bgcolor == white
  myPort = new Serial(this, Serial.list()[2], 9600); //adjust this to be the port you have your arduino uno plugged into
}

void draw() { 
  //looping code, outputs continuously 
   if (myPort.available() > 0) {
   String data = myPort.readStringUntil('\n'); //read string until ANY character
    if (data != null) { //if its not null
      // Split the data into label and value
      String[] pieces = split(data, ':'); //insert data into array, insert ints after label

      if (pieces.length == 2) { //if there is an array of two pieces
        String label = trim(pieces[0]); //label is the text part
        int value = int(trim(pieces[1])); //number is the int part

        // Process the values based on labels
        if (label.equals("Output X")) {
          // Print out output x
          println("Output X: " + value);
          prevX = drawX; //store the old X
          drawX = value; //set the new X
        } else if (label.equals("Output Y")) {
         // Print out output y
          println("Output Y: " + value);
          prevY = drawY; //store the old Y
          drawY = value; //set the new Y
      line(prevX, prevY, drawX, drawY); // Draw a line from the previous position to the new position
      }
    }
   }
  }
}
