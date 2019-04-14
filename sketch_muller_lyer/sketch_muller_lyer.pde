void setup() {
  size(500, 500);
}

int i = 1;

int largoDeLaLinea = 350;

int xInicioLineaVertical = 250;
int yInicioLineaVertical = 75;
int yFinLineaVertical = yInicioLineaVertical + largoDeLaLinea;

int xInicioLineaHorizontal = 75;
int yInicioLineaHorizontal = 250;
int xFinLineaHorizontal = xInicioLineaHorizontal + largoDeLaLinea;

void draw() {
  
 background(253,253,150);
 delay(1700);
 i++;
 

  strokeWeight(5);
  stroke(0);
  
  if(i % 3 == 2) {
    
    dibujarIlusion(0,0,0);
  
  } else if(i % 3 == 0) {
    
    dibujarIlusion(148,0,211);
  
  } else {
    
    stroke(148,0,211);
    // Línea vertical
    line(xInicioLineaVertical,yInicioLineaVertical,xInicioLineaVertical,yFinLineaVertical);  
    // Línea horizontal
    line(xInicioLineaHorizontal,yInicioLineaHorizontal,xFinLineaHorizontal,yInicioLineaHorizontal);
  }

}

void dibujarIlusion(int r, int g, int b) {

  // Línea vertical
  stroke(r, g, b);
  line(xInicioLineaVertical,yInicioLineaVertical,xInicioLineaVertical,yFinLineaVertical);  
  // Línea horizontal
  line(xInicioLineaHorizontal,yInicioLineaHorizontal,xFinLineaHorizontal,yInicioLineaHorizontal);
  
  // Punta superior de flecha
  stroke(0);
  line(xInicioLineaVertical,yInicioLineaVertical,xInicioLineaVertical-25,yInicioLineaVertical+50);
  line(xInicioLineaVertical,yInicioLineaVertical,xInicioLineaVertical+25,yInicioLineaVertical+50);
  
  // Punta inferior de flecha
  line(xInicioLineaVertical,yFinLineaVertical,xInicioLineaVertical-25,yFinLineaVertical-50);
  line(xInicioLineaVertical,yFinLineaVertical,xInicioLineaVertical+25,yFinLineaVertical-50);
  
  fill(0);
  stroke(0);
  int anchoDelCuadrado = 50;
  // Cuadrado izquierdo
  square(xInicioLineaHorizontal - anchoDelCuadrado, yInicioLineaHorizontal - (anchoDelCuadrado/2), anchoDelCuadrado);
  // Cuadrado derecho
  square(xFinLineaHorizontal, yInicioLineaHorizontal - (anchoDelCuadrado/2), anchoDelCuadrado);

}
