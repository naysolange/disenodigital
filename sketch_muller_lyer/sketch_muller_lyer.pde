void setup() {
  size(600, 600);
}

int i = 1;


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
  
// Línea vertical
stroke(148,0,211);
line(300,100,300,500);  
// Línea horizontal
line(100,300,500,300);
}

}

void dibujarIlusion(int r, int g, int b) {
  
int xInicioLineaVertical = 300;
int yInicioLineaVertical = 100;
int yFinLineaVertical = yInicioLineaVertical + 400;

// Línea vertical
stroke(r, g, b);
line(xInicioLineaVertical,yInicioLineaVertical,xInicioLineaVertical,yFinLineaVertical);  
// Línea horizontal
line(100,300,500,300);

// Punta superior de flecha
stroke(0);
line(xInicioLineaVertical,yInicioLineaVertical,xInicioLineaVertical-25,yInicioLineaVertical+50);
line(xInicioLineaVertical,yInicioLineaVertical,xInicioLineaVertical+25,yInicioLineaVertical+50);

// Punta inferior de flecha
line(xInicioLineaVertical,yFinLineaVertical,xInicioLineaVertical-25,yFinLineaVertical-50);
line(xInicioLineaVertical,yFinLineaVertical,xInicioLineaVertical+25,yFinLineaVertical-50);

// Cuadrado izquierdo
fill(0);
stroke(0);
square(50,275,50);
// Cuadrado derecho
square(500,275,50); 

}
