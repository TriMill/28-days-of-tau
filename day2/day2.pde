String tau_binary = "010010000111111011010101000100010000101101000110000100011010011000100110001100110001010001011100000";

void setup() {
  size(2048, 2048);
}

void draw() {
  background(240);

  float x = 0;
  float place = 0.5;
  float value = 0;

  boolean parity = false;

  strokeWeight(2);
  strokeCap(SQUARE);
  for(char c: tau_binary.toCharArray()) {
    value += place * ((int)c - 0x30);
    float newX = x + (width - x) * 0.5;
    noStroke();
    if(parity) {
      fill(30, 45, 60);
    } else {
      fill(20, 30, 40);
    }
    float y = height*(value + place / 2.0);
    rect(x, height, newX - x, -y);
    noFill();
    stroke(240);
    arc((x + newX)/2, height - y, newX - x - 2, newX - x - 2, 0, TAU/2.0);
    if(parity) {
      stroke(30, 45, 60);
    } else {
      stroke(20, 30, 40);
    }
    arc((x + newX)/2, height - y, newX - x - 2, newX - x - 2, TAU/2.0, TAU);
    x = newX;
    place = place / 2.0;
    parity = !parity;
  }
  
  noLoop();
}

void mouseClicked() {
  save("day2.png");
  println("Saved image");
}
