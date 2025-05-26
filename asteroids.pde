//==== ASTEROID CLASS =============================================
class Asteroid extends GameObject {
  int size;         // 3=big,2=med,1=small
  float angle, rotSpeed;

  Asteroid(int size) {
    super(new PVector(random(width), random(height)),
          PVector.random2D().mult(random(1,3)));
    this.size = size;
    angle = random(TWO_PI);
    rotSpeed = random(-0.02, 0.02);
  }

  Asteroid(PVector loc, int size) {
    super(loc, PVector.random2D().mult(random(1,3)));
    this.size = size;
    angle = random(TWO_PI);
    rotSpeed = random(-0.02, 0.02);
  }

  float getRadius() {
    float s = (size / 3.0f) * 0.11f; 
    return (asteroidImg.width * s) * 0.5f;
  }

  @Override
  void act() {
    loc.add(vel);
    wrapAround();
    angle += rotSpeed;
  }

  @Override
  void show() {
    pushMatrix();
      translate(loc.x, loc.y);
      rotate(angle);
      imageMode(CENTER);
      float s = (size / 3.0f) * 0.2f;
      image(asteroidImg, 0, 0,
            asteroidImg.width * s,
            asteroidImg.height * s);
    popMatrix();
  }
}
