void store() {

  imageMode(CORNER);

  background(255, 0, 0);

  image(shrekStore, 0, 0, width, height);

  fill(lightGreen);
  textFont(forest);
  textSize(50);
  text("Store", 400, 50);

  exitButton = new Button ("x", 700, 75, 50, 50, lightBrown, darkBrown);
  drawExitButton1();
  dragonovButton = new Button ("+", 150, 250, 50, 50, lightBrown, darkBrown);
  drawDragonovButton();
  remmingtonButton = new Button ("+", 150, 350, 50, 50, lightBrown, darkBrown);
  drawRemmingtonButton();
  onionButton = new Button ("+", 150, 450, 50, 50, lightBrown, darkBrown);
  drawOnionButton();

  fill(#004cd3);
  textMode(CORNER);
  textSize(30);
  text("Your Flowers: " +myHero.flowerAmount, 200, 150);
  image(flowerPic, 350, 135);

  fill(lightGreen);
  textMode(CORNER);
  textSize(30);
  text("Buy Dragonov-SVU", 350, 250);
  text("Buy Remmington-870", 370, 350);
  text("Buy Onion", 280, 450);

  fill(#004cd3);
  textMode(CORNER);
  textSize(15);
  text("Cost: 5 Flowers", 590, 255);
  text("Cost: 8 Flowers", 630, 355);
  text("Cost: 5 Flowers", 450, 455);
}

void drawExitButton1() {

  exitButton.show();

  if (exitButton.clicked) {
    mode = GAME;
  }
}

void drawDragonovButton() {

  dragonovButton.show();

  if (dragonovButton.clicked && myHero.flowerAmount >= 5) {
    myHero.hasDragonov = true;
    myHero.flowerAmount = myHero.flowerAmount - 5;
  }
}

void drawRemmingtonButton() {

  remmingtonButton.show();

  if (remmingtonButton.clicked && myHero.flowerAmount >= 8) {
    myHero.hasRemmington = true;
    myHero.flowerAmount = myHero.flowerAmount - 8;
  }
}

void drawOnionButton() {

  onionButton.show();

  if (onionButton.clicked && myHero.flowerAmount >= 5) {
    myHero.lives = myHero.lives = 20;
    myHero.flowerAmount = myHero.flowerAmount - 5;
  }
}
