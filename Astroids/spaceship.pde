// Main sketch
SpaceShip player;



// Initialize the player
void spaceSetup() {
  player = new SpaceShip();
}

class SpaceShip {
  // Instance variables
  PVector loc;
  PVector vel;
  PVector dir;
  PImage img, img1; 
  float scaleFactor, maxSpeed; 
   


  // Constructor
  SpaceShip() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    dir = new PVector(0.1, 0);

    img = loadImage("spaceship.png");
    img1 = loadImage("spaceship1.png");
    scaleFactor = 0.08;
    maxSpeed = 10;
  }


  void update() {
    move();
    shoot();
    checkForCollisions();
    wrapAround();
  }

  // Draw the spaceship
  void display() {
    pushMatrix();
    translate(loc.x, loc.y);
    float angle = atan2(dir.y, dir.x);
    rotate(angle);
    imageMode(CENTER);
    image(img, 0, 0, img.width * scaleFactor, img.height * scaleFactor);
    
    if (upkey){
    image(img1, 0, 0, img.width * scaleFactor, img.height * scaleFactor);
    }
    
    popMatrix();
  }

  void move(){
    
    loc.add(vel);
    vel.limit(maxSpeed);
    if (upkey) vel.add(dir);
    
    if (leftkey) dir.rotate(-radians(3));
    if (rightkey) dir.rotate(radians(3));
  }
  

  void shoot() {
    if (spacekey) bullets.add(new Bullet() );

  }

  void checkForCollisions() {
    
  }
  
  void wrapAround(){
    if (loc.x > width+80) loc.x = 0;
    if (loc.x < -80)     loc.x = width;
    if (loc.y > height+70) loc.y = 0;
    if (loc.y < -80)      loc.y = height;
    
  }
}
