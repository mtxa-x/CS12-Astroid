PVector loc, vel, grav;
float x, y ,z, d;



void game(){
  
  background(0);
  
  circle(loc.x, loc.y, d);
  
  loc.add(vel);
  vel.add(grav);
  
  if (loc.y < d/2 || loc.y > height-d/2) vel.y = -0.9*vel.y;
  
  if (loc.x < d/2 || loc.x > width-d/2) vel.x = -vel.x;
  
  
  //SPACESHIP CLASS

  player.update();
  player.display();
  
  
  //BULLET CLASS
  
  for(int i = 0; i < bullets.size(); i++){
    Bullet currentBullet = bullets.get(i);
    currentBullet.move();
    currentBullet.display();
  }
  
}

void gameClicks() {
  vel.setMag(vel.mag() * 1.1);
 
}

void gameSetup(){
  
   //GAME
  x = width/2;
  y = height/2;
  d = 100; 
  
  loc = new PVector(width/2, height/2);
  vel = new PVector(4, 0);
  vel.rotate(random(0, 2*PI));
  grav = new PVector(0,1);
  
}
