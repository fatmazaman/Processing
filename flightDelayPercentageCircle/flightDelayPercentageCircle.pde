// LIBRARIES
import processing.pdf.*;

// GLOBAL VARIABLES
String csv[];
String myData[][];
PFont f;
int ini = 0;
int fin = 11;
String[] month = {"Jan", "Feb", "Mar", "April", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
// SETUP
void setup() {
  size(550, 750);
  noLoop();
  f = createFont("Arial", 10);
  csv = loadStrings("flight.csv");
  myData = new String[csv.length][4];
  for(int i=0; i<csv.length; i++) {
    myData[i] = csv[i].split(",");

  }
}

// DRAW
void draw() {
  beginRecord(PDF, "flights.pdf");
  noStroke();

  for (int i = ini; i <= fin; i++) {
    fill(#202020);
    textFont(f);
    text(month[i], 10, map(i, ini, fin, 10, height-40));
    fill(225);
    rect(40, 4+map(i, ini, fin, 10, height-50), width-50,2);
  }

  for(int i=0; i<myData.length; i++){
    fill(#AAF83D);
    //float yPos = map(i, ini, fin, 10, height-20);
    //float xPos = 40;
    //rect(xPos, yPos, (float(myData[i][3])*1000), 10);
    ellipse(40+(float(myData[i][3])*100), map(i, ini, fin, 10, height-50)+5, (float(myData[i][3])*100)-10, (float(myData[i][3])*100)-10);
    fill(#000000);
    text((float(myData[i][3])*100), (float(myData[i][3])*100)+65, map(i, ini, fin, 10, height-30));
    text("%", (float(myData[i][3])*100)+100, map(i, ini, fin, 10, height-30));
    }

endRecord();
println("PDF Saved!");
}