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
  size(550, 700);
  noLoop();
  f = createFont("Arial", 10);
  csv = loadStrings("flights2.csv");
  myData = new String[csv.length][4];
  for(int i=0; i<csv.length; i++) {
    myData[i] = csv[i].split(",");
  }
}

// DRAW
void draw() {
  beginRecord(PDF, "flights2.pdf");
  noStroke();

  for (int i = ini; i <= fin; i++) {
    fill(#202020);
    textFont(f);
    text(month[i], 10, map(i, ini, fin, 20, height-10));
    fill(225);
    //rect(40, 4+map(i, ini, fin, 10, height-20), width-50,2);
  }

  for(int i=0,j=0; i<myData.length; i = i+8,j++){
   fill(#2608E6);
   float yPos = map(j, ini, fin, 10, height-20);
   float xPos = 40;
   float firstDelay = float(myData[i][2]);
   float secondDelay = float(myData[i+2][2]);
   float thirdDelay = float(myData[i+4][2]);
   float fourthDelay = float(myData[i+6][2]);
   int DelayBar = int(firstDelay + secondDelay + thirdDelay + fourthDelay);
   rect(xPos, yPos, DelayBar/1000, 12);
   text("(Delayed)",40+DelayBar/1000,yPos);
   fill(#FFFFFF);
   text(DelayBar,(DelayBar/1000)-50,yPos+10);
   
   
   fill(#E64008);
   float firstOnTime = float(myData[i+1][2]);
   float secondOnTime = float(myData[i+3][2]);
   float thirdOnTime = float(myData[i+5][2]);
   float fourthOnTime = float(myData[i+7][2]);
   int OnTimeBar = int (firstOnTime + secondOnTime + thirdOnTime + fourthOnTime);
   rect(xPos, yPos+15, OnTimeBar/1000, 12);
   text("(On Time)",40+OnTimeBar/1000, yPos+15);
   fill(#FFFFFF);
   text(OnTimeBar,(OnTimeBar/1000)-50, yPos+25);
   //text();
   }

endRecord();
println("PDF Saved!");
}