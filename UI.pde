//==== HEALTH & COOLDOWNS UI =====================================
void drawHealthUI() {
  int x = 20, y = 30, w = 60, h = 12;
  noFill(); stroke(255); rect(x, y, w, h);
  noStroke(); fill(255, 0, 0);
  float r = (float)player.health / player.maxHealth;
  rect(x, y, w * r, h);
}

void drawCooldownUI() {
  int barW = 60, barH = 8, sp = 4, x = 20, y0 = height - 20;
  for (int i = 0; i < 4; i++) {
    int y = y0 - i*(barH + sp);
    int cd, cdMax; color ok, busy;
    switch(i) {
      case 0:
        cd = player.tpCooldown; cdMax = player.tpCooldownMax;
        ok = color(0,255,0); busy = color(255,0,0);
        break;
      case 1:
        cd = player.boostCooldown; cdMax = player.boostCooldownMax;
        ok = color(255,150,0); busy = color(100);
        break;
      case 2:
        cd = player.shieldCooldown; cdMax = player.shieldCooldownMax;
        ok = color(0,200,255); busy = color(100);
        break;
      default:
        cd = player.cloakCooldown; cdMax = player.cloakCooldownMax;
        ok = color(200,0,200); busy = color(100);
    }
    noFill(); stroke(255); rect(x, y, barW, barH);
    noStroke(); fill(cd <= 0 ? ok : busy);
    float r = cd <= 0 ? 1 : (float)(cdMax - cd) / cdMax;
    rect(x, y, barW * r, barH);
  }
}
