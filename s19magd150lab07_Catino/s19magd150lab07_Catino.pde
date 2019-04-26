// Base code from example code / *((The Nature of Code Daniel shiffman http:// natureofcode.com))

// The current idea is to have a 'malfunctioning' carousel
//When the use moves the mouse the illusion of the 'horses' transforming on said carousel
// either that or as the mouse is moved the carousel will 'spin' and horses move


PVector center1, center2, center3, center4, 
  sample1, sample2, sample3, sample4, 
  scale;
float theta;



//set up for an array
Carousel Carousels;
//sets up balloons
Balloon balloon;

void setup(){
    surface.setResizable(true);
  surface.setTitle("Carousel");
  pixelDensity(displayDensity());
  size(420, 420);
  background(64);
  Carousels = new Carousel();
  balloon = new Balloon();

}


void draw() {

  
  background(255);
//draws Carousel
  Carousels.display();
  Carousels.update();
//Updates and draws balloon
balloon.display();
balloon.update();
  }
