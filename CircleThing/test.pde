Point center;
float radius = 100;
float radius2;
float radius3;
Point onLine = new Point(0,0);
ArrayList<PShape> shapes = new ArrayList();
Curve curve = new Curve(new Point(20,100), new Point(20,-100));

void setup(){
 size(500,500);
 center = new Point(0,0);
}

void draw(){
 background(0);
 noFill();
 stroke(255);
 translate(width/2,height/2);
 radius = 2*distance(center,curve.center);
 radius2 = 2*distance(center,curve.start);
 radius3 = 2*distance(center,curve.end);
 
 ellipse(0,0,radius,radius);
 ellipse(0,0,radius2,radius2);
 ellipse(0,0,radius3,radius3);
 
 ellipse(onLine.x,onLine.y,10,10);
 
 for(PShape shape: shapes){
  shape(shape); 
 }
 curve.draw();
}

void mouseClicked(){
  Point end = onLine(mouseX-width/2,mouseY-height/2,radius);
  Point end2 = onLine(mouseX-width/2,mouseY-height/2,radius2);
  Point end3 = onLine(mouseX-width/2,mouseY-height/2,radius3);
  
  PShape line = createShape(LINE,center.x,center.y,end.x,end.y);
  PShape line2 = createShape(LINE,center.x,center.y,end2.x,end2.y);
  PShape line3 = createShape(LINE,center.x,center.y,end3.x,end3.y);
  
  shapes.add(line);
  shapes.add(line2);
  shapes.add(line3);
  
  Point point1 = averagePoint(end,end2,radius,radius2);
  Point point2 = averagePoint(end2,end3,radius,radius2);
  onLine = new Point((point1.x+point2.x)/2,(point1.y+point2.y)/2);
  
  println(onLine.x,onLine.y);
}

Point onLine(float x, float y, float radius){
  float angle = atan2(y-center.y,x-center.x);
  float xCord = .5*radius*cos(angle);
  float yCord = .5*radius*sin(angle);

  println(sin(angle));
  Point point = new Point(xCord,yCord);
  
  return point;  
}

float distance(Point a, Point b){
  return (sqrt(pow(b.x-a.x,2)+pow(b.y-a.y,2)));
}

Point averagePoint(Point first, Point second, float firstR, float secondR){
   float diff = secondR/firstR;
   float x = ((second.x + first.x))/2;
   float y = ((second.y + first.y))/2;
   
   return new Point(x,y);
}
