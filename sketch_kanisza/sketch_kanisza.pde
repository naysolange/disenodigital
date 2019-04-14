void setup() {
  size(600, 600);
}

int i = 1;

void draw() {

  background(0);
  i++;
  delay(1000);
  
  // Triángulo
  int xPrimeraFilaPrimerVertice1 = 100;
  int yPrimeraFilaPrimerVertice1 = 50;
  int xPrimeraFilaSegundoVertice1 = 50;
  int yPrimeraFilaSegundoVertice1 = 150;
  int xPrimeraFilaTercerVertice1 = 150;
  int yPrimeraFilaTercerVertice1 = 150;
  
  // Triángulo invertido
  int xPrimeraFilaPrimerVertice2 = 250;
  int yPrimeraFilaPrimerVertice2 = 50;
  int xPrimeraFilaSegundoVertice2 = 350;
  int yPrimeraFilaSegundoVertice2 = 50;
  int xPrimeraFilaTercerVertice2 = 300;
  int yPrimeraFilaTercerVertice2 = 150;

  if(i % 2 == 0) {
 
    dibujarIlusionCompleta(57, 255, 20, xPrimeraFilaPrimerVertice1, yPrimeraFilaPrimerVertice1, xPrimeraFilaSegundoVertice1, yPrimeraFilaSegundoVertice1, xPrimeraFilaTercerVertice1, yPrimeraFilaTercerVertice1,
    xPrimeraFilaPrimerVertice2, yPrimeraFilaPrimerVertice2, xPrimeraFilaSegundoVertice2, yPrimeraFilaSegundoVertice2, xPrimeraFilaTercerVertice2, yPrimeraFilaTercerVertice2);
    
  } else {
    
    dibujarIlusionCompleta(254, 89, 194, xPrimeraFilaPrimerVertice1, yPrimeraFilaPrimerVertice1, xPrimeraFilaSegundoVertice1, yPrimeraFilaSegundoVertice1, xPrimeraFilaTercerVertice1, yPrimeraFilaTercerVertice1,
    xPrimeraFilaPrimerVertice2, yPrimeraFilaPrimerVertice2, xPrimeraFilaSegundoVertice2, yPrimeraFilaSegundoVertice2, xPrimeraFilaTercerVertice2, yPrimeraFilaTercerVertice2);

  }
}

void dibujarIlusionCompleta(int r, int g, int b, int xPrimeraFilaPrimerVertice1, int yPrimeraFilaPrimerVertice1, int xPrimeraFilaSegundoVertice1, int yPrimeraFilaSegundoVertice1, int xPrimeraFilaTercerVertice1, int yPrimeraFilaTercerVertice1,
int xPrimeraFilaPrimerVertice2, int yPrimeraFilaPrimerVertice2, int xPrimeraFilaSegundoVertice2, int yPrimeraFilaSegundoVertice2, int xPrimeraFilaTercerVertice2, int yPrimeraFilaTercerVertice2) {

   // Primer cuadrado
    dibujarIlusion(r, g, b, xPrimeraFilaPrimerVertice1, yPrimeraFilaPrimerVertice1, xPrimeraFilaSegundoVertice1, yPrimeraFilaSegundoVertice1, xPrimeraFilaTercerVertice1, yPrimeraFilaTercerVertice1); 
  
    // Segundo cuadrado
    dibujarIlusion(r, g, b, xPrimeraFilaPrimerVertice2, yPrimeraFilaPrimerVertice2, xPrimeraFilaSegundoVertice2, yPrimeraFilaSegundoVertice2, xPrimeraFilaTercerVertice2, yPrimeraFilaTercerVertice2);
  
    // Tercer cuadrado
    dibujarIlusion(r, g, b, xPrimeraFilaPrimerVertice1+400, yPrimeraFilaPrimerVertice1, xPrimeraFilaSegundoVertice1+400, yPrimeraFilaSegundoVertice1, xPrimeraFilaTercerVertice1+400, yPrimeraFilaTercerVertice1);
    
    // Cuarto cuadrado
    dibujarIlusion(r, g, b, xPrimeraFilaPrimerVertice2-200, yPrimeraFilaPrimerVertice2+200, xPrimeraFilaSegundoVertice2-200, yPrimeraFilaSegundoVertice2+200, xPrimeraFilaTercerVertice2-200, yPrimeraFilaTercerVertice2+200);
    
    // Quinto cuadrado
    dibujarIlusion(r, g, b, xPrimeraFilaPrimerVertice1+200, yPrimeraFilaPrimerVertice1+200, xPrimeraFilaSegundoVertice1+200, yPrimeraFilaSegundoVertice1+200, xPrimeraFilaTercerVertice1+200, yPrimeraFilaTercerVertice1+200);
    
    // Sexto cuadrado
    dibujarIlusion(r, g, b, xPrimeraFilaPrimerVertice2+200, yPrimeraFilaPrimerVertice2+200, xPrimeraFilaSegundoVertice2+200, yPrimeraFilaSegundoVertice2+200, xPrimeraFilaTercerVertice2+200, yPrimeraFilaTercerVertice2+200);
    
    // Séptimo cuadrado
    dibujarIlusion(r, g, b, xPrimeraFilaPrimerVertice1, yPrimeraFilaPrimerVertice1+400, xPrimeraFilaSegundoVertice1, yPrimeraFilaSegundoVertice1+400, xPrimeraFilaTercerVertice1, yPrimeraFilaTercerVertice1+400);
    
    // Octavo cuadrado
    dibujarIlusion(r, g, b, xPrimeraFilaPrimerVertice2, yPrimeraFilaPrimerVertice2+400, xPrimeraFilaSegundoVertice2, yPrimeraFilaSegundoVertice2+400, xPrimeraFilaTercerVertice2, yPrimeraFilaTercerVertice2+400);
    
    // Noveno cuadrado
    dibujarIlusion(r, g, b, xPrimeraFilaPrimerVertice1+400, yPrimeraFilaPrimerVertice1+400, xPrimeraFilaSegundoVertice1+400, yPrimeraFilaSegundoVertice1+400, xPrimeraFilaTercerVertice1+400, yPrimeraFilaTercerVertice1+400);


}

void dibujarIlusion(int r, int g, int b, int xPrimerVertice, int yPrimerVertice, int xSegundoVertice, int ySegundoVertice, int xTercerVertice, int yTercerVertice) {
  
  int radio = 60;
  fill(r, g, b);
  circle(xPrimerVertice, yPrimerVertice, radio);
  circle(xSegundoVertice, ySegundoVertice, radio);
  circle(xTercerVertice, yTercerVertice, radio);
  fill(0);
  noStroke();
  triangle(xPrimerVertice, yPrimerVertice, xSegundoVertice, ySegundoVertice, xTercerVertice, yTercerVertice);
   
}
