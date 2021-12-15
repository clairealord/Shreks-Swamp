class hero extends GameObject {

  weapon myWeapon;
  onion myOnion;
  flower myFlower;
  animatedGif currentAction;
  int flowerAmount;

  boolean hasFamas;
  boolean hasRemmington;
  boolean hasDragonov;

  hero() {

    super();
    livesMax = 150;
    speed = 5;
    roomX = 1;
    roomY = 1;
    myWeapon = new famas();
    size = 75;
    lives = 100;
    currentAction = shrekUp;
    xp = 0;
    flowerAmount = 0;
    hasFamas = false;
    hasRemmington = false;
    hasDragonov = false;
  }

  void show() {
    imageMode(CENTER);
    textSize(20);
    fill(0);
    currentAction.show(location.x, location.y, size/1.5, size);
    text(myHero.lives, location.x, location.y, 20);
  }

  //void show() {

  //  fill(lightGreen);
  //  stroke(lightBrown);
  //  strokeWeight(3);
  //  circle(location.x, location.y, size);
  //  fill(0);
  //  textSize(15);
  //  text(lives, location.x, location.y);
  //}

  void act() {

    super.act();

    if (wKey) velocity.y = -speed;
    if (aKey) velocity.x = -speed;
    if (sKey) velocity.y = speed;
    if (dKey) velocity.x = speed;

    if (velocity.mag() > speed) {
      velocity.setMag(speed);
    }

    if (!wKey && !sKey) velocity.y = 0;
    if (!aKey && !dKey) velocity.x = 0;

    // character direction
    if (abs(velocity.y) > abs(velocity.x)) {
      if (velocity.y  >= 0) currentAction = shrekUp;
      else currentAction = shrekDown;
    } else {
      if (velocity.x > 0) currentAction = shrekRight;
      else currentAction = shrekLeft;
    }

    if (!wKey && !sKey && !aKey && !dKey) currentAction = shrekUp;

    //check exits
    //north
    if (northRoom != #FFFFFF && location.y == height*0.1 && location.x >= width/2-50 && location.x <= width/2+50) {
      roomY--;
      location = new PVector(width/2, height*0.9-10);
    }
    if (eastRoom != #FFFFFF && location.x == width*0.9 && location.y >= height/2-50 && location.y <= height/2+50) {
      roomX++;
      location = new PVector(width*0.1+10, height/2);
    }
    if (southRoom != #FFFFFF && location.y == height*0.9 && location.x <= width/2+50 && location.x >= width/2-50) {
      roomY++;
      location = new PVector(width/2, height*0.1+10);
    }
    if (westRoom != #FFFFFF && location.x == width*0.1 && location.y <= height/2+50 && location.y >= height/2-50) {
      roomX--;
      location = new PVector(width*0.9-10, height/2);
    }

    if (spacekey) {
      myWeapon.shoot();
      myWeapon.update();
    }

    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof enemyBullet && isCollidingWith(obj)) {
        lives = lives - int (obj.velocity.mag());
        obj.lives = 0; //gets rid of bullet
      }
      if (obj instanceof knight && isCollidingWith(obj)) {
        lives = lives - 5;
      }


      //dropped items----------------------------------------------------------------------------------------------------------------------------------------

      if (obj instanceof droppedItem && isCollidingWith(obj)) {
        droppedItem item = (droppedItem) obj;
        if (item.type == GUN) {
          myWeapon = item.w; //name of item in the constructor
          item.lives = 0;
        }
      }
      if (obj instanceof droppedItemO && isCollidingWith(obj)) {
        droppedItemO item = (droppedItemO) obj;
        if (item.type == ONION) {
          myOnion = item.o; //name of item in the constructor
          item.lives = 0;
          myHero.lives = myHero.lives + 20;
          if (lives > livesMax) lives = livesMax;
        }
      }
      if (obj instanceof droppedItemF && isCollidingWith(obj)) {
        droppedItemF item = (droppedItemF) obj;
        if (item.type == FLOWER) {
          myFlower = item.f; //name of item in the constructor
          item.lives = 0;
          flowerAmount = flowerAmount + 1;
        }
      }
      i++;
    }

    if (lives <= 0) mode = GAMEOVER;

    //hotbar ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    if (myWeapon instanceof famas) hasFamas = true;
    if (myWeapon instanceof remmington870) hasRemmington = true;
    if (myWeapon instanceof dragonovSVU) hasDragonov = true;

    if (hasFamas == true) drawFamasBar();
    if (hasRemmington == true) drawRemmingtonBar();
    if (hasDragonov == true) drawDragonovBar();

    //selectedFamas();
    //stroke(#FFFF79);
    //noFill();
    //square(50, 550, 57);

    if (hasFamas == true && oneKey == true) {
      myWeapon = new famas();
    }
    if (hasRemmington == true && twoKey == true) {
      myWeapon = new remmington870();
    }
    if (hasDragonov == true && threeKey == true) {
      myWeapon = new dragonovSVU();
    }

    if (myWeapon instanceof famas) {
      selectedFamas();
    }

    if (myWeapon instanceof remmington870) {
      selectedRemmington();
    }

    if (myWeapon instanceof dragonovSVU) {
      selectedDragonov();
    }

    
  }
}
