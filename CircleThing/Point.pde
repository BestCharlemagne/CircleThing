class Point{
  float x;
  float y;
  
  Point(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  @Override
  String toString(){
    return "(" + x + ", " + y + ")";
  }
}
