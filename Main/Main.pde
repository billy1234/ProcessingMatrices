vector  a = new vector(-50,-50), //the ponts in space that will make up the lines
        b =new vector(50,-50), 
        c =new vector(-50,50), 
        d = new vector(50,50),
        e = new vector(0,0);

vectorLine  x = new vectorLine(a,b),  //what points conenct to one another
            y = new vectorLine(a,c),
            z = new vectorLine(d,b), 
            w = new vectorLine(e,c), 
            p = new vectorLine(d,e);
            
            
 matrix    m1 = new matrix(0,-1.5,
                           -1.5,0),
                        
           m2 = new matrix(1,2.2,
                           2.2,0);
                           

int size = 500;
int half = size/2;
vector center = new vector(half,half);

void setup() {
  size(500,500);

}

void draw() {
  background(255);
  
  stroke(125);
  strokeWeight(1);
  line(half,0,half,size);
  line(0,half,size,half);

  
  
  
  
  

  strokeWeight(3);
  stroke(0);
  x.shift(center).draw();
  y.shift(center).draw();
  z.shift(center).draw();
  w.shift(center).draw();
  p.shift(center).draw();
  
  stroke(40,255,40);
  x.transform(m1).shift(center).draw();
  y.transform(m1).shift(center).draw();
  z.transform(m1).shift(center).draw();
  w.transform(m1).shift(center).draw();
  p.transform(m1).shift(center).draw();
  
  stroke(40,40,255);
  x.transform(m2).shift(center).draw();
  y.transform(m2).shift(center).draw();
  z.transform(m2).shift(center).draw();
  w.transform(m2).shift(center).draw();
  p.transform(m2).shift(center).draw();
}


class vectorLine{
  public vector a,b;
  
  public vectorLine(vector a, vector b){
    this.a = a;
    this.b = b;
  }
  
  public void draw(){
    line(a.x(),a.y(),b.x(),b.y());
  }
  

  
  public vectorLine transform(matrix m) {
    vector a = this.a.transform(m);
    vector b = this.b.transform(m);
    return new vectorLine(a,b);
  } 
  
  public vectorLine shift(vector v) {
    vector a = this.a.add(v);
    vector b = this.b.add(v);
    return new vectorLine(a,b);
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
  
  
  public vector add(vector v) {
    int x = this.contents[0] + v.x();
    int y = this.contents[1] + v.y();
    return new vector(x,y);
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