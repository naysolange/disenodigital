// Por defecto dibuja con cuadrados a color
// Presionar la tecla 'b' para versión en blanco y negro
// Presionar la tecla 'n' para versión en negativo

PImage imagen; 

void setup() {
  size(509, 765);
  background(255);
  imagen = loadImage("monalisa.jpg");
  noStroke(); 
} 

void draw() {
  for (int i=0; i < 15; i++) {
    float x = random(width);
    float y = random(height);
    color c = imagen.get(int(x), int(y));
   
    if(key == 'b') {
      float brillo = brightness(c);
      fill(brillo,100);
      ellipse(x,y,random(5,20),random(5,10));
    } else if (key == 'n') {
      float rojo = red(c);
      float verde = green(c);
      float azul = blue(c);
      fill(255 - rojo, 255 - verde, 255 - azul, 100); 
      rect(x,y,random(15),random(15));
    } else {
      fill(c,100);
      rect(x,y,10,10);
    }
  }
}

void keyPressed() {
 
  if(key == 'b' || key == 'n') {
     background(255);
  }
  
  
}
