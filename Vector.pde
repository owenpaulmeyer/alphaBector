int position = 10;
double power(double n, int p) {
  double acc = 1;
  for (int i = 0; i < p; ++i) acc *= n;
  return acc;
}
double roundTo(double n) {
  //if(n < 1.1 && n > .99) println("n: "+n);
  double p = power(10d, position);
  double r = n * p;
  //println("r: "+r);
  r = java.lang.Math.round
  (r) / p;
  
  //if (r < 1.1 && r > .99) {println("r: "+r);println();}
  return r;
}

class Vector {
  double x;
  double y;
  String toString() {
    return "("+x+", "+y+")";
  }

  void drawFrom(Vector v) {
    //println(this + " mag: "+magnitude());
    line((float)v.x*D, (float)v.y*D, (float)(v.x+(this.x*20))*D, (float)(v.y+(this.y*20))*D);
  }
  public Vector(double _x, double _y) {
    x = _x;
    y = _y;
  }
  Vector copy() {
    return new Vector(this.x, this.y);
  }
  
  void roundV(Vector v, int e) {
   double p = power(10d, e);
   double x = Math.round(v.x * p) / p;
   double y = Math.round(v.y * p) / p;
   v.x = x; v.y = y;
  }
  
  Vector add(Vector v) {
    x = roundTo(x + v.x);
    y = roundTo(y + v.y);
    return this;
  }
  //points towards this
  Vector minus(Vector v) {
    x = roundTo(x - v.x);
    y = roundTo(y - v.y);
    return this;
  }
  //points towards r;
  Vector sub(Vector v) {
    Vector r = this.copy();
    r.x = roundTo(r.x - v.x);
    r.y = roundTo(r.y - v.y);
    return r;
  }
  Vector mult(double s) {
    x = roundTo(x * s);
    y = roundTo(y * s);
    return this;
  }
  Vector div(double scaler) {
    x = roundTo(x / scaler);
    y = roundTo(y / scaler);
    return this;
  }
  double magnitude() {
    //double sum = roundTo(roundTo((x * x)) + roundTo((y * y)));
    //return roundTo(Math.sqrt(sum));
    double sum = (x*x) + (y*y);
    return roundTo(Math.sqrt(sum));
  }
  void normalize() {
   div(magnitude());
  }
  Vector limit(double limit) {
    double mag = magnitude();
    if (mag > limit) mult(limit / mag);
    return this;
  }
  
  double dotProduct(Vector that) {
    return this.x * that.x + this.y * that.y;
  }
  
  double theta(Vector that) {
    double mags = this.magnitude()*that.magnitude();
    if(mags==0) mags = 0.00001;
    return Math.acos(this.dotProduct(that)/mags);
  }
  
  Vector translated(Vector t) {
    Vector rtn = this.copy();
    rtn.add(t);
    if (rtn.x < 0) rtn.x      = roundTo(width + rtn.x);
    if (rtn.x > width) rtn.x  = roundTo(rtn.x - width);
    if (rtn.y < 0) rtn.y      = roundTo(height + rtn.y);
    if (rtn.y > height) rtn.y = roundTo(rtn.y - height);
    return rtn;
  }
}