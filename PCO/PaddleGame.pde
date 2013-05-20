class PaddleGame extends Game {

  //List of active balls
  ArrayList ballsOnScreen;

  //Screen components
  Ball firstBall;
  Paddle player1;
  Paddle player2;

  //Use these to send OSC messages

  Ball newestBall;
  Ball oldestBall;

  float universalBallSpeed = 1.0; //used to keep values from OSC
  int initialBallY;

  int initialBallDirection = 0;  // total hack

  //The structure of this design is crumbling.. here is another hack
  float howMuchToAddToX = sin(.77);
  float howMuchToAddToY = cos(.77);

  int r = 255;
  int g = 255;
  int b = 255;

  boolean ballColorEnabled = true;

  boolean randomizeInitialBallPolarities = false;

  int maximumNumberOfBallsOnscreen = 20000;
  
  boolean killAllBalls = false;

  PaddleGame(int xCorner, int yCorner, int gWidth, int gHeight, String name) {

    super(xCorner, yCorner, gWidth, gHeight, name); // pass these to super for potential processing

    ballsOnScreen = new ArrayList(); // for multiball

    int tempWidth = gameWidth/64; // use these to calculate stating points with readablity
    int tempHeight = tempWidth;

    initialBallY = (gameHeight/2 + gameY) - tempHeight/2;
    firstBall = new Ball((gameWidth/2 + gameX) - tempWidth/2, initialBallY, tempWidth, tempHeight);

    ballsOnScreen.add(firstBall);

    tempWidth = gameWidth/64;
    tempHeight = gameHeight/10;
    player1 = new Paddle((gameWidth/32 + gameX) - tempWidth/2, (gameHeight/2 + gameY) - tempHeight/2, tempWidth, tempHeight);
    player2 = new Paddle((gameWidth - gameWidth/32 + gameX) - tempWidth/2, (gameHeight/2 + gameY) - tempHeight/2, tempWidth, tempHeight);

    //Used for only sending OSC messages when something changes
    newestBall = firstBall;

    //Send an OSC message indicating that the game has initialized
    OscMessage myMessage = new OscMessage("/"+name+"/GameInitialized");
    myMessage.add(1.0);
    oscP5.send(myMessage, myRemoteLocation);
  }

  void play() {

    background(50);

    // Make a list of balls that are off screen
    ArrayList ballsOffScreen = new ArrayList();

    for (int i = 0; i < ballsOnScreen.size(); i++) {
      Ball ball = (Ball)ballsOnScreen.get(i);

      if (ball != null) { //rewrite this with better treatment of OSC event thread

        try {
          //Advance the ball
          ball.move();
        }
        catch(NullPointerException e) {
        }

        // If the ball is off the screen...
        if (ball.getX() > (gameX + gameWidth)) { // player 2 missed a ball
          ballsOffScreen.add(ball);

          OscMessage myMessage = new OscMessage("/"+name+"/RightPaddleMissedABall");
          myMessage.add(1.0);
          oscP5.send(myMessage, myRemoteLocation);
        }

        else if (ball.getX() < gameX - (ball.getWidth())) {  // player 1 missed a ball
          ballsOffScreen.add(ball);

          OscMessage myMessage = new OscMessage("/"+name+"/LeftPaddleMissedABall");
          myMessage.add(1.0);
          oscP5.send(myMessage, myRemoteLocation);
        }

        else { // draw the ball
          ball.draw();
        }
      }

      else { // else it is the weird case where the ball is somehow null and I don't know why : /
        // just get rid of that ball
        ballsOnScreen.remove(ball);
      }
    }

    player1.draw();
    player2.draw();

    //Remove any that are offsreen
    for (int i = 0; i < ballsOffScreen.size(); i++) {
      Ball ball = (Ball)ballsOffScreen.get(i);
      ballsOnScreen.remove(ball);
    }

    //Protect from lag....
    while (ballsOnScreen.size () >= maximumNumberOfBallsOnscreen && maximumNumberOfBallsOnscreen > 1) {
      ballsOnScreen.remove(0);
    }

    //kill all balls at a safe time!
    if (killAllBalls) {
      ballsOnScreen = new ArrayList();
      killAllBalls = false;
    }

    if (!ballsOnScreen.isEmpty()) { // get the oldest ball onscreen
      oldestBall = (Ball)ballsOnScreen.get(0);
    }
    else { //no balls on screen!
      oldestBall = null;
    }

    sendOSCMessages(); // send out any updated positions for this pass of the loop
  }


  void sendOSCMessages() {

    // send OSC messages
    if (player1.hasMovedVertically()) {
      OscMessage myMessage = new OscMessage("/"+name+"/LeftPaddleY");

      float scaled = map(player1.y, gameY, gameY + gameHeight - player1.height, 0.0, 1.0);
      myMessage.add(scaled);
      player1.previousY = player1.y;
      oscP5.send(myMessage, myRemoteLocation);
    }

    if (player2.hasMovedVertically()) {
      OscMessage myMessage = new OscMessage("/"+name+"/RightPaddleY");

      float scaled = map(player2.y, gameY, gameY + gameHeight - player2.height, 0.0, 1.0);
      myMessage.add(scaled);
      player2.previousY = player2.y;
      oscP5.send(myMessage, myRemoteLocation);
    }


    if (newestBall != null) {
      // if ball sending osc messages is onscreen
      if (newestBall.x >= 0 && newestBall.x <= gameWidth + gameX - newestBall.width) {

        if (newestBall.hasMovedHorizontally()) {
          OscMessage myMessage = new OscMessage("/"+name+"/NewestBallX");

          float scaled = map(newestBall.x, gameX, gameX + gameWidth - newestBall.width, 0.0, 1.0);
          myMessage.add(scaled);
          //   newestBall.previousX = newestBall.x;
          oscP5.send(myMessage, myRemoteLocation);
        }

        if (newestBall.hasMovedVertically()) {
          OscMessage myMessage = new OscMessage("/"+name+"/NewestBallY");

          float scaled = map(newestBall.y, gameY, gameY + gameHeight - newestBall.height, 0.0, 1.0);
          myMessage.add(scaled);
          //   newestBall.previousY = newestBall.y;
          oscP5.send(myMessage, myRemoteLocation);
        }
      }
    }


    if (oldestBall != null) { // means the ball is onscreen .. 
      //but still check within tighter coordinate bounds via this clause..  
      if (oldestBall.x >= 0 && oldestBall.x <= gameWidth + gameX - oldestBall.width) {

        if (oldestBall.hasMovedHorizontally()) {
          OscMessage myMessage = new OscMessage("/"+name+"/OldestBallX");

          float scaled = map(oldestBall.x, gameX, gameX + gameWidth - oldestBall.width, 0.0, 1.0);
          myMessage.add(scaled);
          //  oldesntBall.previousX = oldestBall.x;
          oscP5.send(myMessage, myRemoteLocation);
        }


        if (oldestBall.hasMovedVertically()) {
          OscMessage myMessage = new OscMessage("/"+name+"/OldestBallY");

          float scaled = map(oldestBall.y, gameY, gameY + gameHeight - oldestBall.height, 0.0, 1.0);
          myMessage.add(scaled);
          //  oldestBall.previousY = oldestBall.y;
          oscP5.send(myMessage, myRemoteLocation);
        }
      }
    }
  }

  void parseMsg(String msg, OscMessage oscMessage) {

    if (msg.equals("SetLeftPaddleY")) {
      float value = oscMessage.get(0).floatValue();
      player1.setY(map(value, 0.0, 1.0, 1.0, 0.0));
    }

    else if (msg.equals("SetRightPaddleY")) {
      float value = oscMessage.get(0).floatValue();
      player2.setY(map(value, 0.0, 1.0, 1.0, 0.0));
    }

    else if (msg.equals("AddANewBall")) {
      float value = oscMessage.get(0).floatValue();
      if (value == 1.0) {
        addBall();
      }
    }

    else if (msg.equals("SetBallSpeed")) {
      float value = constrain(oscMessage.get(0).floatValue(), LOW, HIGH);
      setAllBallSpeeds(map(value, 0.0, 1.0, 0.0, 12.0));
    }


    else if (msg.equals("SetBallSpawnY")) {
      float value = constrain(oscMessage.get(0).floatValue(), LOW, HIGH);

      initialBallY = int(map(value, 0.0, 1.0, gameY, gameY+gameHeight -newestBall.height));
    }


    else if (msg.equals("ForkBallSpawnAngle")) {
      float value = constrain(oscMessage.get(0).floatValue(), LOW, HIGH);

      if (value == HIGH) {
        randomizeInitialBallPolarities = true;
      }
      else if (value == LOW) {
        randomizeInitialBallPolarities = false;
      }
    }

    else if (msg.equals("SetBallSpawnAngle")) {
      float value = map(constrain(oscMessage.get(0).floatValue(), LOW, HIGH), LOW, HIGH, 0, 2*PI);
      //float value = oscMessage.get(0).floatValue();
      howMuchToAddToX = cos(value);
      howMuchToAddToY = sin(value);
    }

    else if (msg.equals("ToggleBallColor")) {
      float value = constrain(oscMessage.get(0).floatValue(), LOW, HIGH);
      if (value == HIGH) {
        ballColorEnabled = true;
      } 
      else if (value == LOW) {
        ballColorEnabled = false;
      }
    }

    else if (msg.equals("SetBallColorR")) {
      float value = constrain(oscMessage.get(0).floatValue(), LOW, HIGH);
      r = int(map(value, LOW, HIGH, 0.0, 255.0));
    }

    else if (msg.equals("SetBallColorG")) {
      float value = constrain(oscMessage.get(0).floatValue(), LOW, HIGH);
      g = int(map(value, LOW, HIGH, 0.0, 255.0));
    }

    else if (msg.equals("SetBallColorB")) {
      float value = constrain(oscMessage.get(0).floatValue(), LOW, HIGH);
      b = int(map(value, LOW, HIGH, 0.0, 255.0));
    }

    else if (msg.equals("KillAllBalls")) {
      float value = constrain(oscMessage.get(0).floatValue(), LOW, HIGH);
      if (value == HIGH) {
        killAllBalls = true;
      }
    }

    else if (msg.equals("SetMaxNumberOfBalls")) {
      float value = constrain(oscMessage.get(0).floatValue(), LOW, HIGH);
      maximumNumberOfBallsOnscreen = int(map(value, LOW, HIGH, 1.0, 20000.0));
    }

  

  }

  void addBall() { // used to make new balls

    Ball ball = new Ball(gameWidth/2, initialBallY, gameWidth/64, gameWidth/64);

    newestBall = ball; // make the newest ball the one that sends messages about its coordinates

    ballsOnScreen.add(ball);

    //Send an oscmessage to announce this!
    OscMessage myMessage = new OscMessage("/"+name+"/BallAdded");
    myMessage.add(1.0);
    oscP5.send(myMessage, myRemoteLocation);
  }

  void setAllBallSpeeds(float newSpeed) {
    universalBallSpeed = newSpeed; // for new ballspeed
    for (int i = 0; i < ballsOnScreen.size(); i++) {
      ballSpeed = newSpeed;
    }
  }

  //Paddle////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  class Paddle extends Collider {

    Paddle(float x, float y, float width, float height) {
      super(x, y, width, height);
    }

    void setY(float value) {

      float converted = map(value, LOW, HIGH, gameY, gameY+gameHeight - height); // remap the incoming value to match the game's coordinates
      y = converted;
      //y = constrain(converted, gameY, (gameY+gameHeight) - height);
    }

    void draw() {
      noStroke();
      fill(255);
      //rectMode(CENTER);

      rect(x, y, width, height); // Should be a power of 2?
    }
    void move() {
    }
  }


  //Helper classes.. perhaps better to pull these out in a future rewrite 
  
  //Ball////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  float ballSpeed = universalBallSpeed; 

  class Ball extends Collider {

    float halfBall = width/2; // calculated a lot so..

    float xDirection;
    float yDirection;

    color ballColor;



    Ball(int x, int y, float width, float height) {
      //decided to use ball initialY instead

      super(x, y, width, height);


      if (randomizeInitialBallPolarities) {
        xDirection = randomDirection()*howMuchToAddToX;
        yDirection = randomDirection()*howMuchToAddToY;
      }
      else {
        xDirection = howMuchToAddToX;
        yDirection = howMuchToAddToY;
      }

      //draw conditions at the time of this ball's generation
      ballColor = color(r, g, b);

    }


    boolean registerCollisions = true;

    float getX() {
      return x;
    }

    // Generates 1 or -1 randomly for initial direction
    int randomDirection() {
      int num = int(random(0, 2));
      if (num == 0) {
        num = -1;
      }
      return num;
    }

    void move() {

      previousX = x;
      previousY = y;

      // Check Collisions
      if (this.isColliding(player1)) {
        //but don't just flip the x if it just collided with this player.. check previous collisions
        if (!previousCollisionWasWith(player1)) {
          xDirection *= -1;

          OscMessage myMessage = new OscMessage("/"+name+"/LeftPaddleCollidedWithABall");
          myMessage.add(1.0);
          oscP5.send(myMessage, myRemoteLocation);
        }
        this.setPreviousCollision(player1); //
      }
      else if (this.isColliding(player2)) {

        //but don't just flip the x if it just collided with this player.. check previous collisions
        if (!previousCollisionWasWith(player2)) { 
          xDirection *= -1;

          OscMessage myMessage = new OscMessage("/"+name+"/RightPaddleCollidedWithABall");
          myMessage.add(1.0);
          oscP5.send(myMessage, myRemoteLocation);
        }
        this.setPreviousCollision(player2);
      }

      //Ceiling and Floor Collisions
      if (y +this.height >= gameHeight || y <= gameY) {
        yDirection *= -1;
      }

      y += universalBallSpeed*yDirection;
      x += universalBallSpeed*xDirection;
    }

    void draw() {
      noStroke();

      if (ballColorEnabled) {

        fill(ballColor);
      } 
      else {
        fill(255);
      }

        rect(x, y, width, height);
      } 

    }
  
}

