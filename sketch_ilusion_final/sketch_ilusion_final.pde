int lado = 282;
float separacion = 10;

void setup() {
  size(564,489);
  background(255);
}

void draw() {
  
  new TrianguloLateral(width/2, 0, width/2-lado/2, height/2,  width/2+lado/2, height/2, separacion).dibujar();
  new TrianguloLateral(width/2-lado/2, height/2,  0, height, width/2, height, separacion).dibujar();
  new TrianguloLateral(width/2+lado/2, height/2, width/2, height, width, height, separacion).dibujar();
  new TrianguloCentral(width/2-lado/2,height/2,width/2+lado/2,height/2,width/2,height, separacion).dibujar();
  
}

abstract class Triangulo {
  
 float x1;
 float y1;
 float x2;
 float y2;
 float x3;
 float y3;
 float separacion;
 
 Triangulo(float x1, float y1, float x2, float y2, float x3, float y3, float separacion) {
   this.x1 = x1;
   this.y1 = y1;
   this.x2 = x2;
   this.y2 = y2;
   this.x3 = x3;
   this.y3 = y3;
   this.separacion = separacion;
 }
 
 abstract void dibujar();
  
 }
 
class TrianguloCentral extends Triangulo {
 
  TrianguloCentral(float x1, float y1, float x2, float y2, float x3, float y3, float separacion) {
    super(x1, y1, x2, y2, x3, y3, separacion);
  }
  
  void dibujar() {
    strokeWeight(1);
 
    for(int i=0; i<15; i++) {
      triangle(x1+i*separacion,y1+i*separacion/2,x2-i*separacion,y2+i*separacion/2,x3,y3-i*separacion);
    }
  }

}

class TrianguloLateral extends Triangulo {
 
  TrianguloLateral(float x1, float y1, float x2, float y2, float x3, float y3, float separacion) {
   super(x1, y1, x2, y2, x3, y3, separacion);
 }
  
  void dibujar() {

   float grosor = 0.5;
   
   for(int i=0; i<15; i++) {
     grosor = grosor + 0.3;
     strokeWeight(grosor);
     triangle(x1,  y1+(i*separacion), x2+(i*separacion), y2-(i*separacion/2), x3-(i*separacion), y3-(i*separacion/2));
   }
  }

}
