class enemyBullet extends GameObject {

  int bulletTimer, threshold;
  PVector aim;

  enemyBullet() {
  }

  //PVector _aim, 
  enemyBullet(float x, float y) {
    bulletTimer = 20;
    lives = 1;
    location = new PVector (x, y);
    //float vx = myHero.location.x - location.x;
    //float vy = myHero.location.y - location.y;
    velocity = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
    velocity.setMag(5);
    size = 5;
    //aim = _aim;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    threshold = 30;
  }

  void show() {

    stroke(255);
    fill(grey);
    ellipse(location.x, location.y, size, size);
  }

  void act() {

    super.act();
    location.add (velocity);
    
    bulletTimer--;
    if (bulletTimer <= 0) {
      lives = 0;
    }

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
  }
}
