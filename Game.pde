void game() {

  drawRoom();
  drawGameObjects();
  drawMiniMap();
  drawDarknessCell();
  drawMiniMap();
  drawFlowerAmount();
  drawHotBar();
  //drawFamasBar();
  //drawRemmingtonBar();
  //drawDragonovBar();
}



void drawRoom() {
  background(wall);

  stroke(raft);
  strokeWeight(5);
  line(0, 0, 800, 600);
  line(800, 0, 0, 600);
  line(0, 300, 800, 300);
  line(400, 0, 400, 600);

  //draw exits
  //#1- find out which directions have exits
  northRoom = map.get(myHero.roomX, myHero.roomY-1);
  eastRoom = map.get(myHero.roomX+1, myHero.roomY);
  southRoom = map.get(myHero.roomX, myHero.roomY+1);
  westRoom = map.get(myHero.roomX-1, myHero.roomY);

  //#2- draw the doors that are exits
  noStroke();
  fill(raft);
  if (northRoom != #FFFFFF) {
    ellipse(width/2, height*0.1, 100, 100);
  }
  if (eastRoom != #FFFFFF) {
    ellipse(width*0.9, height/2, 100, 100);
  }
  if (southRoom != #FFFFFF) {
    ellipse(width/2, height*0.9, 100, 100);
  }
  if (westRoom != #FFFFFF) {
    ellipse(width*0.1, height/2, 100, 100);
  }

  stroke(raft);
  strokeWeight(5);
  rectMode(CENTER);
  fill(floor);
  rect(width/2, height/2, width*0.8, height*0.8);
}



void drawGameObjects() {

  for (int i = 0; i < myObjects.size(); i++) {
    GameObject obj = myObjects.get(i);
    if (obj.roomX == myHero.roomX && obj.roomY == myHero.roomY) {
      obj.show();
      obj.act();
      if (obj.lives <= 0) {
        myObjects.remove(i);
        i--;
      }
    }
  }
  println();
}


void drawDarknessCell() {
  rectMode(CORNER);
  int i = 0;
  while (i < darkness.size()) {
    darknessCell obj = darkness.get(i);
    obj.show();
    i++;
  }
  rectMode(CENTER);
}



void drawMiniMap() {

  pushMatrix();
  rectMode(CORNER);
  translate(25, 25);

  int size = 8;
  int x = 0;
  int y = 0;
  int i = 0;
  while (y < map.height) {
    color c = map.get(x, y);   
    noStroke();
    fill(c);
    square(x*size, y*size, size);
    x++;
    if (x > map.width-1) {
      x = 0;
      y++;
    }
    i++;
  }

  fill(lightGreen);
  square(myHero.roomX*size, myHero.roomY*size, size);
  popMatrix();
}

void drawFlowerAmount() {

  if (mode == GAME) {
    image(flowerPic, 645, 25);
    fill(#004cd3);
    text("Flowers: " +myHero.flowerAmount, 725, 25);
  }
}



void drawHotBar() {

  rectMode(CENTER);
  stroke(#ADADAD);
  strokeWeight(5);
  noFill();
  square(50, 550, 50);
  square(100, 550, 50);
  square(150, 550, 50);
  stroke(#7C7C7C);
  strokeWeight(3);
  square(50, 550, 45);
  square(100, 550, 45);
  square(150, 550, 45);
}

void drawFamasBar() {

  imageMode(CENTER);
  image(famasPic, 50, 550);
}

void drawRemmingtonBar() {

  image(remmington870Pic, 100, 550);
}

void drawDragonovBar() {

  image(dragonovSVUPic, 150, 550);
}

void selectedFamas() {

  stroke(#FFFF79);
  noFill();
  square(50, 550, 57);
}

void selectedRemmington() {

  stroke(#FFFF79);
  noFill();
  square(100, 550, 57);
}

void selectedDragonov() {

  stroke(#FFFF79);
  noFill();
  square(150, 550, 57);
}

void gameClicks() {
}
