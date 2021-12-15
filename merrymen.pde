class merrymen extends enemy {

  animatedGif currentAction;
  
  merrymen(int x, int y) {

    super(MERRYMEN_HP, MERRYMEN_SIZE, x, y);
    //location = new PVector (random(width*0.1+size/2, width*0.9-size/2), random(height*0.1+size/2, height*0.9+size/2));
    bulletTimer = 0;
    threshold = 30;
    xp = 5;
    currentAction = merrymenG;
  }

  void show() {

    stroke(0);
    strokeWeight(3);
    fill(merrymen);
    //circle(location.x, location.y, size);
    currentAction.show(location.x, location.y, size, size);
    fill(0);
    textSize(15);
    text(lives, location.x, location.y);
  }

  void act() {

    super.act();
    
    bulletTimer++;
    if (bulletTimer >= threshold) {
      myObjects.add(new enemyBullet(location.x, location.y));
      bulletTimer = 0;
    }
  }
}
