// Alyssa Xu
// Oct.1, 2022
// The Color Game

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// keyboard variables


// font variable
PFont milkyCoffee;

//gif variables
PImage [] gif;
int numberOfFrames;
int f;

//Mode Variables
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER =3;

//Color Pallette variables
color lpurple = #CABADE;

color red = #ff0000;
color green = #00ff00;
color blue = #0000ff;
color yellow = #FFF827;
color purple = #6508A7;
color black = #030200;
color white = #FFFFFF;

//Target variables
int randomWord = (int) random (0, 5);
int randomColor = (int) random(0, 5);
float randomNumber = (float) random(0, 10);

String[] words = {" RED", "GREEN", "BLUE", "YELLOW", "PURPLE"} ;
color [] colors = {red, green, blue, yellow, purple};

//other variables
int guess;
final int TRUE =1;
final int FALSE = 2;
final int RESET = 3;

int score;
int highScore;
int i;
float movingY;

//minim variables
Minim minim;
AudioPlayer music;
AudioPlayer failure;
AudioPlayer success;

void setup() {
  size (800, 800);
  textAlign (CENTER, CENTER);
  rectMode(CENTER);
  
  // variable initiation
  mode = INTRO;
  score = 0;
  highScore = score;

  //text setup
  milkyCoffee = createFont("MilkyCoffee.ttf", 80); 

  // void functions for music and gif
  music();
  gif ();
  
}
void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("MODE ERROR: Mode is" + mode);
  }
}

boolean touchingCircle(int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    return true;
  } else {
    return false;
  }
}

void tactileCircle(int x, int y, int r, color f) {
  fill(f);
  if (touchingCircle(x, y, r)) {
    stroke(255);
  } else {
    stroke(purple);
  }
  circle(x, y, r);
}

void music () {
  minim = new Minim(this);
  music = minim.loadFile("MUSIC.mp3");
  music.play();
  failure = minim.loadFile ("FAILURE.mp3", 80);
  success = minim.loadFile ("SUCCESS.mp3", 80);
}

void gif() {
  numberOfFrames = 18;
  gif = new PImage [numberOfFrames];

  int i = 0;
  while (i< numberOfFrames) {
    gif [i] = loadImage("frame_" + i+ "_delay-0.1s.gif");
    i++;
  }
}
