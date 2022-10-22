/*
naza2audio Java Client
Version 1.0
Neoklis Vaindirlis

Please insert your own google API key on the code below where it is indicated
Also mind the location of the text file where the GPS coordinates are saved
Have fun!!
*/
PImage map;
PImage img;
int zoomLevel =17;
double maCenterLat;
double mapCenterLon;
boolean r = false;

public void setup() {

size(640,640);
 img = loadImage("pin.png");
}

public void draw() {
 
  

String[] lines = loadStrings("/home/neoklis/location.txt");

  if (lines.length > 2){
for (int i = lines.length; i > 0; i = i-1) {

  if (lines[i-1].contains("E") && lines[i-4].contains("S")){
 if (maCenterLat != Double.parseDouble(lines[i-3]) && mapCenterLon != Double.parseDouble(lines[i-2])) r = true;
    maCenterLat = Double.parseDouble(lines[i-3]);
 mapCenterLon = Double.parseDouble(lines[i-2]);
  break;
}
}
}

if (r == true) {
  print(" S "); 
 String url = "https://maps.googleapis.com/maps/api/staticmap?center=" + maCenterLat + "," + mapCenterLon + "&zoom=" + zoomLevel + "&maptype=hybrid&size=640x640&sensor=false&key=inserthere";
  // insert your own api key in the end of the above string otherwise the app won't work
  map = loadImage(url, "png");
image(map, 0, 0);

image(img, 320, 320, 30, 30);  
r = false;

}
}

void keyPressed() {
  r = true;
  if (key == '1')  zoomLevel = 10;
  if (key == '2')  zoomLevel = 11;
  if (key == '3')  zoomLevel = 12;
  if (key == '4')  zoomLevel = 13;
  if (key == '5')  zoomLevel = 14;
  if (key == '6')  zoomLevel = 15;
  if (key == '7')  zoomLevel = 16;
  if (key == '8')  zoomLevel = 17;
  if (key == '9')  zoomLevel = 18;
  if (key == '0')  zoomLevel = 19;
  ;
 
}
