
void setup() {
  size(500,500); 
  background(255);
}

int xCentro = 250;
int yCentro = 250;

float r = 255;
float g = 0;
float b = 128;
int diametro = 125;

void draw() {
  
  int xPrimerVertice = 250;
  int yPrimerVertice = 225;
  int xSegundoVertice = 225;
  float ySegundoVertice = 275;
  int xTercerVertice = 275;
  float yTercerVertice = 275;

  noFill();
  strokeWeight(2);
  
  for(int i=0;i<30;i++) {
    stroke(165,165,165);
    triangle(xPrimerVertice, yPrimerVertice, xSegundoVertice, ySegundoVertice, xTercerVertice, yTercerVertice);
   
    yPrimerVertice = yPrimerVertice - 25;
    xSegundoVertice = xSegundoVertice - 25;
    ySegundoVertice = ySegundoVertice + 12.5;
    xTercerVertice = xTercerVertice + 25;
    yTercerVertice = yTercerVertice + 12.5;
     
  }

}

void mouseClicked() {
  r = random(255);
  g = random(255);
  b = random(255);
  stroke(r,g,b);
  strokeWeight(4);
  circle(xCentro,yCentro,diametro);
  diametro = diametro + 100;
  if(diametro > 500) {
    diametro = 125;
  }
}
