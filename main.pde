OpenSimplexNoise noire; //I'm using OpenSimplexNoise, a library external to Processing
int period;
float step, scale;

void setup() {
  size(600, 600);
  colorMode(HSB);
  
  noire = new OpenSimplexNoise();
  period = 180;
  step = 12;
  scale = .01;
}

void draw() {
  background(0);
  
  for (int x = 0; x <= width; x += step)
    for (int y = 0; y <= height; y += step) {
      float mag, dst;
      mag = 500 * (float)noire.eval(x * scale, 0, cos(TWO_PI * frameCount / period), sin(TWO_PI * frameCount / period));
      dst = abs(height / 2 - y);
      stroke(map(dst, 0, height / 2, 0, 255), 255, 255);
      strokeWeight(map(dst, 0, height / 2, 7, 1));
      point(x, y + mag);
    }
}
