class animatedGif {

  int numFrames;
  PImage[] gif;
  int currentFrame;
  float x, y, w, h;
  int rate;

  animatedGif(int n, String prefix, String suffix) {
    gif = new PImage[n];
    loadImages(prefix, suffix);
    currentFrame = 0;
    rate = 7;
  }

  animatedGif(int n, int r, String prefix, String suffix, float _x, float _y, float _w, float _h) {
    gif = new PImage[n];
    loadImages(prefix, suffix);
    currentFrame = 0;
    rate = r;
  }
  
  animatedGif(int n, int r, String prefix, String suffix) {
    gif = new PImage[n];
    loadImages(prefix, suffix);
    currentFrame = 0;
    rate = r;
  }

  void show() {
    if (currentFrame >= gif.length) currentFrame = 0;
    image(gif[currentFrame], 0, 0, width, height);
    if (frameCount % rate == 0) currentFrame++;
  }
  
  void show(float x, float y, float w, float h) {
    if (currentFrame >= gif.length) currentFrame = 0;
    image(gif[currentFrame], x, y, w, h);
    if (frameCount % rate == 0) currentFrame++;
  }

  void loadImages(String prefix, String suffix) {
    int i = 0;
    while (i < gif.length) {
      String leadingZero = "";
      if (gif.length <= 37) leadingZero = "";
      else if (gif.length <= 100) {
        if (i < 37) leadingZero = "0";
        else leadingZero = "";
      } else if (gif.length > 100) {
        if (i < 37) leadingZero = "00";
        else if (i < 100) leadingZero = "0";
        else leadingZero = "";
      }
      gif[i] = loadImage(prefix+leadingZero+i+suffix);
      i++;
    }
  }
}
