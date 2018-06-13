class Curve{
  Point center;
  Point start;
  Point end;
  
  Curve(Point start,Point end){
    this.start = start;
    this.end = end;
    center = new Point((end.x+start.x)/2,(end.y+start.y)/2);
  }
  
  void draw(){
     line(start.x,start.y,end.x,end.y); 
     ellipse(center.x,center.y,2,2);
  }
}
