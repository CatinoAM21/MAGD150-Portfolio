class Page {
  int itr, pointsOnCircle, newDestTime;
  float moveSpeed, theta1, theta2, theta3, 
    scalar, diameter, rotSpeed;
  PVector position, destination;
  PFont header, body;
  String text;

  Page(String txt) {
    text = txt;
    itr = 25;
    pointsOnCircle = 100;
    newDestTime = 300;
    rotSpeed = 0.01;

    moveSpeed = 0.05;

    position = new PVector(width * 0.5, height * 0.5);
    destination = position.copy();

    // When creating pdfs, it's better to create a font
    // by selecting from the list which is printed in
    // the console below than to load a font.
    header = createFont(PFont.list()[356], 72);
    body = createFont(PFont.list()[0], 16);
  }

  void draw() {
    background(0);

    if (frameCount % newDestTime == 0) {
      destination = new PVector(random(0, width), random(0, height));
    }
    position = PVector.lerp(position, destination, moveSpeed);
    scalar = cos(theta1) * 200;
    theta1 += rotSpeed;

    for (int i = 0; i < itr; ++i) {
      theta3 = map(i, 0, itr, 0, TWO_PI);
      pushMatrix();
      translate(position.x + cos(theta3) * 15 * (i + 1), 
        position.y + sin(theta3) * 15 * (i + 1));
      rotate(theta1);
      for (int j = 0; j < pointsOnCircle; ++j) {
        noStroke();
        fill(map(j, 0, pointsOnCircle, 127, 255), 
          map(i, 0, itr, 54, 0), 
          map(i, 0, itr, 127, 255), 
          40);
        theta2 = map(j, 0, pointsOnCircle, 0, TWO_PI);
        diameter = map(j, 0, pointsOnCircle, 5, 50) * sin(theta2);
        ellipse(cos(theta2) * scalar, 
          sin(theta2) * scalar, 
          diameter, diameter);
      }
      popMatrix();
    }

    fill(255);
    textSize(72);
    textFont(header);
    textAlign(CENTER, CENTER);
    text("Inspiration", width * 0.5, 36);
    textFont(body);
    textSize(16);
    textAlign(LEFT, TOP);
    text(text, 10, 82);
  }
}
