class Instruction {
  PFont f;
  PImage IntroBg;
  
  Instruction() {
   f = createFont("Chalk-Regular.ttf", 16, true);
   IntroBg= loadImage("tennis intro.png");
  }
  
   //initial sceen
  void inScreen() {
    background(IntroBg);
    
  //instructions
  fill(46, 83, 126);
  noStroke();
  circle(267, 157, 4);
  circle(397, 207, 4);
  textFont(f, 25);
  textLeading(50);
  textAlign(CENTER);
  text("To play, move your paddle up and down \n to fit the ball  If you miss the ball \n the game is over ",300, 110);
    
    // back button
    if (overRectangle(10, 0, 60, 30) == true) {
      fill(250, 190, 25); //orange
    } else {
      fill(255);
    }
    textFont(f, 25);
    text("BACK", 40, 35);
  }
}
