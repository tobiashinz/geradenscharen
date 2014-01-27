int amountOfSets, xPositionSet, yPositionSet, amountOfLinesInSet, lengthOfLinesInSet, lengthOfLine, backfill, angleAddition;
float rotationOfSet, angleOfLine, backfillX, backfillY;

void setup() {
  size(500, 500);
  background(255);
  amountOfSets = (int)random(1,3);
  amountOfSets = 3;
}
void draw() {
  drawStuff();
  noLoop();
}
void drawStuff() {
  System.out.println(amountOfSets);
  for(int i = 0; i < amountOfSets; i++) {
    int xPositionLineStart, yPositionLineStart, xPositionLineEnd, yPositionLineEnd;
    float xValLine, yValLine;
    
    // Startpunkt ermitteln
    xPositionSet = (int)random(0,width);
    yPositionSet = (int)random(0,height);
    
    xPositionLineStart = xPositionSet;
    yPositionLineStart = yPositionSet;
    
    // Anzahl der Linien
    amountOfLinesInSet = (int)random(15,30);
    
    // Länge der Linien
    lengthOfLinesInSet = (int)random(100, 170);
    
    // Winkeländerungen zwischen Linien
    rotationOfSet = random(0, 360);
    
    // Startwinkel
    angleOfLine = random(0, 45) + rotationOfSet;
    
    // Versatz bestimmen
    backfill = (int)random(-90, 10);
    
    // Linien malen
    for(int j = 0; j < amountOfLinesInSet; j++) {
      // Länge der Linie bestimmen
      lengthOfLine = (int)random(lengthOfLinesInSet-10, lengthOfLinesInSet+10);
      
      // trigonometrische Magie
      xValLine = lengthOfLine * cos((2 * PI) / 360 * angleOfLine);
      yValLine = sqrt((lengthOfLine * lengthOfLine) - (xValLine * xValLine));
      
      // Versatz einberechnen
      backfillX = backfill * cos((2 * PI) / 360 * angleOfLine);
      backfillY = sqrt((backfill * backfill) - (backfillX * backfillX));
      
      // Linie zeichnen
      line(xPositionLineStart + backfillX, yPositionLineStart + backfillY, xPositionLineStart + xValLine, yPositionLineStart + yValLine);
      
      // bestimmen wie viel der Winkel größer wird
      angleAddition = (int)random(2, 10);
      
      angleOfLine += angleAddition;
   }
    
    
    point(xPositionSet, yPositionSet);
    
  }
}


