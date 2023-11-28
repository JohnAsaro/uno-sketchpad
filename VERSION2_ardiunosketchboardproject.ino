//upload this first with breadboard plugged in, exit upload, run processing code

void setup() {
  //setup code, runs once
  Serial.begin(9600); //will print out values here
}

void loop() { 
  //looping code, outputs continuously 
  int outputX = map(analogRead(A1), 0, 1023, 0, 1000); //potentiometer for x value is connected to A1, limit output values from 0-1000
  int outputY = map(analogRead(A5), 0, 1023, 0, 1000); //potentiometer for y value is connected to A5, limit output values from 0-1000

  Serial.print("Output X:"); //label needed to tell x and y apart
  Serial.println(outputX); //output X

  Serial.print("Output Y:"); //label needed to tell x and y apart
  Serial.println(outputY); //output Y
  
  delay(1); //1 MS delay
}
