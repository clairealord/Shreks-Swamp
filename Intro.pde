void intro() {

  house.show();

  //title
  imageMode(CORNER);
  textAlign(CENTER, CENTER);
  fill(darkGreen);
  textSize(25);
  textFont(forest);
  text("Shrek's", 404, 154);
  text("Swamp", 404, 254);
  fill(lightGreen);
  text("Shrek's", width/2, 150);
  text("Swamp", width/2, 250);

  rectMode(CENTER);
  introButton = new Button ("START", width/2, 400, 250, 100, lightBrown, darkBrown);
 
  drawIntroButton();
}

void drawIntroButton() {
  
  if (mousePressed) hadPressed = true;
  else if (hadPressed && !mousePressed) {
    mouseReleased = true;
    hadPressed = false;
  } else if (mouseReleased) mouseReleased = false;

  introButton.show();

  if (introButton.clicked) {
    mode = GAME;
  }
}

void introClicks() {

  //if (mouseX > 0 && mouseX < 800 && mouseY > 0 && mouseY < 600) {
  //  mode = GAME;
  //}
}
