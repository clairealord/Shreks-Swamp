class weapon {
  
  int shotTimer;
  int threshold; //rate of fire
  int bulletSpeed; //speed of projectile
  
  weapon() {
    
    shotTimer = 0;
    threshold = 10;
    bulletSpeed = 10;
    
  }
  
  weapon(int thr, int bs) {
    
    shotTimer = 0;
    threshold = thr;
    bulletSpeed = bs;
    
  }
  
  void update() {
    
    shotTimer++;
    
  }
  
  void shoot() {
    
    if (shotTimer >= threshold) {
      PVector aimVector = new PVector (mouseX-myHero.location.x, mouseY-myHero.location.y);
      aimVector.setMag(bulletSpeed);
      myObjects.add(new heroBullet(aimVector, grey, 10));
      shotTimer = 0;
    }
    
  }
  
}
