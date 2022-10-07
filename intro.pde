

void intro() {
  background( 255);
  // gif
  image(gif[f], 0, 0, width, height);
  f=f+1;
  if (f ==numberOfFrames) f = 0;

  // the colour game title
  textSize( 150);
  fill( 0);
  textFont ( milkyCoffee);
  text ( "The Colour Game", 400, 400);

  //next button
  fill(lpurple);
  strokeWeight( 7);
  tactileCircle(700, 700, 75, lpurple);
  circle( 700, 700, 150);
  fill(255);
  textSize( 50);
  text ("Play", 700, 700);
}

void introClicks() {

  if ( dist( 700, 700, mouseX, mouseY) < 75) {
    mode = GAME;
  }
}
