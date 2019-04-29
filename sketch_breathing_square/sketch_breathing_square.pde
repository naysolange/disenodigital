void setup() {
  size(800,800);
} 

float angulo = 0;

void draw() {

    background(255);
    delay(200);
    
    // Dibuja el cuadrado central que gira
    fill(148,0,211);
    noStroke();
    translate(width/2, height/2);
    angulo = angulo + PI/12;
    rotate(angulo);
    rectMode(CENTER);
    square(0,0,550);

    // Dibuja los cuatro cuadrados en las esquinas
    resetMatrix();
    rectMode(CORNER);
    fill(239,169,074);
    int x = 0;
    int y = 0;
    int ancho = 360;
    int separacion = (width/2)+40;
    square(x,y,ancho);
    square(x+separacion,y,ancho);
    square(x,y+separacion,ancho);
    square(x+separacion,y+separacion,ancho);

    // Setea color de los circulos
    if(key == 'c' || key == 'C') {
      fill(034,113,179);
    } else {
      fill(0);
    }
    
    // Dibuja circulos en el cuadrado superior izquierdo
    translate(x+ancho/2, y+ancho/2);
    circle(x,y,100);
    // Circulos chicos alrededor del central
    for(int i=0; i<12; i++) {
      rotate(PI/6);
       circle(x-70,y-50,30);
    } 
    resetMatrix();
    
    // Dibuja circulos en el cuadrado superior derecho
    translate(x+separacion+ancho/2, y+ancho/2);
    circle(x,y,100);
    // Circulos grandes alrededor del central
    for(int i=0; i<5; i++) {
      rotate(2*PI/5);
      circle(x-100,y-50,113);
    } 
    resetMatrix();
    
    // Dibuja circulos en el cuadrado inferior izquierdo
    translate(x+ancho/2,y+separacion+ancho/2);
    circle(0,0,100);
    // Circulos grandes alrededor del central
    for(int i=0; i<5; i++) {
      rotate(2*PI/5);
      circle(0,-110,113);
    } 
    resetMatrix();
    
    // Dibuja circulos en el cuadrado inferior derecho
    translate(x+separacion+ancho/2,y+separacion+ancho/2);
    circle(0,0,100);
    // Circulos grandes alrededor del central
    for(int i=0; i<12; i++) {
      rotate(PI/6);
      circle(x-70,y-50,30);
    } 
    
    if(mousePressed) {
      save("composicion.jpg");
    }
 
}
