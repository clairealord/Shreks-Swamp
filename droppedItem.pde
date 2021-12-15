class droppedItem extends GameObject {

  int type;
  weapon w;
  int gunDrop;

  droppedItem(float x, float y, int rx, int ry) {

    type = GUN;
    w = new remmington870();
    lives = 1;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    size = 20;
    roomX = rx;
    roomY = ry;
    c = lightBrown;


    gunDrop = int (random(0, 4));

    if (gunDrop == 0) {
      w = new famas();
      drawFamasBar();
    }
    if (gunDrop == 1) {
      w = new famas();
      drawFamasBar();
    }
    if (gunDrop == 2) {
      w = new remmington870();
      drawRemmingtonBar();
    }
    if (gunDrop == 3) {
      w = new dragonovSVU();
      drawDragonovBar();
    }
  }

  void show() {

    //stroke(0);
    //strokeWeight(2);
    //fill(c);
    //circle(location.x, location.y, size);
    
    image(dragonovSVUPic, location.x, location.y);
  }

  void act() {
    
  }
}
