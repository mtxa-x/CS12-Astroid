//==== INPUT HANDLING =============================================
void keyPressed() {
  if (keyCode == UP)    upkey = true;
  if (keyCode == DOWN)  downkey = true;
  if (keyCode == LEFT)  leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (key == ' ')       spacekey = true;
  if (key == 'z' || key == 'Z') zkey = true;
  if (key == 'x' || key == 'X') xkey = true;
  if (key == 'c' || key == 'C') ckey = true;
  if (key == 'e' || key == 'E') ekey = true;
}
void keyReleased() {
  if (keyCode == UP)    upkey = false;
  if (keyCode == DOWN)  downkey = false;
  if (keyCode == LEFT)  leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (key == ' ')       spacekey = false;
  if (key == 'z' || key == 'Z') zkey = false;
  if (key == 'x' || key == 'X') xkey = false;
  if (key == 'c' || key == 'C') ckey = false;
  if (key == 'e' || key == 'E') ekey = false;
}
