#include "ESP8266WiFi.h" 
#include "FirebaseArduino.h" 
#include "DHT.h" 

#define FIREBASE_HOST "agrotec-bf30e.firebaseio.com" 
#define FIREBASE_AUTH "YrthQwdGJbSeGOOuvTH4tSGv1OB6F9tAk9kijLgK" 

#define WIFI_SSID "LUCHO-2.4GHZ" 
#define WIFI_PASSWORD "991579412"
#define DHTPIN D5 
#define DHTTYPE DHT11 
DHT dht (DHTPIN, DHTTYPE);

void setup () {
  Serial.begin (9600);
  delay (1000);
  WiFi.begin (WIFI_SSID, WIFI_PASSWORD); 
  Serial.print ("Conectando a ");
  Serial.print (WIFI_SSID);
  while (WiFi.status()!= WL_CONNECTED) {
    Serial.print (".");
    delay (500);
  }
  Serial.println ();
  Serial.print ("Conectado a");
  Serial.print (" ");
  Serial.println (WIFI_SSID);
  Serial.print ("Direccion IP:");
  Serial.println (WiFi.localIP ()); 
  Firebase.begin (FIREBASE_HOST, FIREBASE_AUTH); 
  dht.begin (); 
}
void loop () 
{
  int lectura=analogRead(A0);
  float h = dht.readHumidity (); 
  float t = dht.readTemperature (); 
  int s=map(lectura,1023,0,0,100);
  if (isnan (h) || isnan (t)) {
    Serial.println ("Fallo al leer datos del sensor DHT11");
    delay(5000);
    return;
  } 
  
   if(isnan(s)){
   Serial.println("fallo al leer datos del hidrometro");
   delay(5000);
   return;
   } 
   
  Serial.print ("Humedad: "); Serial.print (h);
  //String firebaseHumed = String (h) + String ("%"); 
  Serial.print ("% ; Temperatura: "); Serial.print (t); Serial.println ("°C");
  //String firebaseTemp = String (t) + String ("°C"); 
  Serial.print ("Humedad de suelo: "); Serial.print (s);
  //String firebaseSuelo = String (s) + String ("%"); 
  delay (5000);
  
  Firebase.pushFloat ("Humedad", h);
  Firebase.pushFloat ("Temperatura", t); 
  Firebase.pushInt ("Suelo", s);   
  Firebase.setFloat("HumeActual",h);
  Firebase.setFloat("TempActual",t);
  Firebase.setInt("SueloActual",s);
  
} 
