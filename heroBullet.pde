class heroBullet extends GameObject {

  int bulletTimer;
  int c;
  PVector aim;

  heroBullet(PVector _aim, int _colour, int _size) {

    bulletTimer = 150;
    location = new PVector (myHero.location.x, myHero.location.y);
    size = 5;
    c = _colour;
    aim = _aim;
    size = _size;
    lives = 1;
    velocity = aim;
    //velocity.add(myHero.velocity);
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  void show() {

    noStroke();
    fill(c);
    ellipse(location.x, location.y, size, size);
  }

  void act() {

    location.add(velocity);
    bulletTimer--;
    //if (bulletTimer <= 0) {
    //  lives = 0;
    //}

    if (location.x < width*0.1) {
      location.x = width*0.1;
      lives = 0;
    }
    if (location.x > width*0.9) {
      location.x = width*0.9;
      lives = 0;
    }
    if (location.y < height*0.1) {
      location.y = height *0.1;
      lives = 0;
    }
    if (location.y > height*0.9) {
      location.y = height*0.9;
      lives = 0;
    }

    if (lives <= 0) {
      myObjects.add(new particles(location.x, location.y));
      myObjects.add(new particles(location.x, location.y));
      myObjects.add(new particles(location.x, location.y));
      myObjects.add(new particles(location.x, location.y));
      myObjects.add(new particles(location.x, location.y));
    }
  }
}
