//==== MAIN GAME FUNCTION ========================================
void game() {
  
  
  if (!gameInitialized) {
     
    gameStartTime = millis();
  
    int[] astCount = { 0, 1, 10, 50 };
    int[] ufoCount = { 1,  3,  8,  50 };
    for (int i = 0; i <= astCount[difficulty]; i++) {
      objects.add(new Asteroid(3));
    }
    ufoSpawnInterval = 300 - difficulty*100;
    for (int i = 0; i < ufoCount[difficulty]; i++) {
      objects.add(new UFO());
    }
    gameInitialized = true;
  }
  
  
  background(0);
  imageMode(CORNER);
  image(bgImg, 0, 0, width, height);
  if (frameCount % 60 == 0) {
  survivalSeconds++;
}
  
  survivalTime = (millis() - gameStartTime) / 1000;
  
  fill(255);
  textAlign(RIGHT, TOP);
  textSize(18);
  text("Time: " + survivalTime + "s", width - 20, 20);
  

  if (!asteroidsInitialized) {
    for (int i = 0; i < 5; i++) {
      objects.add(new Asteroid(3));
    }
    asteroidsInitialized = true;
  }


  if (++ufoTimer >= ufoSpawnInterval) {
    objects.add(new UFO());
    ufoTimer = 0;
  }

  float ufoKillR = ufoImg.width * 0.05 * 0.5;
  for (int i = objects.size() - 1; i >= 0; i--) {
    if (objects.get(i) instanceof UFO) {
      UFO u = (UFO)objects.get(i);
      for (int j = objects.size() - 1; j >= 0; j--) {
        GameObject b = objects.get(j);
        if (b instanceof Bullet) {
          Bullet bl = (Bullet)b;
          if (bl.fromPlayer && PVector.dist(bl.loc, u.loc) < ufoKillR) {
            u.lives = 0;
            bl.lives = 0;
          }
        }
      }
    }
  }

  for (int i = objects.size() - 1; i >= 0; i--) {
    if (objects.get(i) instanceof Asteroid) {
      Asteroid a = (Asteroid)objects.get(i);
      float ar = a.getRadius();
      for (int j = objects.size() - 1; j >= 0; j--) {
        GameObject b = objects.get(j);
        if (b instanceof Bullet) {
          Bullet bl = (Bullet)b;
          if (bl.fromPlayer && PVector.dist(bl.loc, a.loc) < ar + bl.displayRadius()) {
            // destroy bullet
            bl.lives = 0;
            // spawn two smaller if possible
            if (a.size > 1) {
              for (int k = 0; k < 2; k++) {
                objects.add(new Asteroid(a.loc, a.size - 1));
              }
            }
            a.lives = 0;
            break;
          }
        }
      }
    }
  }

  if (player.invulnTimer <= 0 && !player.cloakActive) {
    float shipR = shipImg.width * player.scaleFactor * 0.5 - 4;

    for (GameObject o : objects) {
      if (o instanceof Bullet) {
        Bullet bl = (Bullet)o;
        if (!bl.fromPlayer && PVector.dist(bl.loc, player.loc) < shipR + bl.displayRadius()) {
          if (player.shieldActive) {
            bl.vel.mult(-1);
            player.shieldHealth--;
            if (player.shieldHealth <= 0) player.shieldActive = false;
          } else {
            player.takeHit();
            bl.lives = 0;
          }
          break;
        }
      }
      // Asteroid hits ship
      if (o instanceof Asteroid) {
        Asteroid a = (Asteroid)o;
        float ar = a.getRadius();
        if (PVector.dist(a.loc, player.loc) < shipR + ar) {
          player.takeHit();
          a.vel.mult(-1);
          break;
        }
      }
    }
  }

  // game over?
  if (player.health <= 0) {
    // final update of survivalTime
    survivalTime = (millis() - gameStartTime) / 1000;
    // update high score
    if (survivalTime > highScore) {
      highScore = survivalTime;
    }
    mode = GAMEOVER;
  }

  //update & show particles
  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.update(); p.show();
    if (p.isDead()) particles.remove(i);
  }

  //update & show all objects
  for (int i = objects.size() - 1; i >= 0; i--) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (!(obj instanceof SpaceShip) && obj.lives <= 0) {
      objects.remove(i);
    }
  }

  //UI on top
  drawCooldownUI();
  drawHealthUI();
  if (redFlashAlpha > 0) {
    noFill();
    stroke(255, 0, 0, redFlashAlpha);
    strokeWeight(8);
    rect(4, 4, width - 8, height - 8);
    redFlashAlpha = max(redFlashAlpha - 4, 0);
  }
  
 
}
