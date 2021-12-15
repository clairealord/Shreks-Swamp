class droppedItemO extends GameObject {
  
  int type;
  onion o;
  int onionDrop;
  
  droppedItemO(float x, float y, int rx, int ry) {
    
    type = ONION;
    //o = new onion();
    lives = 1;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    size = 20;
    roomX = rx;
    roomY = ry;
    c = lightBrown;
    
    onionDrop = int (random(0, 4));

    if (onionDrop == 0) {
     o = new onion();
    }
    if (onionDrop == 1) {
      o = new onion();
    }
    if (onionDrop == 2) {
      
    }
    if (onionDrop == 3) {
     
    }
    
  }
  
  void show() {
    
    image(onionPic, location.x, location.y);
    
  }
  
  void act() {
    
    
    
  }
  
}
