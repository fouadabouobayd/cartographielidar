#include <Servo.h>
#include <Wire.h>
#include <VL53L1X.h>

VL53L1X sensor;

int PIN_SERVO = 9;
/* Créer un objet Servo pour contrôler le servomoteur */
Servo monServomoteur;

void setup() {
  Serial.begin(9600);
  Wire.begin();

  // Attache le servomoteur à la broche D9
  monServomoteur.attach(PIN_SERVO);



  
  Wire.begin();
  Wire.setClock(400000); // use 400 kHz I2C

  sensor.setTimeout(5000);
  if (!sensor.init())
  {
    Serial.println("Failed to detect and initialize sensor!");
    while (1);
  }
  
  sensor.setDistanceMode(VL53L1X::Long);
  sensor.setMeasurementTimingBudget(15000);
  sensor.startContinuous(15);
  Serial.println("new program");
  
  



}
void writeString(String stringData) { // Used to serially push out a String with Serial.write()

  for (int i = 0; i < stringData.length(); i++)
  {
    Serial.write(stringData[i]);   // Push each char 1 by 1 on each loop pass
  }

}

void loop() {
 // monServomoteur.write(0);
  //delay(1000);

  // Fait bouger le bras de 0° à 180°
  for (int position = 0; position <= 180; position++) {
    //monServomoteur.write(position);

    Serial.println(String(sensor.read())+","+String(position)+"\n");

    delay(15);
  }
  

  for (int position = 180; position >= 0; position -= 1) {
    //monServomoteur.write(position);

    Serial.println(String(sensor.read())+","+String(position)+"\n");
   

    delay(15);
  }
  //delay(1000);

  
 



}
