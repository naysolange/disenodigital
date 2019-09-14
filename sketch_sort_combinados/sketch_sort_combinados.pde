// Por defecto se ordena por hue
// Presionar 'b' para ordenar por brightness
// Presionar 'r' para ordenar por red
// Presionar 'g' para ordenar por green
// Presionar 'l' para ordenar por blue

boolean doit = false;
PImage img;
int y = 0;
int y2;
int index = width/2;
int z;
char tecla;


void setup() {
  size(509,765);
  colorMode(HSB, 255, 100, 100);
  img = loadImage("monalisa.jpg");
  image(img, 0, 0);
}

void draw() {
  
  if(doit) {
   int y1 = y;
   
   /*-------- selection --------*/
   for(int i=0; i<width/2; i++) {
     float max = -1;
     for(int j=y; j<height; j++) {
       int c1 = get(i, j);
       float modo = obtenerValorModo(c1);
        
       if(modo>max) {
         y2 = j;
         max = modo;
       } 
     }
     swapSelection(y1,y2,i); 
   }
    
    if(y<height-1) {
      y++;
    }
    
    /*-------- bubble --------*/
    for (int i=width/2; i<width-1; i++) {
      for (int j=0; j< height; j++) {
        color c1 = get(i, j);
        color c2 = get(i+1, j);
        if (obtenerValorModo(c1) < obtenerValorModo(c2)) {
          swapBubble(i, j, c1, c2);
        }
      }
    }
  }
  
}

void swapSelection(int y1, int y2, int x) {
  color temp = get(x,y1);
  set(x, y1, get(x, y2));
  set(x, y2, temp);
  
}

void swapBubble(int x, int y, color a, color b) {
  set(x+1, y, a);
  set(x, y, b);
}

float obtenerValorModo(int c1) {
  
   if(tecla == 'b') {
     return brightness(c1);
   } else if(tecla == 'r') {
     return red(c1);
   } else if(tecla == 'g') {
     return green(c1);
   } else if(tecla == 'l') {
     return blue(c1);
   } else {
     return hue(c1);
   }
}

void mousePressed() {
  doit = !doit;
}

void keyPressed() {
  tecla = key;
}
