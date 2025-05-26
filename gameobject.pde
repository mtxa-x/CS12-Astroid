//==== BASE CLASS =================================================
class GameObject {
  PVector loc, vel;
  int lives = 1;
  GameObject(float lx, float ly, float vx, float vy) {
    loc = new PVector(lx, ly);
    vel = new PVector(vx, vy);
  }
  GameObject(PVector l, PVector v) {
    loc = l.copy();
    vel = v.copy();
  }
  void act()  {}
  void show() {}
  void wrapAround() {
    if (loc.x > width + 80) loc.x = 0;
    if (loc.x < -80)        loc.x = width;
    if (loc.y > height + 70) loc.y = 0;
    if (loc.y < -80)        loc.y = height;
  }
}
