class Bullet {
  
  PVector loc;
  PVector vel;
  int lives;
  PImage img;
   float scaleFactor
  
  
  Bullet(){
    loc = new PVector(player.loc.x, player.loc.y);
    vel = player.dir.copy();
    vel.setMag(10); 
    
    img = loadImage("bullet.png");
  }
  
  void display(){
    
    image(img, loc.x, loc.y, img.width * scaleFactor, img.height * scaleFactor);
    
  }
  
   void move(){
    
    loc.add(vel);
    
  }
  
  
}
