//Claire Lord
//Oct. 20, 2020
//Shrek's House

//settings: dropped item types
final int ONION = 0;
final int GUN = 1;
final int FLOWER = 2;

//settings: enemies
final int GUARD_HP = 100;
final int GUARD_SIZE = 30;

final int KNIGHT_HP = 100;
final int KNIGHT_SIZE = 60;

final int MERRYMEN_HP = 75;
final int MERRYMEN_SIZE = 60;

final int THELONIUS_HP = 125;
final int THELONIUS_SIZE = 70;
final int THELONIUS_THRESHOLD = 300;

final int FARQUAAD_HP = 300;
final int FARQUAAD_SIZE = 40;
final int FARQUAAD_THRESHOLD = 300;

final int ENEMY_BULLET_SPEED = 5;

//settings: weapons
final int REMMINGTON_THRESHOLD = 100;
final int REMMINGTON_BULLETSPEED = 5;
final int DRAGONOV_THRESHOLD = 100;
final int DRAGONOV_BULLETSPEED = 20;
final int FAMAS_THRESHOLD = 10;
final int FAMAS_BULLETSPEED = 5;

int mode;
final int INTRO = 0;
final int GAME= 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int GAMEWIN = 4;
final int STORE = 5;
final int HELP = 6;

//shrek colour palette
color grey         = #8F927F;
color darkGreen    = #A8B46A;
color lightGreen   = #D2F135;
color lightBrown   = #6F452A;
color darkBrown    = #472C1A;
color darkerGreen  = #486000;

//house color palette
color wall  = #D9CEB2;
color floor = #817250;
color raft  = #635A45;

//enemy color palette
color farquaad  = #A20303;
color guard     = #959595;
color knight    = #1402C4;
color merrymen  = #005A0E;
color thelonius = #242424;

//gif variables
animatedGif house;

//fonts
PFont forest;

//keys
boolean wKey, aKey, sKey, dKey, spacekey, oneKey, twoKey, threeKey, escKey;

//game objects
ArrayList<GameObject> myObjects;
hero myHero;
ArrayList<darknessCell> darkness;

//button
boolean mouseReleased;
boolean hadPressed;
Button introButton;
Button exitButton;
Button hpButton;
Button speedButton;
Button flowerButton;
Button menuButton;
Button continueButton;
Button famasButton;
Button dragonovButton;
Button remmingtonButton;
Button onionButton;
Button helpButton;

//images
PImage map;
color northRoom, southRoom, eastRoom, westRoom;

//darkness
int x, y;

//items
PImage famasPic;
PImage dragonovSVUPic;
PImage remmington870Pic;
PImage onionPic;
PImage flowerPic;

//miscellanious items
PImage trophy;

//shrek sprite
animatedGif shrekUp;
animatedGif shrekDown;
animatedGif shrekLeft;
animatedGif shrekRight;

//enemy sprites
animatedGif guardG;
animatedGif knightG;
animatedGif merrymenG;
animatedGif theloniusG;
animatedGif farquaadG;

//background images
PImage shrekPauseMenu;
PImage shrekStore;

void setup() {

  size(800, 600, FX2D);

  mode = INTRO;

  imageMode(CORNER);

  house = new animatedGif(37, 3, "frame_", "_delay-0.05s.gif", 0, 0, width, height);

  //font setup
  forest = createFont("ForestRegular.ttf", 125);

  //create images for character
  map = loadImage("map.png");
  shrekUp = new animatedGif(3, 10, "shrek/forward/shrekSpriteForward_", ".png");
  shrekDown = new animatedGif(3, 10, "shrek/backward/shrekSpriteBack_", ".png");
  shrekLeft = new animatedGif(3, 10, "shrek/left/shrekSpriteLeft_", ".png");
  shrekRight = new animatedGif(3, 10, "shrek/right/shrekSpriteRight_", ".png");

  //create images for enemy sprites
  guardG = new animatedGif(2, 7, "enemies/guard/guard_", ".png");
  knightG = new animatedGif(2, 7, "enemies/knight/knight_", ".png");
  merrymenG = new animatedGif(2, 13, "enemies/merrymen/merrymen_", ".png");
  theloniusG = new animatedGif(2, 13, "enemies/thelonius/thelonius_", ".png");
  farquaadG = new animatedGif(2, 13, "enemies/farquaad/farquaad_", ".png");

  //item pictures
  famasPic = loadImage("items/famas.png");
  dragonovSVUPic = loadImage("items/dragonov.png");
  remmington870Pic = loadImage("items/remmington.png");
  onionPic = loadImage("items/onion.png");
  flowerPic = loadImage("items/flower.png");

  //misc pictures
  trophy = loadImage("items/trophy.png");

  //background pictures
  shrekPauseMenu = loadImage("background/shrekpausemenu.jpg");
  shrekStore = loadImage("background/shrekstore.jpg");

  //create objects
  myObjects = new ArrayList<GameObject> (1000);
  myHero = new hero();
  myObjects.add (myHero);
  //myObjects.add (new enemy());
  //myObjects.add (new knight(1, 2));
  //myObjects.add (new knight(2, 1));
  //myObjects.add (new merrymen(1, 3));
  //myObjects.add (new thelonius(3, 1));

  //create darkness
  int size = 3;
  darkness = new ArrayList<darknessCell>((width/size) * (height/size));
  int i = 0;
  while (y < height) {
    darkness.add(new darknessCell(x, y, size));                       
    x = x + size;
    if (x > width) {
      y = y +size;
      x = 0;
    }
    i++;
  }

  //loading the enemies from the map
  x = 0;
  y = 0;
  while (y < map.height) {
    color roomColor = map.get(x, y);
    if (roomColor == guard) {
      myObjects.add(new enemy(x, y));
    }
    if (roomColor == merrymen) {
      myObjects.add(new merrymen(x, y));
    }
    if (roomColor == knight) {
      myObjects.add(new knight(x, y));
    }
    if (roomColor == thelonius) {
      myObjects.add(new thelonius(x, y));
    }
    if (roomColor == farquaad) {
      myObjects.add(new farquaad(x, y));
    }
    x++;
    if (x == map.width) {
      x = 0;
      y++;
    }
  }
}

void draw() {

  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameOver();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEWIN) {
    gameWin();
  } else if (mode == STORE) {
    store();
  }else if (mode == HELP) {
    help();
  } else {
    println("error: mode = " + mode);
  }

  clicked();
}

void keyPressed() {

  if (key == 'w' || key == 'W') wKey     = true;
  if (key == 'a' || key == 'A') aKey     = true; 
  if (key == 's' || key == 'S') sKey     = true; 
  if (key == 'd' || key == 'D') dKey     = true; 
  if (key == ' ')               spacekey = true;
  if (key == 'p' || key == 'P' && mode == GAME) mode = PAUSE;
  if (key == '1')               oneKey   = true;
  if (key == '2')               twoKey   = true;
  if (key == '3')               threeKey = true;
  if (key == 'o' || key == 'O'&& mode == GAME) mode  = STORE;
}

void keyReleased() {

  if (key == 'w' || key == 'W') wKey     = false; 
  if (key == 'a' || key == 'A') aKey     = false; 
  if (key == 's' || key == 'S') sKey     = false; 
  if (key == 'd' || key == 'D') dKey     = false; 
  if (key == ' ')               spacekey = false;
  if (key == '1')               oneKey   = false;
  if (key == '2')               twoKey   = false;
  if (key == '3')               threeKey = false;
}

void clicked() {
  if (mousePressed) hadPressed = true;
  else if (hadPressed && !mousePressed) {
    mouseReleased = true;
    hadPressed = false;
  } else if (mouseReleased) mouseReleased = false;
}
