void gameover () {

  background (0);
  fill(255);
  textSize( 100);
  text ("Game Over", 400, 200);
  textSize(50);
  text("Score: " + score, 400, 400);

  text( "High Score: " + highScore, 400, 500);


  // home button
  fill(lpurple);
  strokeWeight( 7);
  tactileCircle(700, 700, 75, lpurple);
  circle( 700, 700, 150);
  fill(255);
  textSize( 50);
  text ("Home", 700, 700);
}


void gameoverClicks() {

  if ( dist( 700, 700, mouseX, mouseY) < 75) {
    mode = INTRO;
    score = 0;
  }
}
