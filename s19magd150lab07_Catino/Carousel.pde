// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Carousel{

  // The Carousel tracks position, velocity, and acceleration
  PVector position;
  PVector velocity;
  PVector acceleration;
  // The Carousel's maximum speed
  float topspeed, theta;
  float[]horses = new float[8];

  Carousel() {
    // Start in the center since the carousel will be moving based on the mouse.
    position = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 5;
    theta =0;
    for(int x = 0; x < horses.length; x++){
      
      horses[x]= x * PI/4;
    }
      
  }

  void update() {
        
    theta += .01;
    
  }

//scrap/ work on later
  void display() {
//8 line
pushMatrix();

translate (width/2, height/2);
rotate (theta);
fill(#800080);
ellipse(0,0, 100,100);
line(0,0,50*cos(0), 50*sin(0));
line(0,0,50*cos(PI/4), 50*sin(PI/4));
line(0,0,50*cos(PI/2), 50*sin(PI/2));
line(0,0,50*cos(3*PI/4), 50*sin(3*PI/4));
line(0,0,50*cos(PI), 50*sin(PI));
line(0,0,50*cos(5*PI/4), 50*sin(5*PI/4));
line(0,0,50*cos(3*PI/2), 50*sin(3*PI/2));
line(0,0,50*cos(7*PI/4), 50*sin(7*PI/4));

rectMode(CENTER);
for(int x = 0; x < horses.length; x++){
rect(50*cos(horses[x]), 50*sin(horses[x]), 10, 10);
}


popMatrix();
}
}
