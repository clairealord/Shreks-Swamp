class darknessCell {
  
  float opacity;
  float x, y, size;
  float d;
  
  darknessCell(float _x, float _y, float s) {
    
    size = s;
    x = _x;
    y = _y;
    opacity = 0;
    
  }
  
  void show() {
    
    noStroke();
    fill(0, 0, 0, opacity);
    d = dist(x, y, myHero.location.x, myHero.location.y);
    opacity = map(d, 0, 300, 0, 275);
    square(x, y, size);
    
  }
  
  void act() {
    
    
    
  }
  
}
