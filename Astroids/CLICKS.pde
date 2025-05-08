//==== Mouse Handling ====
void mouseReleased() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  } else if (mode == GAMEOVER) {
    gameoverClicks();
  }
}

//==== Click Handlers ====
void introClicks() {
  mode = GAME;
}



void gameoverClicks() {
  mode = GAME;
}



void pauseClicks() {
  mode = GAME;
}
