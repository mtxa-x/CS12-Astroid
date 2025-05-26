class UFO extends GameObject {
  PVector dir;
  float speed = 3;
  int shootTimer = 0, shootInterval = 120;

  UFO() {
    super(0,0,0,0);
    int e = int(random(4)), x;
    do { x = int(random(4)); } while(x == e);
    PVector st = edgePos(e,50), fi = edgePos(x,50);
    loc = st.copy();
    dir = PVector.sub(fi,st).normalize();
    vel = dir.copy().mult(speed);
  }

  PVector edgePos(int s, float off) {
    if (s==0) return new PVector(-off, random(height));
    if (s==1) return new PVector(width+off, random(height));
    if (s==2) return new PVector(random(width), -off);
    return new PVector(random(width), height+off);
  }

  @Override
  void act() {
    loc.add(vel);
    if (++shootTimer >= shootInterval) {
      PVector aim = PVector.sub(player.loc, loc).normalize();
      objects.add(new Bullet(loc.copy(), aim, false));
      shootTimer = 0;
    }
    if (loc.x < -100 || loc.x > width+100 ||
        loc.y < -100 || loc.y > height+100) {
      lives = 0;
    }
  }

  @Override
  void show() {
    pushMatrix();
      translate(loc.x, loc.y);
      float a = atan2(dir.y, dir.x);
      rotate(a);
      imageMode(CENTER);
      image(ufoImg, 0, 0,
            ufoImg.width*0.1, ufoImg.height*0.1);
    popMatrix();
  }
}
