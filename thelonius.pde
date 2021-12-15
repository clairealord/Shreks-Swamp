class thelonius extends enemy {

  animatedGif currentAction;
  
   thelonius(int x, int y) {

    super(THELONIUS_HP, THELONIUS_SIZE, x, y);
    //location = new PVector (random(width*0.1+size/2, width*0.9-size/2), random(height*0.1+size/2, height*0.9+size/2));
    bulletTimer = 0;
    threshold = 30;
    xp = 10;
    currentAction = theloniusG;
  }

  void show() {

    stroke(0);
    strokeWeight(3);
    fill(thelonius);
    //circle(location.x, location.y, size);
    currentAction.show(location.x, location.y, size, size);
    fill(0);
    textSize(15);
    text(lives, location.x, location.y);
  }

  void act() {

    super.act();
    
    velocity = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
    velocity.setMag(1);
    
    //if (lives <= 0) myObjects.add(new messageT(location.x, location.y, roomX, roomY));
    
    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof hero) {
        if (obj.roomX == roomX && obj.roomY == roomY) {
          float d = dist(obj.location.x, obj.location.y, location.x, location.y);
          if (d <= size/2 + obj.size/2) {
            obj.lives = 0; //gets rid of bullet
          }
        }
      }
      i++;
    }
    
    bulletTimer++;
    if (bulletTimer >= threshold) {
      myObjects.add(new enemyBullet(location.x, location.y));
      bulletTimer = 0;
    }
  }
}
