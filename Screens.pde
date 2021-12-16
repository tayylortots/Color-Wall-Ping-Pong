class Screens {
  
  PImage IntroBg, GameBg, GameBg2, GameBg3, OverBg, cursorRac;
  PFont f, scoreF;
  
  int score=0;

  Screens() {
    paddle = new Paddle();
    ball = new Ball(5, 5, 255, 0, 255);
    ball2 = new Ball(10, 10, 0, 255, 255);
    ball3 = new Ball(15, 15, 255, 225, 0);

    f = createFont("Chalk-Regular.ttf", 16, true);
    scoreF = createFont("Poppins-Regular.otf", 20, true);
    GameBg= loadImage("tennis court.png");
    GameBg2 = loadImage("tennis court 2.png");
    GameBg3 = loadImage("tennis court 3.png");
    IntroBg= loadImage("tennis intro.png");
    OverBg= loadImage("tennis over.png");
  }

  //initial sceen
  void initScreen() {
    score = 0;
    background(IntroBg);
    fill(117, 152, 204);
    noStroke();
    cursor();

    //hypen
    fill(255);
    noStroke();
    circle(190, 300, 4);
    circle(190, 293, 4);

    //levels options
    fill(255);
    textFont(f, 25);
    text("Level", 150, width/2+5);

    //lv 1
    if (overRectangle(220, 270, 50, 30) == true) {
      fill(250, 190, 25); //orange
    } else {
      fill(255);
    }
    textFont(f, 25);
    text("One", 250, width/2+5);

    //lv 2
    if (overRectangle(310, 270, 70, 30) == true) {
      fill(250, 190, 25); //orange
    } else {
      fill(255);
    }
    textFont(f, 25);
    text("Two", 350, width/2+5);

    // lv 3
    if (overRectangle(400, 270, 90, 30) == true) {
      fill(250, 190, 25); //orange
    } else {
      fill(255);
    }
    textFont(f, 25);
    text("Three", 450, width/2+5);

    //bg text
    textAlign(CENTER);
    textLeading(60);
    fill(255);
    textFont(f, 50);
    text("Color Pong", 300, 140);
    text("Tennis Wall", 300, 210);

    //instruction button
    if (overCircle(20, 540, 35) == true) {
      fill(250, 190, 25); //orange
    } else {
      fill(46, 83, 126);
      noStroke();
    }
    circle(40, 560, 35);

    fill(255);
    textFont(f, 25);
    text("i", 40, 568);
  }

  //game screen 1: level 1
  void gameScreen() {
    noCursor();
    background(GameBg);
    paddle.update();
    paddle.display();

    ball.update();  // Update ball
    ball.display();  // Draw ball
    end(ball);
    printScore();
    
    // Set variable to true if shapes are overlapping, false if not
    //trying to show score
    boolean collision = hitPaddle(paddle, ball);
    if (collision == true) {
      ball.hit(paddle);
      
      score();
    }
  }


  //game screen 2: level 2
  void gameScreenTwo() {
    noCursor();
    background(GameBg3);
    paddle.update();
    paddle.display();

    ball2.update();  // Update ball
    ball2.display();  // Draw ball
    end(ball2);
    printScore();
    
    // Set variable to true if shapes are overlapping, false if not
    //trying to show score
    boolean collision = hitPaddle(paddle, ball2);
    if (collision == true) {
      ball2.hit(paddle);
      
    score();
    }
  }

  //gamescreen3 - level 3
  void gameScreenThree() {
    noCursor();
    background(GameBg2);
    paddle.update();
    paddle.display();

    ball3.update();  // Update ball
    ball3.display();  // Draw ball
    end(ball3);
    printScore();

    // Set variable to true if shapes are overlapping, false if not
    //trying to show score
    boolean collision = hitPaddle(paddle, ball3);
    if (collision == true) {
      ball3.hit(paddle);
      
     score();
    }
  }

  void gameOverScreen() {
    cursor();
    background(OverBg);

    textAlign(CENTER);
    fill(46, 83, 126);
    textFont(f, 60);
    text("Game over", 300, 170);
    
    //score display, game over//
       //hyphen//
       fill(255);
       noStroke();
       circle(317, 197, 4);
       circle(317, 190, 4);
    
    //score//
    fill(255);
    textFont(f,20);
    text("Score",285,200);
    
    textFont(scoreF,20);
    text(score,335,200);

    if (overRectangle(160, 270, 250, 50) == true) {
      fill(250, 190, 25); //orange
    } else {
      fill(46, 83, 126);
    }
    textFont(f, 25);
    text("Click here to play again", 300, width/2);
  }

  boolean hitPaddle(Paddle p, Ball b) {

    float circleDistanceX = abs(b.x - p.x - p.w/2);
    float circleDistanceY = abs(b.y - p.y - p.h/2);

    if (circleDistanceX > (p.w/2 + b.radius)) {
      return false;
    }
    if (circleDistanceY > (p.h/2 + b.radius)) {
      return false;
    }
    if (circleDistanceX <= p.w/2) {
      return true;
    }
    if (circleDistanceY <= p.h/2) {
      return true;
    }


    float cornerDistance = pow(circleDistanceX - p.w/2, 2) + pow(circleDistanceY - p.h/2, 2);
    if (cornerDistance <= pow(b.radius, 2)) {
      return true;
    } else {
      return false;
    }
  }

  void startGame() {
    whichScreen = 1;
    print("Starting game 1");
  }

  void startGame2() {
    whichScreen = 2;
    print("Starting game 2");

  }

  void startGame3() {
    whichScreen = 3;
    print("Starting game 3");
  }

  void again() {
    ball = new Ball(5, 5, 255, 0, 255);
    ball2 = new Ball(10, 10, 0, 255, 255);
    ball3 = new Ball(15, 15, 255, 255, 0);
    whichScreen = 0;
  }

  void instructionPage() {
    whichScreen = 5;
    print("Instructions screen");
  }

  void end(Ball b) {
    if (b.x > 600) {
      whichScreen = 4;
    }
  }
  
  void score() {
  score++;
  }
  
  void printScore(){
    textAlign(CENTER);
    fill(255);
    textFont(scoreF, 25);
    text(score, 124, 45);
    
    textFont(f, 30);
    text("Score", 60, 45);
    
    fill(255);
    noStroke();
    circle(103, 41, 4);
    circle(103, 31, 4);
  }
}
