//When I wrote this, I thought I might want to run mutliple games in one instance of the application, which explains some of this architecture.

abstract class Game implements Messaging {

  //Upper left corner of the game object
  int gameX;
  int gameY;

  String name = "";

  String getName() {
    return name; 
  }

  //width and height of this game object
  int gameWidth;
  int gameHeight;

  Game(int xCorner, int yCorner, int gWidth, int gHeight, String name) {
    gameX = xCorner;
    gameY = yCorner;

    gameWidth = gWidth;
    gameHeight = gHeight;

    this.name = name;
  }
}



