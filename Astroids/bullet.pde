//List of Bullets
ArrayList<Bullet> bullets;

PImage laser;

void bulletSetup() {
  bullets = new ArrayList ();
  
  laser = loadImage("bullet.png");
}


class Bullet extends GameObject {
  
  PVector loc;
  PVector vel;
  int lives;
  float scaleFactor;
  
  
  Bullet(){
    loc = play.loc.copy();
    vel = player.dir.copy();
    vel.setMag(10); 
    scaleFactor = 0.05;
    
    
  }
  
  void display(){
    
    image(laser, loc.x, loc.y, laser.width * scaleFactor, laser.height * scaleFactor);
    
  }
  
   void move(){
    
    loc.add(vel);
    
  }
  
  
}
