class droppedItemF extends GameObject {

  int type;
  flower f;
  int flowerDrop;

  droppedItemF(float x, float y, int rx, int ry) {

    type = FLOWER;
    lives = 1;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    size = 20;
    roomX = rx;
    roomY = ry;
    c = lightBrown;

    flowerDrop = int (random(0, 4));

    if (flowerDrop == 0) {
      f = new flower();
    }
    if (flowerDrop == 1) {
      f = new flower();
    }
    if (flowerDrop == 2) {
    }
    if (flowerDrop == 3) {
    }
  }

  void show() {

    image(flowerPic, location.x, location.y);
  }

  void act() {
  }
}
