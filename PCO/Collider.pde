class Collider {
  float x;
  float y;
  float width;
  float height;
  Collider previousCollision; //Keeps a reference to the last collider this object collided with

  //Used to determine if the ball has moved positions
  float previousX;
  float previousY;

  Collider(float x, float y, float width, float height) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;

    previousX = x;
    previousY = y;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  float getWidth() {
    return width;
  }

  float getHeight() {
    return height;
  }

  boolean isColliding (Collider otherCollider) {

    boolean collisionStatus = !(x > otherCollider.getX() + otherCollider.getWidth() 
      || x + width < otherCollider.getX() 
      || y > otherCollider.getY() + otherCollider.getHeight() 
      || y + height < otherCollider.getY());

    return collisionStatus;
  }

  boolean previousCollisionWasWith(Collider currentCollision) { //could implement this with a list and check last pretty cleanly, if it becomes of any use to store collisions

    if (previousCollision == null) { 
      //false if there hasn't been a collision yet.. 
      return false;
    }
    return previousCollision.equals(currentCollision);
  }

  void setPreviousCollision(Collider otherCollider) {
    previousCollision = otherCollider; //set the previous collision with this collider
  }



  boolean hasMovedHorizontally() {
    return !(x == previousX);
  }

  boolean hasMovedVertically() {
    return !(y == previousY);
  }

  boolean hasMoved() {
    return (hasMovedVertically() || hasMovedHorizontally());
  }


}

