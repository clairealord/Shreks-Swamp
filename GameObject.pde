class GameObject {

  int roomX, roomY;
  PVector location;
  PVector velocity;
  int hp, hpMax;
  int damage;
  int lives, livesMax;
  int speed;
  int size;
  int c;
  int xp;

  GameObject() {

    location = new PVector (width/2, height/2);
    velocity = new PVector (0, 0);
    hp = 1;
    lives = 1;
  }

  void show() {
  }

  void act() {

    //moving
    location.add(velocity);

    //check for hitting walls = if (location.x < blah) location.x = blah;
    if (location.x < width*0.1) location.x = width*0.1;
    if (location.x > width*0.9) location.x = width*0.9;
    if (location.y < height*0.1) location.y = height *0.1;
    if (location.y > height*0.9) location.y = height*0.9;
  }
  
  // in room with ==============================================================================================================================================================
  
  boolean inRoomWith(GameObject myObj) {
    return (roomX == myObj.roomX && roomY == myObj.roomY);
  }

// colliding ===================================================================================================================================================================
  boolean isCollidingWith(GameObject myObj) {
    float d = dist(myObj.location.x, myObj.location.y, location.x, location.y);
    if (inRoomWith(myObj) && d < size/2 + myObj.size/2)
      return true;
    else
      return false;
  }
  
  // ============================================================================================================================================================================
  
  void particles(int n) {
    int i = 0;
    myObjects.add(new particles(location.x, location.y));
    while (i < n) {
      myObjects.add(new particles(location.x, location.y));
      i++;
    }
  }
  
}
