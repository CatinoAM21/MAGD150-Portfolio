float buttonX, buttonY, w,h, rounding,
dilatedW, dilatedH, contractedW, contractedH, fadeTime,
textSize, dilatedTextSize, contractedTextSize,
catX,catY, catRadius, buttontwoX, buttontwoY, buttontwoRadius;

color hoverFill, inactiveFill, activeFill, fill;
boolean toggle;

void setup() {
  surface.setResizable(true);
  surface.setTitle("Television");
  pixelDensity(displayDensity());
  size(420, 420);
  background(64);
  
    rectMode(RADIUS);
  buttonX = width * 0.25;
  buttonY = height * 0.5;
  contractedW = 80;
  contractedH = 15;
  dilatedW = contractedW * 1.125;
  dilatedH = contractedH * 1.125;
  w = contractedW;
  h = contractedH;
  rounding = 5;

 colorMode(HSB, 390, 100, 100);
  hoverFill = color(210, 100, 100);
  inactiveFill = color(210, 100, 70);
  activeFill = color(270, 100, 100);
  fill = inactiveFill;
  fadeTime = 0.05;
  
   textAlign(CENTER, CENTER);
  contractedTextSize = 16;
  dilatedTextSize = 20;
  textSize = contractedTextSize;
  
   ellipseMode(RADIUS);
  catX = width * 0.75;
  catY = height * 0.5;
  catRadius = 75;
  
  
   ellipseMode(RADIUS);
  buttontwoX= width * 0.99;
  buttontwoY= height * 0.7;
  buttontwoRadius = 50;
  

  

}

void draw() {
  background(32);

  // Calculate the button's size and color based on whether
  // or not the mouse is hovering over it.
  if (mouseX > buttonX - w
    && mouseX < buttonX + w
    && mouseY > buttonY - h
    && mouseY < buttonY + h) {
    // cursor(KEYWORD) allows you to change the cursor's
    // appearance based on a capitalized keyword.
    cursor(HAND);

    // lerpColor(fromColor, toColor, fadeTime);
    // Allows you to smoothly transition from one
    // color to another.
    fill = lerpColor(fill, hoverFill, fadeTime);

    w = lerp(w, dilatedW, fadeTime);
    h = lerp(h, dilatedH, fadeTime);
    textSize = lerp(textSize, dilatedTextSize, fadeTime);

    if (mousePressed) {
      fill = activeFill;
    }
  } else {
    cursor(ARROW);

    fill = lerpColor(fill, inactiveFill, fadeTime);

    w = lerp(w, contractedW, fadeTime);
    h = lerp(h, contractedH, fadeTime);
    textSize = lerp(textSize, contractedTextSize, fadeTime);
  }

  // Draw the play button.
  noStroke();
  fill(fill);
  rect(buttonX, buttonY, w, h, rounding);
  fill(0, 0, 100);
  textSize(textSize);
  text("Press Me!", buttonX, buttonY);

  // If the button is clicked, then draw a cat face.
  if (toggle) {
    noStroke();
    fill(0,0,0);
    ellipse(catX, catY, catRadius, catRadius);
    fill(0,0,0);
    ellipse(catX * 1.05, catY * 0.925, 
      catRadius / 2.0, catRadius / 2.0);
    fill(#FCFF21 );
    ellipse(catX * 0.915, catY * 0.925, 
      catRadius / 5.0, catRadius / 5.0);
    ellipse(catX * 1.085, catY * 0.925, 
      catRadius / 5.0, catRadius / 5.0);
    fill(#F488EA);  
    ellipse(catX * 0.990, catY * 1.000, catRadius/ 5.0, catRadius/ 5.0);
    fill(#FFFFFF);
 fill(#F488EA);
    arc(catX, catY * 1.05, 
      catRadius * 2 / 3.0, catRadius * 2 / 3.0, 
      0, PI);
      
   
  noStroke();
  fill(fill);
  ellipse(buttontwoX +100, buttonY +300, w,h);
  fill(0, 0, 100);
  textSize(textSize);
  text("CLICK ME!", buttonX, buttonY);

fill
rect(400,400,100,100);

   
  }
}
void mousePressed() {
  if (mouseX > buttonX - w
    && mouseX < buttonX + w
    && mouseY > buttonY - h
    && mouseY < buttonY + h) {
    toggle = !toggle;
  }
}
