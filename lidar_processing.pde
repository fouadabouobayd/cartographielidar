import processing.serial.*;
Serial myPort;  // The serial port
int lf = 10;    // Linefeed in ASCII
String myString = null;
float x, y, angle;
float num;
float num2;
int i = 0;
float distance=0;

void setup() {
  // List all the available serial ports
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[0], 9600);

  size(1000,1000);
  noSmooth();
  background(0);
  translate(width/2, height/2);
  stroke(255);
  strokeWeight(3);  // Default
}

void draw() {

  while (myPort.available() > 0) {
    myString = myPort.readStringUntil(10);

      
      if (myString != null) {
      String[]data=myString.split(",");
      if(data.length== 2){
        distance=float(data[0]);
        angle=float(data[1]);
        println("Distance:",distance);
        println("Angle:",angle);
        println("length",data.length);
         
        }
      
     
      



       //angle = num * 0.0174533;
       x = (sin(angle)*distance + width/2);
       y = (cos(angle)*distance + height/2);
      
    }
   /* if (angle == 0 )
    {
      background(0);
      translate(width/2, height/2);
    }*/
    stroke(255);
    point(x, y);
  }
  myPort.clear();
}
