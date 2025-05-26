//==== Mouse Handling ====
void mouseReleased() {
  if      (mode == INTRO)    introClicks();
  else if (mode == OPTIONS)  optionsClicks();    
  else if (mode == GAME)     gameClicks();
  else if (mode == PAUSE)    pauseClicks();
  else if (mode == GAMEOVER) gameoverClicks();
}



//==== Click Handlers ====
void introClicks() {
  mode = OPTIONS;
  return;
}

void gameClicks(){
  mode = PAUSE;
}

void gameoverClicks() {
  resetGame();
  mode = INTRO;
}

void pauseClicks() {
  mode = GAME;
}

void optionsClicks() {
  int btnW    = 200;
  int btnH    = 40;
  int btnX    = width/2 - btnW/2;
  int firstY  = height/3;
  int spacing = 10;

  for (int i = 0; i < diffNames.length; i++) {
    int y = firstY + i*(btnH + spacing);
    if (mouseX >= btnX && mouseX <= btnX+btnW
     && mouseY >= y    && mouseY <= y+btnH) {
       
      difficulty      = i;
      mode            = GAME;
      gameInitialized = false;   // so game() will spawn fresh per new difficulty
      return;
    }
  }
}
