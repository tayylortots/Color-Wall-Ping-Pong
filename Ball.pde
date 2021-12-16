class Ball {

  float x;  // X-coordinate of the ball
  float px; // Prior x-coordinate
  float y;  // Y-coordinate of the ball
  float diameter = 20.0;  // Diameter of the ball
  float radius = diameter/2;  // Radius of the ball
  
  float speedX;
  float speedY;
  float colorA;
  float colorB;
  float colorC;
  int score=0;

  Ball(float tempSpeed, float tempSpeed1, float tempColor, float tempColor1, float tempColor2) {
    x = -radius;
    y = height/2;
    speedX = tempSpeed;
    speedY = tempSpeed1;
    colorA = tempColor;
    colorB = tempColor1;
    colorC = tempColor2;
    
  }
  
  // Change ball position
  void update() {
    px = x;
    
    // Update ball coordinates
    x = x + speedX;
    y = y + speedY;

    // Reset position if ball leaves the screen
    if (x > width + radius) {
      speedX = speedX * -1;
      x = -radius;
      y = random(height*0.25, height*0.75);
      speedX = random(5, 15);
      speedY = random(-6, 6);
    }

    // If ball hits the left edge, change direction of X
    if (x < radius) {
      x = radius;
      speedX = speedX * -1;
      
    } 

    // If ball hits top or bottom, change direction of Y  
    if (y > height - radius) {
      y = height - radius;
      speedY = speedY * -1;
    } else if (y < radius) {
      y = radius;
      speedY = speedY * -1;
    }
  }
  
  // Draw ball to the display window
  void display() {
    fill(random(colorA,255), random(colorB,255), random(colorC,255));
    noStroke();
    ellipse(x, y, diameter, diameter);
  }
  
  // Change ball direction when paddle is hit
  // and bump it back to the edge of the paddle
  void hit(Paddle p) {
    score++;
    speedX = speedX * -1;
    hitSound.play();
    // Align the ball with the paddle
    if (speedX < 0) {
      x =  p.x - radius;
    } else {
      x = p.x + p.w + radius; 
    }
  }
}
