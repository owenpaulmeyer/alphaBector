boolean odd(int x) {
  return x % 2 != 0;
}
boolean even(int x) {
  return x % 2 == 0;
}

class Ballz {
 int count;
 Float scale = .03;//.003;
 ArrayList<Ball> ballz = new ArrayList();
  
 public Ballz(int _count, int size) {
   count = _count * _count;
   for (int x = 1; x <= _count; ++x) {
     for (int y = 1; y <= _count; ++y) {
       Vector location = new Vector(x, y);
       //location.mult(60);
       location.mult(N);
       ballz.add(new Ball(location, size));
     }
   }
 }
 
 Vector pulls(Vector v) {
   Vector acc = new Vector(0,0);
   Vector to = center.sub(v);
   
   //Vector center = v.translated(to);
   for (Ball b : ballz) {
    Vector bl  = b.location.translated(to);
    Vector dir = bl.sub(center);
    double mag = dir.magnitude();
    if (true) {
      dir.div(mag*mag);
      dir.mult(scale);
      acc.add(dir);
    }
    fill(255);
   }
   
   fill(#FCE10D);
   //ellipse((float)(acc.x+v.x)*D, (float)(acc.y+v.y)*D, 20, 20);
   return acc;
 }
  
 Vector direction(Vector a) {
  Vector c = pulls(a);
   
  //v points from c to a
  Vector v = c.sub(a);
  v.normalize();
  v.mult(scale);
  return v;
 }
 ArrayList<Vector> directions() {
   
   ArrayList<Vector> directions = new ArrayList();
   for (int idx = 0; idx < count; ++idx){
     Vector direction = pulls(ballz.get(idx).location);
     directions.add(direction);
   }
   return directions;
 }
 void applyDirections() {
   ArrayList<Vector> directions = directions();
   for (Vector v : directions) {
     //println("dir: "+v);
   }
   for (int idx = 0; idx < count; ++idx) {
     Ball ball = ballz.get(idx);
     Vector direction = directions.get(idx);
     ball.speed = direction;
   }
 }
 void moveBallz() {
   ArrayList<Vector> directions = directions();
   for (int idx = 0; idx < count; ++idx) {
     Ball ball = ballz.get(idx);
     Vector direction = directions.get(idx);
     
     ball.accelerate(direction);
     
     //Vector mouse = new Vector(mouseX, mouseY);
     //Vector accel = mouse.sub(ball.location);
     //accel.normalize();
     //accel.mult(scale);
     //ball.accelerate(accel);
     
     ball.move();
   }
 }
 void drawBallz() {
   for (Ball ball : ballz) {
     ball.drawBall();
   }
 }
}