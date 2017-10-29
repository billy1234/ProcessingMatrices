vector a = new vector(20,20), b =new vector(100,20), c =new vector(20,100), d = new vector(100,100),e = new vector(50,50);

line x = new line(a,b),y = new line(a,c),z = new line(d,b), w = new line(e,c), p = new line(d,e);

void setup() {
  size(500,500);

}

void draw() {
  background(255);
  matrix m = new matrix(3,0,
                        0,2);
  x.draw(m);
  y.draw(m);
  z.draw(m);
  w.draw(m);
  p.draw(m);
}


class line{
  public vector a,b;
  
  public line(vector a, vector b){
    this.a = a;
    this.b = b;
  }
  
  public void draw(){
    line(a.x(),a.y(),b.x(),b.y());
  }
  
   public void draw(matrix m){
    vector a = this.a.transform(m);
    vector b = this.b.transform(m);
    line(a.x(),a.y(),b.x(),b.y());
  }
  
}

class vector{
  int[] contents= {0,0};
  
  public int x(){
    return getAt(0);
  }
  
  public int y(){
    return getAt(1);
  }
  
  public vector(int x, int y){
    this.contents[0] = x;
    this.contents[1] = y;
  }
  
  int getAt(int x){
  return contents[x];
}
  
  public vector transform(matrix transformation){
    vector newVector = new vector(0,0);
    for(int x =0; x < 2; x++){
      for(int y =0; y < 2; y++){
        newVector.contents[y] += getAt(y) * transformation.getAt(y,x); //+ getAt(1) * transformation.getAt(1,x);
      }
    }
    return newVector;
  }
}

class matrix{  
  float [][] contents = {  {0.0,0.0} ,
                         {0.0,0.0} };
  
  public matrix() {
    this.contents = new float[][]{{0.0,0.0},{0.0,0.0}};
  }
  
  public matrix(float a,float b,float c,float d) {
    this.contents = new float[][]{{0.0,0.0},{0.0,0.0}};
    contents[0][0] = a;
    contents[0][1] = b;
    contents[1][0] = c;
    contents[1][1] = d;
  }
  
  public float getAt(int x, int y) {
    return contents[x][y];
  }
   
}