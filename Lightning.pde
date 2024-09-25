int startX = 200;
int startY = 55;
int endX = 200;
int endY = startY;

// change lightning color
int colorR = 255;
int colorG = 0;
int colorB = 0;
int randomChanceColor = (int)(Math.random() * 4) + 1;

// flower color
int petalR = 250;
int petalG = 176;
int petalB = 219;

int centerR = 250;
int centerG = 220;
int centerB = 147;

// change lightning thickness
float lightningThickness = 5;

int diameter = 10;

void setup() {
  size(400, 400);
  background(0, 0, 0);
  noFill();
  stroke(255, 255, 255);
  //frameRate(10);
}

void draw() {
  noStroke();
  // make color behind the lightning
  strokeWeight(lightningThickness * 5);
  // randomize the color between red/blue/purple
  if (randomChanceColor == 1) {
    // make lightning red
    stroke(255, 0, 0, 25);
  } else if (randomChanceColor == 2) {
    // make lightning blue
    stroke(0, 0, 255, 25);
  } else if (randomChanceColor == 3) {
    // make lightning light blue
    stroke(0, 255, 255, 25);
  } else {
    // make lightning purple
    stroke(122, 9, 250, 25);
  }
  line(startX, startY, endX, endY);

  // lightning fade
  stroke(255, 255, 255);
  strokeWeight(lightningThickness);
  endX = startX + (int)(Math.random()*20 - 10);
  endY = startY + (int)(Math.random()*15);
  line(startX, startY, endX, endY);

  startX = endX;
  startY = endY;

  // make lightning thinner as it goes down the line
  lightningThickness -= 0.1;

  // if lightning gets too thin, keep it at a minimum thinness
  if (lightningThickness < 1) {
    lightningThickness = 1;
  }
  // if the lightning goes offscreen keep it there so it doesn't keep running like that
  if (startY > 401) {
    startY = 401;
  }

  // clouds
  noStroke();
  // cloud in front
  fill(90);
  rect(20, 50, 100, 20, 5, 5, 5, 5);
  rect(50, 31, 100, 20, 5, 5, 5, 5);
  rect(80, 50, 100, 25, 5, 5, 5, 5);

  // cloud behind
  fill(150);
  rect(120, 50+5, 100, 20, 5, 5, 5, 5);
  rect(150, 55+5, 120, 25, 5, 5, 5, 5);
  rect(180, 40, 120, 20, 5, 5, 5, 5);
  rect(240, 25, 50, 20, 5, 5, 5, 5);
  rect(250, 40, 70, 25, 5, 5, 5, 5);
  rect(250, 60, 130, 20, 5, 5, 5, 5);

  fill(0, 0, 0, 25);
  rect(-30, -30, 500, 500);
  
}

void mousePressed()
{
  // when mouse pressed, reset the lightning bolt to a random x range between 150 and 250
  startX = (int)(Math.random() * 100 + 150);
  startY = 55;
  endX = startX;
  endY = startY;
  lightningThickness = 5;

  // randomize lightning color again for next time
  randomChanceColor = (int)(Math.random() * 4) + 1;
}
