boolean mouseReleased;
boolean wasPressed;

void click (){
  mouseReleased = false;
  if(mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed){
   mouseReleased = true;
   wasPressed = false;
  }
  
}

class Button {

  //instance variables
  int x, y, w, h; //x, y is the center
  boolean clicked;
  color highlight, normal;
  String text;
  PImage img;


  //contructor
  Button(String t, int _x, int _y, int _w, int _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = t;
    highlight = high;
    normal = norm;
    clicked = false;
  }
  
    Button(PImage pic, int _x, int _y, int _w, int _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    img = pic;
    highlight = high;
    normal = norm;
    clicked = false;
  }


  //behaviour functions
  void show() {
    //rect
    rectMode(CENTER);
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      fill(highlight);
    } else {
      fill(normal);
    }

    stroke(0);
    strokeWeight(4);
    rect(x, y, w, h, 30);

    //text lable
    textAlign(CENTER, CENTER);
    imageMode(CENTER);
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      fill(normal);
    } else {
      fill(highlight);
    }
    
    if (img == null){
      textSize(w/4);
      text(text, x, y);
      
    } else {
      image(img, x, y, w*0.8, h*0.9);
    }
    
  

    //mouse
    if (mouseReleased && mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      clicked = true;
    } else {
      clicked = false;
    }
  }
  
  
}
