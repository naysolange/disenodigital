void setup() {
  size(800,800);
  background(255);
}
int lado = 400;
void draw() {
  
  Triangulo t1 = new Triangulo(width/2, 0, width/2-lado/2, height/2,  width/2+lado/2, height/2);
  t1.dibujar();
  Triangulo t2 = new Triangulo(width/2-lado/2, height/2,  width/2+lado/2, height/2, width/2, height);
  t2.dibujar();
  Triangulo t3 = new Triangulo(width/2-lado/2, height/2,  0, height, width/2, height);
  t3.dibujar();
  Triangulo t4 = new Triangulo(width/2+lado/2, height/2, width/2, height, width, height);
  t4.dibujar();
}


class Triangulo {
  
 float x1;
 float y1;
 float x2;
 float y2;
 float x3;
 float y3;
 
 Triangulo(float x1, float y1, float x2, float y2, float x3, float y3) {
   this.x1 = x1;
   this.y1 = y1;
   this.x2 = x2;
   this.y2 = y2;
   this.x3 = x3;
   this.y3 = y3;
 }
 
 void dibujar() {
  
   triangle(x1, y1, x2, y2, x3, y3);
  
 }
 
  
  
}
