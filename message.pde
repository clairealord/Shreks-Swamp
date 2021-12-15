class message extends GameObject {
  
  message(float x, float y, int rx, int ry) {
    
    lives = 1;
    location = new PVector(x, y);
    velocity = new PVector(0, -0.01);
    rx = roomX;
    ry = roomY;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    velocity.setMag(5);
    
  }
  
  void show() {
    
    fill(lightGreen);
    textSize(20);
    text("+XP", location.x, location.y);
    
  }
  
  void act() {
    
    if (location.y <= height*0.1) {
      lives = 0;
    }
    
    location.add(velocity);
    
  }
  
}
