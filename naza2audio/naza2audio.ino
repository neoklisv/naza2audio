
/*
Version 1.0
naza2audio

based on: 
NazaDecoder
RTTY Library

Neoklis Vaindirlis
*/


#include "RTTY.h"
#include <NazaDecoderLib.h>


void setup()
{
  Serial.begin(115200);
    
  RTTY.attach(9);
}



void loop()
{                                                  
  // Process Naza Information
  if(Serial.available())
  {
    uint8_t decodedMessage = NazaDecoder.decode(Serial.read());
    switch (decodedMessage)
    {
      case NAZA_MESSAGE_GPS:
        int gps_fixtype = NazaDecoder.getFixType();          // 0 = No GPS, 1 =No Fix, 2 = 2D Fix, 3 = 3D Fix  
        int sat_visible =  NazaDecoder.getNumSat();          // numbers of visible satelites
        int gps_status = (sat_visible*10) + gps_fixtype; 
        if(gps_fixtype == 3)  {
          double latitude = NazaDecoder.getLat();
          double longitude = NazaDecoder.getLon();
          char latt[9];
          char lonn[9];

          
         
          

          
            RTTY.tx("ARMD");
            RTTY.rtty_txbyte('\n');
               RTTY.tx("S");
                RTTY.rtty_txbyte('\n');
                dtostrf(latitude, 8, 6, latt);
            RTTY.tx(latt);
             RTTY.rtty_txbyte('\n');
              dtostrf(longitude, 8, 6, lonn);
             RTTY.tx(lonn);
       
            RTTY.rtty_txbyte('\n');
            RTTY.tx("E");
          RTTY.rtty_txbyte('\n');
       
           
        }       
        
        break;
      
    }
    
  }


} 

