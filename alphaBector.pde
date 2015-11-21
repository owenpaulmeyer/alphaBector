int N = 50;
float D = 1;
void setup() {
  size(1000,1000);
  center = new Vector(width / 2, height / 2);
  //noLoop();
  ellipseMode(CENTER);
  rectMode(CENTER);
  smooth(  );
  //ballz.applyDirections();
  
  //Vector v = new Vector (12, -67);
  //println(": "+v.magnitude());
  //v.mult(100);
  //v.normalize();
  //println(": "+v.magnitude());
  //println(": "+v);
  //ballz.pull();
  
  Vector a = new Vector(17,-12);
  Vector c = new Vector(1,4);
  Vector p = c.sub(a);
  
  
  println(":: "+ p);
  println(":: "+ a.translated(p));
  println("CENTER: "+center);
  strokeWeight(1);
  background(88);
}

void draw() {
  //background(#344C90);
  colorMode(RGB, 255);
  //fill(#344C90, 10);
  fill(88, 1);
  
  rect(width/2,height/2,width,height);
  

  
  ballz.moveBallz();
  ballz.drawBallz();
}

Ballz ballz = new Ballz(19, 8);