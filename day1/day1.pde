String tau = "628318530717958647692528676";

void setup() {
  size(1024, 1024);
}

void draw() {
  background(240);
  stroke(20, 30, 40);
  strokeWeight(2.5);
  noFill();

  translate(width/2, height/2);

  beginShape();
  vertex(0, 0);

  final float dr = min(width, height) * 0.019;
  float r = 0;
  float lastAngle = TAU - ((int)(tau.charAt(0)) - 0x30) * TAU/10.0;

  for(char c: tau.substring(1).toCharArray()) {
    int digit = (int)c - 0x30;
    float angle = TAU - digit * TAU/10.0;
    float direction = Math.signum(sin(abs(angle - lastAngle)));
   
    strokeCap(SQUARE);
    line(cos(lastAngle) * r, sin(lastAngle) * r, cos(lastAngle) * (r + dr), sin(lastAngle) * (r + dr));

    r += dr;
    strokeCap(ROUND);
    if(direction >= 0) {
      arc(0, 0, r * 2.0, r * 2.0, min(angle, lastAngle), max(angle, lastAngle));
    } else {
      arc(0, 0, r * 2.0, r * 2.0, max(angle, lastAngle), min(angle, lastAngle) + TAU);
    }

    lastAngle = angle;
  }


  endShape();
  
  noLoop();
}

void mouseClicked() {
  save("day1.png");
  println("Saved image");
}
