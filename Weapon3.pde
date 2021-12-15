class remmington870 extends weapon {

  remmington870() {
    super(REMMINGTON_THRESHOLD, REMMINGTON_BULLETSPEED);
  }

  void shoot() {
    if (shotTimer >= threshold) {
      for (int i = 0; i <10; i++) {
        PVector aimVector = new PVector(mouseX-myHero.location.x, mouseY-myHero.location.y);
        aimVector.rotate(random(-PI/8, PI/8));
        aimVector.setMag(bulletSpeed);
        myObjects.add(new heroBullet(aimVector, grey, 10));
      }
      shotTimer = 0;
    }
  }
}
