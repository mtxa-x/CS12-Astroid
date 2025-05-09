//==== ASTROIDS  ====

import java.util.ArrayList;

// Mode Constants
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
int mode = GAME;




//============================================ SETUP =========================================
void setup(){
  fullScreen(P2D);
  
  smooth();
  frameRate(60);
  textAlign(CENTER, CENTER);
  
  INITIALIZE();
  
  
 gameSetup();
 spaceSetup();
 bulletSetup();
  
  
  
}
//============================================ SETUP END =====================================


//============================================ DRAW ==========================================
void draw(){
   println(mouseX, mouseY);
  
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  }
  
  
}
//============================================ DRAW END =======================================
