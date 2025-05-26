//==== PARTICLE CLASS =============================================
class Particle {
  PVector pos, vel;
  float lifespan = 255;

  Particle(PVector p, PVector v) {
    pos = p.copy();
    vel = v.copy();
  }

  void update() {
    pos.add(vel);
    lifespan -= 16;
  }

  void show() {
    noStroke();
    fill(50,200,255, lifespan);
    ellipse(pos.x, pos.y, 8, 8);
  }

  boolean isDead() {
    return lifespan <= 0;
  }
}
