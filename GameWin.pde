void gameWin() {
  
  background (darkGreen);
  
  textFont(forest);
  textSize(50);
  text("Wow you can actually", 400, 100);
  text("accomplish something", 400, 175);
  
  image(trophy, 300, 200, 200, 200);
  
  textSize(25);
  text("Here is your poorly-rendered trophy", 400, 400);
  
  continueButton = new Button ("MENU", 400, 475, 200, 50, lightBrown, darkBrown);
  drawContinueButton();
  
}

void drawContinueButton() {
  
   continueButton.show();

  if (continueButton.clicked) {
    setup();
    mode = INTRO;
  }
  
}

void gameWinClicks() {
  
}
