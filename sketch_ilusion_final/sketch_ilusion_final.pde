int lado = 282;
float separacion = 10;
color colorFondo = color(176,224,230);
color colorFondoTriangulos;
color colorLineas;

void setup() {
  size(564,489);
  background(colorFondo);
}

void draw() {
  
  // Permite cambiar el color al presionar la letra 'c' o 'C'
  if(key == 'c' || key == 'C'){ 
    colorFondoTriangulos = color(253,253,150);
    colorLineas = color(99,11,87);
  } else {
    colorFondoTriangulos = color(255);
    colorLineas = color(0);
  }
 
  // Permite descubrir la ilusión al presionar el mouse
  if(mousePressed){
    background(colorFondo);  
  } else {
    new TrianguloCentral(width/2-lado/2,height/2,width/2+lado/2,height/2,width/2,height, separacion, colorFondoTriangulos, colorLineas).dibujar();
  }
  
  mostrarTitulo();
  new TrianguloLateral(width/2, 0, width/2-lado/2, height/2,  width/2+lado/2, height/2, separacion, colorFondoTriangulos, colorLineas).dibujar();
  new TrianguloLateral(width/2-lado/2, height/2,  0, height, width/2, height, separacion, colorFondoTriangulos, colorLineas).dibujar();
  new TrianguloLateral(width/2+lado/2, height/2, width/2, height, width, height, separacion, colorFondoTriangulos, colorLineas).dibujar();

  // Guarda la imagen
  save("cubo3D.jpg");
}

void mostrarTitulo() {
  fill(0);
  textSize(24);
  text("Cubo 3D", 10, 30); 
}

abstract class Triangulo {
  
 float x1;
 float y1;
 float x2;
 float y2;
 float x3;
 float y3;
 float separacion;
 color colorFondo;
 color colorLineas;
 
 Triangulo(float x1, float y1, float x2, float y2, float x3, float y3, float separacion, color colorFondo, color colorLineas) {
   this.x1 = x1;
   this.y1 = y1;
   this.x2 = x2;
   this.y2 = y2;
   this.x3 = x3;
   this.y3 = y3;
   this.separacion = separacion;
   this.colorFondo = colorFondo;
   this.colorLineas = colorLineas;
 }
 
 abstract void dibujar();
  
 }
 
class TrianguloCentral extends Triangulo {
 
  TrianguloCentral(float x1, float y1, float x2, float y2, float x3, float y3, float separacion, color colorFondo, color colorLineas) {
    super(x1, y1, x2, y2, x3, y3, separacion, colorFondo, colorLineas);
  }
  
  void dibujar() {
    
    fill(colorFondo);
    stroke(colorLineas);
    strokeWeight(1);
 
    for(int i=0; i<15; i++) {
      triangle(x1+i*separacion,y1+i*separacion/2,x2-i*separacion,y2+i*separacion/2,x3,y3-i*separacion);
    }
  }

}

class TrianguloLateral extends Triangulo {
 
  TrianguloLateral(float x1, float y1, float x2, float y2, float x3, float y3, float separacion, color colorFondo, color colorLineas) {
   super(x1, y1, x2, y2, x3, y3, separacion, colorFondo, colorLineas);
 }
  
  void dibujar() {

   float grosor = 0.5;
   fill(colorFondo);
   stroke(colorLineas);
   
   for(int i=0; i<15; i++) {
     grosor = grosor + 0.3;
     strokeWeight(grosor);
     triangle(x1,  y1+(i*separacion), x2+(i*separacion), y2-(i*separacion/2), x3-(i*separacion), y3-(i*separacion/2));
   }
  }

}
