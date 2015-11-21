boolean even(double d) { return d % 2 == 0; }
boolean odd(double d)  { return d % 2 == 1; }
class Space {
  ArrayList<Ball> balls = new ArrayList();
  int wide;
  int high;
  int length;
  Vector center;
  
  public Space(int x, int y, int sectorWidth, int sectorHeight) {
    if (odd(x) || odd(y)) throw new IllegalStateException("!");
    wide = x;
    high = y;
    length = x*y;
    center = new Vector(wide / 2, high / 2);
  }
  
  Vector offset(Vector from) {
    Vector pointToCenter = center.sub(from);
    
    return new Vector(0,0);
  }
  
}