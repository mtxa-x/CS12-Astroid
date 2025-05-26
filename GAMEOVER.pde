void gameover() {
  background(0);
  
  
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(48);
  text("GAME OVER", width/2, height/2 - 40);




  textSize(24);
  text("You survived: " + survivalTime + "s", width/2, height/2 + 0);
  text("High score:   " + highScore      + "s", width/2, height/2 + 40);

  textSize(16);
  text("Click to restart", width/2, height - 60);
}
