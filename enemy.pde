class enemy extends GameObject {

  int threshold;
  int bulletTimer;
  float bulletSpeed;
  int chance;
  animatedGif currentAction;

  enemy() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    lives = 100;
    roomX = 1;
    roomY = 1;
    size = 60;
    threshold = 30;
    bulletTimer = 150;
    bulletSpeed = 5;
    xp = 5;
    currentAction = guardG;
  }

  enemy(int x, int y) {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    roomX = x;
    roomY = y;
    size = 60;
    lives = 100;
    xp = 5;
    currentAction = guardG;
  }

  enemy(int _lives, int s, int x, int y) {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    lives = _lives;
    roomX = x;
    roomY = y;
    size = s;
    lives = 100;
    xp = 5;
    currentAction = guardG;
  }

  void show() {

    stroke(0);
    strokeWeight(3);
    fill(guard);
    //circle(location.x, location.y, size);
    currentAction.show(location.x, location.y, size, size);
    fill(0);
    textSize(15);
    text(lives, location.x, location.y);
  }

  void act() {

    super.act();

    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof heroBullet && isCollidingWith(obj)) {
        lives = lives - int(obj.velocity.mag());
        obj.lives = 0;
        if (lives <= 0) {
          myHero.xp = myHero.xp + xp;
          myObjects.add(new message(location.x, location.y, roomX, roomY));
          chance = int (random(0, 4));
          if (chance == 0) myObjects.add(new droppedItem(location.x, location.y, roomX, roomY));
          if (chance == 1) myObjects.add(new droppedItem(location.x, location.y, roomX, roomY));
          if (chance == 2) myObjects.add(new droppedItemO(location.x, location.y, roomX, roomY));
          if (chance == 3) myObjects.add(new droppedItemF(location.x, location.y, roomX, roomY));
          //myObjects.add(new droppedItem(location.x, location.y, roomX, roomY));
          //myObjects.add(new droppedItemO(location.x, location.y, roomX, roomY));
          //myObjects.add(new droppedItemF(location.x, location.y, roomX, roomY));
        }
      }
      i++;
    }
  }
}
