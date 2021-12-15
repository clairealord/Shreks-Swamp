class knight extends enemy {
  
  animatedGif currentAction;
  
  knight(int x, int y) {
    
    super(KNIGHT_HP, KNIGHT_SIZE, x, y);
    xp = 5;
    currentAction = knightG;
    
  }
  
  void show() {

    stroke(0);
    strokeWeight(3);
    fill(knight);
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
    
    
  }
  
}
