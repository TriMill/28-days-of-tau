color[] palette = {color(139, 47, 47), color(45, 118, 41), color(44, 70, 135), color(133, 44, 114)};
int[] indices = {0, 1, 2, 3, 2, 3, 0, 1, 3, 2, 1, 0, 1, 0, 3, 2};

void setup() {
  size(2048, 2048);
}

void draw() {
  background(240);

  strokeWeight(4);
  noFill();
  for(int x = 0; x < 4; x++) {
    for(int y = 0; y < 4; y++) {
      float cx = x*width/4 + width/8;
      float cy = y*height/4 + height/8;
      float rad = width/9;
      stroke(palette[indices[x + y * 4]]);
      int sides = x + y*2 + 2;
      beginShape();
      for(int a = 0; a < sides; a++) {
        float angle = -TAU/4 + (float)a/sides*TAU;
        vertex(cx + rad*cos(angle), cy + rad*sin(angle));
      }
      endShape(CLOSE);
      stroke(20, 30, 40);
      ellipse(cx, cy, rad*2 + 1, rad*2 + 1);
    }
  }
  
  noLoop();
}

void mouseClicked() {
  save("day3.png");
  println("Saved image");
}
