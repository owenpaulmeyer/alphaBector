Vector center;
class Ball {
  Float speedLimit = 8.5;
  Vector location;
  Vector speed = new Vector(0,0);
  Vector acceleration = new Vector(1,1);
  int size;

  Vector id() { return location.copy(); }
  public Ball(Vector _location, int _size) {
    location = _location;
    size = _size;
  }
  public Ball(Vector _location, int _size, Vector s) {
    location = _location;
    size = _size;
    speed = s;
  }
  void drawBallOOO() {
    fill(255);
    ellipse((float)location.x*D ,(float)location.y*D ,size,size);
  }
  void drawBall() {
    //int r = (int)(1 / speed.magnitude() * 255);
    //int g = (int)(80 / speed.magnitude() * 255);
    //int b = (int)(100 / speed.magnitude() * 255);
    
    //fill(r,g,b, 255);
    
    colorMode(HSB, 3.14);
    //float h = (float)Math.asin(speed.y/speed.magnitude()) + 3.14/2;
    Vector pointToCenter = center.sub(location);
    float theta = (float)(3.14 - speed.theta(pointToCenter));
    float s = (float)(0 - speed.magnitude()*(3.14/speedLimit));
    if (s > 3.14 || s < 0.0) {
      //println("S: "+s);
      s = (float)Math.abs(s % 3.14)+3.0;
    }
    float b = (float)(3.14 - speed.magnitude()*(3.14/speedLimit));

    fill(color(theta,s,b));
    
    float xoffset = width - width / D;
    float yoffset = height - height / D;
    ellipse((float)location.x*D - xoffset ,(float)location.y*D - yoffset,size * D, size * D);
    //ellipse((float)center.x,(float)center.y,size * 4, size * 4);
  }
  void move() {
    //if (location.x < 0) {
    //  location.x += 2;
    //  speed.x = -speed.x;
    //}
    //if (location.y < 0) {
    //  location.y += 2;
    //  speed.y = -speed.y;
    //}
    //if (location.x > width) {
    //  location.x -= 2;
    //  speed.x = -speed.x;
    //}

    //if (location.y > height) {
    //  location.y -= 2;
    //  speed.y = -speed.y;
    //}
    
    if (location.x > width) location.x = 0 + location.x - width;
    if (location.x < 0) location.x = width + location.x;
    if (location.y > height) location.y = 0 + location.y - height;
    if (location.y < 0) location.y = height + location.y;
    
    location.add(speed);
  }
  void move(Vector direction) {
    location.add(direction);
  }
  void accelerate(Vector acceleration) {
    speed.add(acceleration);
    speed.mult(.999);
    speed.limit(speedLimit);
  }
//  //void mouseIt() {
  // Vector mouse = new Vector(mouseX, mouseY);
  // Vector direction = Vector.sub(mouse, location);
  // direction.normalize();
  // direction.mult(0.1);
  // acceleration = direction;
  // //speed.add(acceleration);
  // //move(speed);
  // accelerate(acceleration);
  // move();
  //}
    
}