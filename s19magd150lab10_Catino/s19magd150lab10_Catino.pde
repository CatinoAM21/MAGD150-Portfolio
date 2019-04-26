//Example code was used as base
PImage[] txtrs;
int current;
PShape sphere;

PImage back, 
  bottom, 
  front, 
  left, 
  right, 
  top, 
  txtr;
float x, y, z, 
  scale, xRotation, yRotation,
  u, v, uOffset, vOffset;
boolean showDiagnosticImages = true;

//camera vars
float angle, camSpeed, 
  lookAtX, lookAtY, lookAtZ, 
  upX, upY, upZ, 
  orthoScale, 
  viewDist, 
  extents = 250;
boolean orthographic;

void setup() {
  surface.setResizable(true);
  surface.setTitle("Moon Man ");
  pixelDensity(displayDensity());
  size(640, 420, P3D);
  background(64);
  noStroke();
  colorMode(RGB, 255, 255, 255);
  keys();
  drawObject();

  // Translation, rotation and scale of the cube.
  x = width / 2.0;
  y = height / 2.0;
  z = -500;
  scale = min(width, height) / 2.0;
  xRotation = 0;
  yRotation = 0;

  // The coordinates which map a 2-dimensional image
  // to the face of a 3 dimensional object are known
  // as u (the x-axis of the 2D image) and v (the
  // y-axis of the 2D image).

  u = 1;
  v = 1;

  // Since an image of one size and aspect could be
  // mapped to a 3D surface of an entirely different
  // size and aspect - for example, a square image of
  // 400 x 600 pixels could be mapped to a triangle -
  // it is easier to to think of the texture's dimensions
  // as 1:1. This is done with textureMode(NORMAL);

  textureMode(NORMAL);

  // What happens when the u v coordinates exceed 1:1?
  // If the texture is clamped, the excess space will
  // be a streak, but setting textureWrap(REPEAT) will
  // let us tile and pattern a texture.

  textureWrap(REPEAT);

  // Just as u and v cordinates are designed for scaling,
  // they can also be offset. Texture offsetting can be
  // used to simulate scrolling.

  uOffset = 0;
  vOffset = 0;

  // Load the images which will be fed into the texture(s).
  front = loadImage("front.png");
  right = loadImage("right.png");
  back = loadImage("back.png");
  left = loadImage("left.png");
  bottom = loadImage("bottom.png");
  top = loadImage("top.png");
  txtr = loadImage("txtr5.jpg");
  
  //defined camera vars
    angle = 0;
  camSpeed = 5.0;
  x = width / 2.0;
  y = height / 2.0;
  z = viewDist = (height / 2.0) / tan(PI * 60.0 / 360.0);
  lookAtX = x;
  lookAtY = y;
  lookAtZ = 0;
  upX = 0;
  upY = 1;
  upZ = 0;
  orthoScale = 2.0;
  orthographic = false;
  
}

void draw() {
  background(32);
  lights();
  //additional light sources
  directionalLight(255, 255, 255, 0, 0.5, -1);
  pointLight(127, 0, 0, width, height, 0);
  pointLight(0, 0, 127, 0, height, 0);
  // If the right mouse button is pressed, then scale
  // the UV map. Otherwise, rotate the cube based on
  // the mouse's location.
  
  
  
  if (mousePressed) {
    if (mouseButton == RIGHT
      && mouseX > 0 && mouseY > 0
      && mouseX < width && mouseY < height) {
      u = map(mouseX, 0, width, 0.5, 10);
      v = map(mouseY, 0, height, 0.5, 10);
    }
  } else {
    xRotation = map(mouseY, -height * 0.5, height * 0.5, 0, TWO_PI);
    yRotation = map(mouseX, -width  * 0.5, width  * 0.5, 0, TWO_PI);
  }

  // Use the arrow keys to offset the texture.
  // Press the space bar to reset to default.

  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == LEFT) {
        uOffset -= 0.01;
      } else if (keyCode == RIGHT) {
        uOffset += 0.01;
      } else if (keyCode == UP) {
        vOffset += 0.01;
      } else if (keyCode == DOWN) {
        vOffset -= 0.01;
      }
    } else if (key == ' ') {
      u = 1;
      v = 1;
      uOffset = 0;
      vOffset = 0;
    }
    
  
    
      sphere.rotateY(0.01);
  sphere.rotateX(0.02);
  sphere.rotateZ(0.03);
  
 
  }

  // Translate, rotate and scale.
  pushMatrix();
  translate(x, y, z);
  rotateY(yRotation);
  rotateX(xRotation);
  scale(scale);

  beginShape();

  // The ternary operator is a shortcut for if-else
  // statements. If show diagnostic images is true,
  // then this texture will be the front image;
  // otherwise, it will be the texture.

  texture(showDiagnosticImages ? front : txtr);
  vertex(-1, -1, 1, uOffset, vOffset);
  vertex(1, -1, 1, uOffset + u, vOffset);
  vertex(1, 1, 1, uOffset + u, vOffset + v);
  vertex(-1, 1, 1, uOffset, vOffset + v);
  endShape(CLOSE);

  beginShape();
  texture(showDiagnosticImages ? right : txtr);
  vertex(1, -1, 1, uOffset, vOffset);
  vertex(1, -1, -1, uOffset + u, vOffset);
  vertex(1, 1, -1, uOffset + u, vOffset + v);
  vertex(1, 1, 1, uOffset, vOffset + v);
  endShape(CLOSE);

  beginShape();
  texture(showDiagnosticImages ? back : txtr);
  vertex(1, -1, -1, uOffset, vOffset);
  vertex(-1, -1, -1, uOffset + u, vOffset);
  vertex(-1, 1, -1, uOffset + u, vOffset + v); 
  vertex(1, 1, -1, uOffset, vOffset + v);
  endShape(CLOSE);

  beginShape();
  texture(showDiagnosticImages ? left : txtr);
  vertex(-1, -1, -1, uOffset, vOffset);
  vertex(-1, -1, 1, uOffset + u, vOffset);
  vertex(-1, 1, 1, uOffset + u, vOffset + v);
  vertex(-1, 1, -1, uOffset, vOffset + v);
  endShape(CLOSE);

  beginShape();
  texture(showDiagnosticImages ? bottom : txtr);
  vertex(-1, 1, 1, uOffset, vOffset);
  vertex(1, 1, 1, uOffset + u, vOffset);
  vertex(1, 1, -1, uOffset + u, vOffset + v);
  vertex(-1, 1, -1, uOffset, vOffset + v);
  endShape(CLOSE);

  beginShape();
  texture(showDiagnosticImages ? top : txtr);
  vertex(-1, -1, -1, uOffset, vOffset);
  vertex(1, -1, -1, uOffset + u, vOffset);
  vertex(1, -1, 1, uOffset + u, vOffset + v);
  vertex(-1, -1, 1, uOffset, vOffset + v);
  endShape(CLOSE);  
  popMatrix();
}

void mouseReleased() {
  if (mouseButton == LEFT) {
    showDiagnosticImages = !showDiagnosticImages;
  }
}
void mousePressed() {
  orthographic = !orthographic;
}
void drawObject(){
    pushMatrix();
  translate(width * 0.25, height / 2.0, -height / 1.5);
  sphere(height / 2.5);
  popMatrix();
}
void keys() {
  if (keyPressed) {
    if (y > 0
      && (key == 'w' || key == 'W' || keyCode == UP)) {
      y -= camSpeed;
      lookAtY = y;
    }
    if (x > -extents
      && (key == 'a' || key == 'A' || keyCode == LEFT)) {
      x -= camSpeed;
      lookAtX = x;
    }
    if (y < height - 10
      && (key == 's' || key == 'S' || keyCode == DOWN)) {
      y += camSpeed;
      lookAtY = y;
    }
    if (x < extents
      && (key == 'd' || key == 'D' || keyCode == RIGHT)) {
      x += camSpeed;
      lookAtX = x;
    }
    if (z > -extents
      && (key == 'q' || key == 'Q')) {
      if (orthographic) {
        orthoScale += 0.01;
      }
      z -= camSpeed;
      lookAtZ = z - viewDist;
    }
    if (z < extents
      && (key == 'e' || key == 'E')) {
      if (orthographic) {
        orthoScale -= 0.01;
      }
      z += camSpeed;
      lookAtZ = z - viewDist;
    }
  }
}
