
float ancho = 50;
int separacion = 15;

void setup() {
  size(795,795,OPENGL);
  background(172, 225, 26);
}

void draw() {
  fill(65,105,225);
  //noStroke();
  
  for(int i=0; i<12; i++) {
    for(int j=0; j<12; j++) {
      rect(i*ancho + (i+1)*separacion, j*ancho + (j+1)*separacion, ancho, ancho);
    }
  }
  

  
  
  
  
}
