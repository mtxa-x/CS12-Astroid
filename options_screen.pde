void options() {
  background(30);

  pushStyle();      
  noStroke();       
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(36);
  text("Select Difficulty", width/2, height/5);

  int btnW    = 200;
  int btnH    = 40;
  int btnX    = width/2 - btnW/2;
  int firstY  = height/3;
  int spacing = 10;

  textSize(24);
  for (int i = 0; i < diffNames.length; i++) {
    int y = firstY + i*(btnH + spacing);

    if (mouseX >= btnX && mouseX <= btnX+btnW &&
        mouseY >= y    && mouseY <= y+btnH) {
      fill(180);
    } else {
      fill(100);
    }
    rect(btnX, y, btnW, btnH, 8);

    fill(255);
    text(diffNames[i], btnX + btnW/2, y + btnH/2);
  }
  popStyle();
}
