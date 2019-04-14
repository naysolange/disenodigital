void setup() {
  size(500, 500);
}

int i = 1;

void draw() {

  background(0);
  i++;
  delay(1000);
  
  // Triángulo
  int xPrimeraFilaPrimerVertice1 = 250;
  int yPrimeraFilaPrimerVertice1 = 50;
  int xPrimeraFilaSegundoVertice1 = 175;
  int yPrimeraFilaSegundoVertice1 = 200;
  int xPrimeraFilaTercerVertice1 = 325;
  int yPrimeraFilaTercerVertice1 = 200;

  if(i % 2 == 0) {
 
    dibujarIlusionCompleta(57, 255, 20, xPrimeraFilaPrimerVertice1, yPrimeraFilaPrimerVertice1, xPrimeraFilaSegundoVertice1, yPrimeraFilaSegundoVertice1, xPrimeraFilaTercerVertice1, yPrimeraFilaTercerVertice1);
    
  } else {
    
    dibujarIlusionCompleta(254, 89, 194, xPrimeraFilaPrimerVertice1, yPrimeraFilaPrimerVertice1, xPrimeraFilaSegundoVertice1, yPrimeraFilaSegundoVertice1, xPrimeraFilaTercerVertice1, yPrimeraFilaTercerVertice1);

  }
}

void dibujarIlusionCompleta(int r, int g, int b, int xPrimeraFilaPrimerVertice1, int yPrimeraFilaPrimerVertice1, int xPrimeraFilaSegundoVertice1, int yPrimeraFilaSegundoVertice1, 
int xPrimeraFilaTercerVertice1, int yPrimeraFilaTercerVertice1) {

   // Primer cuadrado
    dibujarIlusion(r, g, b, xPrimeraFilaPrimerVertice1, yPrimeraFilaPrimerVertice1, xPrimeraFilaSegundoVertice1, yPrimeraFilaSegundoVertice1, xPrimeraFilaTercerVertice1, yPrimeraFilaTercerVertice1); 
  
    // Segundo cuadrado
    dibujarIlusion(r, g, b, xPrimeraFilaPrimerVertice1 - 125, yPrimeraFilaPrimerVertice1 + 250, xPrimeraFilaSegundoVertice1 - 125, yPrimeraFilaSegundoVertice1 + 250, xPrimeraFilaTercerVertice1 - 125, yPrimeraFilaTercerVertice1 + 250);
    
    // Tercer cuadrado
    dibujarIlusion(r, g, b, xPrimeraFilaPrimerVertice1 + 125, yPrimeraFilaPrimerVertice1 + 250, xPrimeraFilaSegundoVertice1 + 125, yPrimeraFilaSegundoVertice1 + 250, xPrimeraFilaTercerVertice1 + 125, yPrimeraFilaTercerVertice1 + 250);
    
}

void dibujarIlusion(int r, int g, int b, int xPrimerVertice, int yPrimerVertice, int xSegundoVertice, int ySegundoVertice, int xTercerVertice, int yTercerVertice) {
  
  int radio = 70;
  fill(r, g, b);
  circle(xPrimerVertice, yPrimerVertice, radio);
  circle(xSegundoVertice, ySegundoVertice, radio);
  circle(xTercerVertice, yTercerVertice, radio);
  fill(0);
  noStroke();
  triangle(xPrimerVertice, yPrimerVertice, xSegundoVertice, ySegundoVertice, xTercerVertice, yTercerVertice);
   
}
