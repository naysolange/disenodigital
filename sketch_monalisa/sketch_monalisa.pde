PImage imagen; 

void setup() {
  background(255);
  size(509, 765);
  imagen = loadImage("monalisa.jpg");
  noStroke(); 
} 

void draw() {
  for (int i=0; i < 15; i++) {
    float x = random(width);
    float y = random(height);
    color c = imagen.get(int(x), int(y));
    fill(c, 100); 
    if(key == 'e') {
      ellipse(x,y,random(5,20),random(5,10));
    } else {
      square(x,y,random(10));
    }
  }
}
