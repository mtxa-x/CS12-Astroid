//==== BULLET CLASS ===============================================
class Bullet extends GameObject {
  boolean fromPlayer;
  float scaleFactor = 0.05;
  int timer = 60;

  Bullet(PVector s, PVector d, boolean fp) {
    super(s, d);
    fromPlayer = fp;
    vel.setMag(10);
  }

  float displayRadius() {
    return bulletImg.width * scaleFactor * 0.5f - 1;
  }

  @Override
  void act() {
    loc.add(vel);
    wrapAround();
    if (--timer <= 0) lives = 0;
  }

  @Override
  void show() {
    pushMatrix();
      translate(loc.x, loc.y);
      float a = atan2(vel.y, vel.x);
      rotate(a);
      imageMode(CENTER);
      image(bulletImg, 0, 0,
            bulletImg.width*scaleFactor,
            bulletImg.height*scaleFactor);
    popMatrix();
  }
}
