void pause() { //===============================================ALL BUTTON DRAWBUTTON() FUNCTIONS IN INTRO TAB=============================================================

  background(lightGreen);
  imageMode(CORNER);
  //image(shrekPauseMenu, 0, 0, 800, 600);
  rectMode(CENTER);
  textSize(30);
  textMode(CORNER);
  fill(lightBrown);
  text("My XP: " +myHero.xp, 150, 75);
  exitButton = new Button ("x", 700, 75, 50, 50, lightBrown, darkBrown);
  hpButton = new Button ("+", 150, 250, 50, 50, lightBrown, darkBrown);
  text("+5 Health Points", 350, 250);
  speedButton = new Button ("+", 150, 350, 50, 50, lightBrown, darkBrown);
  text("+2 Speed", 275, 350);
  flowerButton = new Button ("+", 150, 450, 50, 50, lightBrown, darkBrown);
  text("+1 Flower", 290, 450);
  drawExitButton();
  drawHPButton();
  drawSpeedButton();
  drawFlowerButton();

  //text
  //text("XP:" +xp, 50, 75);
}

void drawExitButton() {

  exitButton.show();

  if (exitButton.clicked) {
    mode = GAME;
  }
}

void drawHPButton() {

  hpButton.show();
  if (hpButton.clicked && myHero.xp >= 10) {
    myHero.lives = myHero.lives + 5;
    myHero.xp = myHero.xp - 10;
    if (myHero.lives >= myHero.livesMax) myHero.lives = 150;
  }
}

void drawSpeedButton() {

  speedButton.show();

  if (speedButton.clicked && myHero.xp >= 5) {
    myHero.speed = myHero.speed + 2;
    myHero.xp = myHero.xp - 5;
    if (myHero.speed >= 10) myHero.speed = 10;
  }
}

void drawFlowerButton() {

 
  flowerButton.show();

  if (flowerButton.clicked && myHero.xp >= 5) {
    myHero.flowerAmount = myHero.flowerAmount + 1;
    myHero.xp = myHero.xp - 5;
  }
}

void pauseClicks() {
}
