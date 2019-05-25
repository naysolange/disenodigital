void setup() {
  size(564,489);
  background(255);
}
int lado = 282;
void draw() {
  
  Triangulo t1 = new Triangulo(width/2, 0, width/2-lado/2, height/2,  width/2+lado/2, height/2);
  t1.dibujar();
  Triangulo t3 = new Triangulo(width/2-lado/2, height/2,  0, height, width/2, height);
  t3.dibujar();
  Triangulo t4 = new Triangulo(width/2+lado/2, height/2, width/2, height, width, height);
  t4.dibujar();
  
  // triangulo central
   float x1 = width/2-lado/2;
   float y1 = height/2;
   float x2 = width/2+lado/2;
   float y2 = height/2;
   float x3 = width/2;
   float y3 = height;
  int separacion = 10;
  strokeWeight(1);
 
  for(int i=0; i<15; i++) {
    triangle(x1+i*separacion,y1+i*separacion/2,x2-i*separacion,y2+i*separacion/2,x3,y3-i*separacion);
  }
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
  
   int separacion = 10;
   float grosor = 1;
   
   for(int i=0; i<15; i++) {
     grosor = grosor + 0.3;
     strokeWeight(grosor);
     triangle(x1,  y1+(i*separacion), x2+(i*separacion), y2-(i*separacion/2), x3-(i*separacion), y3-(i*separacion/2));
   }
  
 }
 
  
  
}
