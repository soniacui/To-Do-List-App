boolean mouseOverAdd = false;
boolean mouseOverX = false;
boolean clicked = false;
String saved = "";
String typing = "";
int boxNum;
float shift = 0;
ArrayList <Box> boxes = new ArrayList <Box>();
PImage background;

void setup() {
  size (800, 800);
  background = loadImage ("background.png");
  stroke(200);
  boxes.add (new Box("Click to add item"));
}

void draw() {
  
  background (background);

  for (int i = 0; i < boxes.size(); i++) {
    Box box = boxes.get(i);
    box.update(i);
    box.show(i);

    if (clicked) {  //create blank rectangle to write text on
      fill (255);
      rect (100, ((100 * (boxes.size() + 1)) + shift), 545, 100);
      fill (200);
      //println (frameCount);
      if (typing.equals("") && (frameCount % 70) < 35) { //blinking line
        line (125, ((100 * (boxes.size() + 1)) + 25 + shift), 125, ((100 * (boxes.size() + 1)) + 75 + shift));
      } else {
        text (typing, 125, ((100 * (boxes.size() + 1)) + 75 + shift));
      }
    }
  }
}

void mouseClicked() {
  if (mouseOverAdd) {
    clicked = true;
  }
  if (mouseOverX) {
    boxNum = ((mouseY - floor(shift))/ 100) - 1; // delete box
    boxes.remove (boxNum);
    println (boxes.size());
  }
}

void keyPressed() {
  if (clicked) {
    if (key == '\n') {
      saved = typing;
      typing = "";
      boxes.add (new Box(saved));
      clicked = false;
    } else if ((key == BACKSPACE) && (!typing.equals(""))) { //delete character
      typing = typing.substring (0, typing.length() - 1);
    } else {
      typing = typing + key;
    }
  }
}

void mouseWheel (MouseEvent event) {
  shift = shift - (25 * event.getCount());
  println (shift);
}
