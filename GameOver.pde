void gameOver() {
  
  imageMode(CORNER);
  image(shrekPauseMenu, 0, 0, 800, 600);
  
  fill(darkGreen);
  textFont(forest);
  textSize(50);
  text("Wow you're kinda bad", 403, 103);
  fill(lightGreen);
  text("Wow you're kinda bad", 400, 100);
  textSize(30);
  
  menuButton = new Button ("MENU", 400, 450, 200, 50, darkGreen, lightGreen);
  
  drawMenuButton();
  
}

void drawMenuButton() {
  
   menuButton.show();

  if (menuButton.clicked) {
    mode = INTRO;
    setup();
  }
  
}

void gameOverClicks() {
  
}
