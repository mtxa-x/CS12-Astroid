import java.util.ArrayList;

//==== GLOBAL VARIABLES ===========================================
final int INTRO    = 0;
final int GAME     = 1;
final int PAUSE    = 2;
final int GAMEOVER = 3;
final int OPTIONS = 4;
int mode = INTRO;

String[] diffNames      = { "Easy", "Medium", "Hard", "Impossible" };
int difficulty    = 1;      
boolean gameInitialized = false;

ArrayList<GameObject> objects;
ArrayList<Particle> particles;
SpaceShip player;

// images
PImage bgImg, shipImg, shipThrustImg, bulletImg, ufoImg, asteroidImg;

Gif gif1;


PFont idk;

// key states
boolean upkey, downkey, leftkey, rightkey, spacekey, zkey;
boolean xkey, ckey, ekey;

// UFO spawn timr
int ufoSpawnInterval = 100;
int ufoTimer         = 0;


boolean asteroidsInitialized = false;

int redFlashAlpha = 0;

int   gameStartTime;   
int   survivalTime;    
int   highScore = 0;   
int survivalSeconds = 0;


//DIFFERENT GAME MODES



//==== SETUP ======================================================
void setup() {
  fullScreen(P2D);
  smooth();
  frameRate(60);
  textAlign(CENTER, CENTER);

  // load assets
  bgImg         = loadImage("background.jpg");
  shipImg       = loadImage("spaceship.png");
  shipThrustImg = loadImage("spaceship1.png");
  bulletImg     = loadImage("bullet.png");
  ufoImg        = loadImage("enemy.png");
  asteroidImg   = loadImage("asteroid.png");

  // init lists
  objects   = new ArrayList<>();
  particles = new ArrayList<>();

  // create player
  player = new SpaceShip();
  objects.add(player);


  gif1 = new Gif("gif", ".gif", 24, 3, 0, 0, width, height+50);
  
    idk = createFont("font.otf", 100);


  
}

//==== DRAW LOOP ==================================================
void draw() {
  switch(mode) {
    case INTRO:    intro();      break;
    case OPTIONS:  options();    break;   
    case GAME:     game();       break;
    case PAUSE:    pause();      break;
    case GAMEOVER: gameover();   break;
  }
}
