
void game() {
  background(255);

// match buttons
  matchesButton();
  notMatchesButton();

  //Score
  textSize(20);
  text( "Score: " + score, 700, 700);

  //number generator
  if (randomNumber < 5 ) {
    randomColor = randomWord;
  } 
  while (randomNumber >= 5 && randomColor == randomWord) {
    randomColor = (int) random(0, 5);
    randomColor = (int) random(0, 5);
  }

  // colour + word
  textSize( 80);
  fill(colors[randomColor]);
  text(words[randomWord], width/2, movingY);
  movingY = movingY + 5;

  if (movingY >840) {
    mode = GAMEOVER;
    movingY = 0;
  }

// guesses
  rWisrC ();
  rWnotrC ();

//score tally
  if (score> highScore) {
    highScore = score;
  }
}

void matchesButton () {
  fill(black);
  rect( 200, 400, 400, 800);
  textSize(30);

  fill(white);
  tactileCircle(200, 600, 100, white);
  circle( 200, 600, 200);
  stroke( white);

  fill(black);
  text("Matches", 200, 600);
}

void notMatchesButton () {
  fill(white);
  rect( 600, 400, 400, 800);

  fill(black);
  tactileCircle(600, 600, 100, black);
  circle( 600, 600, 200);
  stroke(black);

  fill(white);
  text ("Not a match", 600, 600);
}

void gameClicks() {
  if ( dist( 200, 600, mouseX, mouseY) < 100) {
    guess =1;
  }

  if ( dist( 600, 600, mouseX, mouseY) < 100) {
    guess =2;
  }
}

void puzzle () {
  randomNumber = (float) random(0, 10);
  randomWord = (int) random(0, 5);
}

void  rWisrC () {
  if (randomWord == randomColor) {
    if (guess == 1) {
      puzzle();
      score ++;
      movingY = 0;
      success.rewind();
      success.play();
    } 
    if (guess == 2) {
      mode = GAMEOVER;
      movingY = 0;
      failure.rewind();
      failure.play();
    }
    guess = 3;
  }
}

void rWnotrC () {
  if (randomWord  !=  randomColor) {
    if (guess == 2) {
      score ++;
      puzzle();
      movingY = 0;
      success.rewind();
      success.play();
    } 
    if (guess == 1) {
      mode = GAMEOVER;
      movingY = 0;
      failure.rewind();
      failure.play();
    }
    guess = 3;
  }
}
