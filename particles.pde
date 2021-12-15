class particles extends GameObject {

  int t;

  particles(float x, float y) {
    lives = 1;
    size = 10;
    t = 255;
    location = new PVector (x, y);
    velocity = new PVector (0, 10);
    velocity.rotate(random(0, TWO_PI));
    velocity.setMag(5);
  }

  void show() {

    noStroke();
    fill(grey, t);
    square(location.x, location.y, size/2);
  }

  void act() {
    
     super.act();
    t = t -20;
    if (t <= 0) lives = 0;
    
  }
}
