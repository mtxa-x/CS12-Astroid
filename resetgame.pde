void resetGame() {
  objects.clear();
  particles.clear();
  player = new SpaceShip();
  objects.add(player);

  gameInitialized = false;
  ufoTimer        = 0;
  redFlashAlpha   = 0;
  player.invulnTimer = 0;

  survivalTime    = 0;
  gameStartTime   = 0;

}
