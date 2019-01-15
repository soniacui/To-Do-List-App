class Box {

  int x;
  int y;
  int w;
  int h;
  int d;
  String taskName;

  Box (String name) {
    x = 100;
    y = 100;
    w = 545;
    h = 100;
    d = 50;
    taskName = name;
  }

  void update(int i) {
    if (mouseX > x && (mouseX < (x + w))
      && (mouseY > (y + shift)) && (mouseY < (y + h + shift))) {
      //stroke (0);
      mouseOverAdd = true;
    } else {
      //stroke (255);
      mouseOverAdd = false;
    }

    if (i != 0) {
      if ((mouseX > (x + w + d - d/2)) && (mouseX < (x + w + d + d/2)) 
        && (mouseY > ((y * (i + 1)) - d/2 + shift)) && (mouseY > ((y * (i + 1)) + d/2 + shift))) {
        mouseOverX = true;
      }
    } else {
      mouseOverX = false;
    }
  }

  void show(int i) {  
    fill (255);
    rect (x, ((y * (i + 1)) + shift), w, h);
    if (i != 0) {
      ellipse (x + w + d, ((y * (i + 1)) + d + shift), d, d);
      fill (0);
      text ("X", x + w + d/2 + 18, ((y * (i + 1)) + d + 15 + shift));
      fill (0);
      textSize(32);
      text (taskName, x + 25, y * (i + 1) + 75 + shift);
    } else {
      fill (200);
      textSize(32);
      text (taskName, x + 25, y * (i + 1) + 75 + shift);
    }
  }
}
