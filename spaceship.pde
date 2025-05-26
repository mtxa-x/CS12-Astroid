//==== SPACESHIP CLASS ============================================
class SpaceShip extends GameObject {
  PVector dir;
  float scaleFactor = 0.08, maxSpeed = 10;
  int health, maxHealth, invulnTimer, invulnDuration;
  int cooldown;
  int tpCooldown, tpCooldownMax;
  boolean boostActive, cloakActive, shieldActive;
  int boostCooldown, boostCooldownMax, boostDuration, boostDurationMax;
  int cloakCooldown, cloakCooldownMax, cloakDuration, cloakDurationMax;
  int shieldHealth, shieldMaxHealth, shieldCooldown, shieldCooldownMax;

  SpaceShip() {
    super(width/2, height/2, 0, 0);
    dir = new PVector(0.4, 0);

    maxHealth = 3;
    health = maxHealth;
    invulnDuration = 120;
    invulnTimer = 0;

    cooldown = 0;

    tpCooldown = 0;
    tpCooldownMax = 300;

    boostActive = false;
    boostCooldown = 0;
    boostCooldownMax = 300;
    boostDurationMax = 60;
    boostDuration = 0;

    cloakActive = false;
    cloakCooldown = 0;
    cloakCooldownMax = 300;
    cloakDurationMax = 1000;
    cloakDuration = 0;

    shieldActive = false;
    shieldMaxHealth = 10;
    shieldHealth = 0;
    shieldCooldown = 0;
    shieldCooldownMax = 600;
  }

  void takeHit() {
    health--;
    invulnTimer = invulnDuration;
    redFlashAlpha = 150;
  }

  @Override
  void act() {
    if (invulnTimer > 0) invulnTimer--;

    // rotation & thrust
    if (leftkey) dir.rotate(-radians(5));
    if (rightkey) dir.rotate(radians(5));
    if (upkey) {
      vel.add(dir);
      PVector d = dir.copy().normalize();
      float off = shipThrustImg.height * scaleFactor * 0.5;
      PVector base = loc.copy().sub(d.mult(off));
      for (int i = 0; i < 2; i++) {
        float ang = random(-PI/32, PI/32);
        float spd = random(0.1, 0.4);
        particles.add(new Particle(base, d.copy().mult(-1).rotate(ang).mult(spd)));
      }
    }

    // teleport
    if (zkey && tpCooldown <= 0) {
      loc.set(random(width), random(height));
      tpCooldown = tpCooldownMax;
    }
    if (tpCooldown > 0) tpCooldown--;

    // boost
    if (xkey && boostCooldown <= 0) {
      boostActive = true;
      boostDuration = boostDurationMax;
      boostCooldown = boostCooldownMax;
    }
    if (boostActive && --boostDuration <= 0) boostActive = false;
    if (boostCooldown > 0) boostCooldown--;

    // cloak
    if (ckey && cloakCooldown <= 0) {
      cloakActive = true;
      cloakDuration = cloakDurationMax;
      cloakCooldown = cloakCooldownMax;
    }
    if (cloakActive && --cloakDuration <= 0) cloakActive = false;
    if (cloakCooldown > 0) cloakCooldown--;

    // shield
    if (ekey && shieldCooldown <= 0) {
      shieldActive = true;
      shieldHealth = shieldMaxHealth;
      shieldCooldown = shieldCooldownMax;
    }
    if (shieldActive && shieldHealth <= 0) shieldActive = false;
    if (shieldCooldown > 0) shieldCooldown--;

    // movement
    float lim = boostActive ? maxSpeed*2 : maxSpeed;
    vel.limit(lim);
    loc.add(vel);
    wrapAround();

    // shooting
    if (spacekey && cooldown <= 0) {
      PVector aim = dir.copy().normalize();
      PVector start = loc.copy().add(aim.mult(shipImg.width*scaleFactor*0.5));
      objects.add(new Bullet(start, aim, true));
      cooldown = 30;
    }
    if (cooldown > 0) cooldown--;
  }

  @Override
  void show() {
    // blink while invuln
    if (invulnTimer > 0 && ((frameCount/5)%2)==1) return;

    pushMatrix();
      translate(loc.x, loc.y);
      float a = atan2(dir.y, dir.x);
      rotate(a);

      if (shieldActive) {
        noFill();
        stroke(0,200,255,150);
        strokeWeight(3);
        float r = shipImg.width*scaleFactor*1.5;
        ellipse(0,0,r,r);
      }

      if (cloakActive) tint(255,127);

      imageMode(CENTER);
      image(shipImg, 0, 0,
            shipImg.width*scaleFactor,
            shipImg.height*scaleFactor);

      if (upkey) {
        image(shipThrustImg, 0, 0,
              shipThrustImg.width*scaleFactor,
              shipThrustImg.height*scaleFactor);
      }

      if (cloakActive) noTint();
    popMatrix();
  }
}
