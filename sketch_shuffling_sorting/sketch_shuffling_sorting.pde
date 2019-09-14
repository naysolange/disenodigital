// Por defecto se ordena con un Bubble Sort por brightness y se desordena con un Fisher Yates Shuffling
// Presionar 'h' para ordenar por hue
// Presionar 'r' para ordenar por red
// Presionar 'g' para ordenar por green
// Presionar 'b' para ordenar por blue
// Presionar tecla 'UP' para dejar de ordenar
// Presionar tecla 'DOWN' para volver a ordenar
// Presionar 'c' para limpiar la pantalla y comenzar nuevamente
// Presionar 's' para guardar imagen

boolean doit = false;
PImage img;
int ancho;
char tecla;
boolean sort = true;

void setup() {
  size(800,1099);
  colorMode(HSB, 255, 100, 100);
  img = loadImage("neon.jpg");
  image(img, 0, 0);
  ancho = width;
}

int j = 0;

void draw() {
  
   if(doit) {
      /*-------- bubble sort --------*/ 
      for (int i=0; i<width-1; i++) {
        for (int j=0; j<height; j++) {
          if(sort) {
            color c1 = get(i, j);
            color c2 = get(i+1, j);
            if (obtenerValorModo(c1) < obtenerValorModo(c2)) {
              swapBubble(i, j, c1, c2);
            }
          }
        }
      }
     /*-------- shuffling --------*/
      for(int j=0; j<height; j++) {
       
        int origen = int(random(ancho));
        color pix = get(origen, j);
        color temp = get(ancho, j);
        set(ancho, j, pix);
        set(origen, j, temp);
      }
    if (ancho>0) ancho--;  
  }
}


void swapBubble(int x, int y, color a, color b) {
  set(x+1, y, a);
  set(x, y, b);
}

void mousePressed() {
  doit = !doit;
}

void keyPressed() {
  tecla = key;
  
  if (key == CODED) {
    if (keyCode == UP) {
      sort = false;
    } else if (keyCode == DOWN) {
      sort = true;
    } 
  }
  
  if(key == 'c') {
   setup();
  }
  
  if(key == 's') {
    saveFrame();
  }
}

float obtenerValorModo(int c1) {
  
   if(tecla == 'h') {
     return hue(c1);
   } else if(tecla == 'r') {
     return red(c1);
   } else if(tecla == 'g') {
     return green(c1);
   } else if(tecla == 'b') {
     return blue(c1);
   } else { 
     return brightness(c1);
   }
}
