//Example code was used as base for code

// Import PDF Library
import processing.pdf.*;

// Create a boolean (True or False) variable to
// tell Processing when to start and stop saving
// the screen information to a .pdf file.
boolean recordScreen;

// A String variable can be used to change
// the file name of the .pdf to be saved.
String fileName;

// It might be helpful to separate the content
// in draw from the mechanisms to record a pdf.
Page p;

void setup() {
  surface.setTitle("Save PDF");
  pixelDensity(displayDensity());
  size(600, 800);
  background(0);
  fileName = "Demotivational Poster";
  
  // Use the loadString function, defined at the
  // bottom of the main sketch .pde, to extract
  // the text from the text file and add it to the
  // page object.
  p = new Page(loadString("Demotivational.txt", "\n"));
}

void draw() {

  // Starts the recording.
  if (recordScreen) {
    beginRecord(PDF, fileName + ".pdf");
  }

  p.draw();

  // Ends the recording.
  if (recordScreen) {
    endRecord();
    recordScreen = false;
  }
}

// Turns the boolean to True, which begins
// the recording process in draw.
void mousePressed() {
  if (mouseButton == RIGHT) {
    recordScreen = true;
  }
  
}


String loadString(String filePath, String delimiter) {
  String[] lines = loadStrings(filePath);
  StringBuilder sbuilder = new StringBuilder();
  for (int i = 0, size = lines.length; i < size; ++i) {
    sbuilder.append(lines[i]);
    sbuilder.append(delimiter);
  }
  return sbuilder.toString();
  
  
  
}
