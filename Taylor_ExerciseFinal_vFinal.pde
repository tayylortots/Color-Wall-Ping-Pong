/* This is a tennis-themed pong game. I decided that I wanted to
 focus on creating screens using the class functions, as well as
 create a new aesthetic for the pong game, incorporating both
 illustration, sound, and form.
 
 To start click anywhere inside the window. You'll be led to the game screen.
 Try to move your cursor up and down to control the racket-paddle. Continue hitting
 the ball against the wall. You lose if the ball flies past your racket-paddle.
 
 --------
 
 Progress: funtioning level. creating an instruction page. fixed float.
 Bug: after losing, pressing a level "again" glitches screen. each level = same speed
 instruction screen not working*/

Ball ball;
Ball ball2;
Ball ball3;
Paddle paddle;
Screens gameScreen;
Instruction instruction;

import processing.sound.*;
SoundFile file, hitSound;

int whichScreen = 0;
PImage GameBg;
PFont f;

//Setup
void setup() {
  size(600, 600);
  gameScreen = new Screens();
  instruction = new Instruction();

  file = new SoundFile(this, "Bubblegum K.K. (Aircheck) - Animal Crossing - New Leaf Music.wav");
  file.loop();

  hitSound = new SoundFile(this, "Tennis Ball Hit sound effect.wav");
}

//Draw
void draw() {
  background(204); // CR -- I added this here to show the behavior of your code
  if (whichScreen == 0) { //I understand more now, thank you!
    gameScreen.initScreen();
  } else if (whichScreen == 1) {
    gameScreen.gameScreen();
  } else if (whichScreen == 2) {
    gameScreen.gameScreenTwo();
  } else if (whichScreen == 3) {
    gameScreen.gameScreenThree();
  } else if (whichScreen == 4) {
    gameScreen.gameOverScreen();
  } else if (whichScreen == 5) {
    instruction.inScreen();
  }
}

void mousePressed() {
  if (whichScreen == 0) {
    if (overRectangle(220, 270, 50, 30) == true) {
      gameScreen.startGame();
    } else if (overRectangle(310, 270, 70, 30) == true) { // NEED TO PASS ARGUMENTS TO overRectangle function like you do on line 64
      gameScreen.startGame2();
    } else if (overRectangle(400, 270, 90, 30) == true) {
      gameScreen.startGame3();
    } else if (overCircle(20, 540, 35) == true) {
      gameScreen.instructionPage();
    }
  }

  if (whichScreen == 4) { //gameover -> instruction page
    if (overRectangle(160, 270, 250, 50) == true) {
      gameScreen.again();
    }
  }

  if (whichScreen == 5) { //instruction page - back to homepage
    if (overRectangle(10, 0, 60, 30) == true) {
      gameScreen.again();
    }
  }
}

boolean overRectangle(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x + width &&
    mouseY >= y && mouseY <= y + height) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(int x, int y, int width) {
  if (mouseX >= x && mouseX <= x + width &&
    mouseY >= y && mouseY <= y + height) {
    return true;
  } else {
    return false;
  }
}
