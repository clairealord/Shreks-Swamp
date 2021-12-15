class Button {

  //instance variables
  boolean clicked;
  float x, y, w, h;
  String text;
  color normal, highlight;
  


  Button(String t, float _x, float _y, float _w, float _h, color nor, color hig) {

    //constructor
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    clicked = false;
    text = t;
    highlight = hig;
    normal = nor;
  }



  //behaviour
  void show() {
    
    noStroke();
    fill(normal);
    
    rect(x, y, w, h, 30);
    rectMode(CENTER);
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      fill(highlight);
    } else {
      fill(normal);
    }
    rect(x, y, w, h, 30);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(w/4);
    text(text, x, y); 

    if (mouseReleased && mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      clicked = true;
    }else {
      clicked = false;
    }
  }
}
