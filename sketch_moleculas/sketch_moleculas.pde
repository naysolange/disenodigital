
ArrayList<Molecula> moleculas = new ArrayList<Molecula>();
PImage img;


void setup() {
  size(1200,800);
  img = loadImage("humo.jpg");
  img.resize(1200,800);
  image(img, 0, 0);
  colorMode(HSB, 360, 100, 100);
  
  // Creo moléculas y las guardo en una lista
  for(int i=0;i<90;i++) {
    Molecula molecula = new Molecula(random(width),random(height),random(10,150),2.5);
    moleculas.add(molecula);
  }
}

void draw() {
  frameRate(20);
  background(img);
  ArrayList<Molecula> moleculasMuertas = new ArrayList<Molecula>();
  
  // Dibujo las moléculas
  for(Molecula molecula : moleculas) {
    molecula.desintegrarse();
    molecula.dibujarse();
    // Si la molécula ya murió la agrego a una lista para después borrarla
    // (esto es para evitar que el tamaño de la lista crezca infinitamente y consuma memoria que lentifica la animación)
    if(molecula.estaMuerta()) {
      moleculasMuertas.add(molecula);
    }
  }
  
  // Elimino las moléculas que murieron
  moleculas.removeAll(moleculasMuertas);
  
  // Creo una nueva molécula 
  Molecula nuevaMolecula = new Molecula(random(width),random(height),random(10,150),2.5);
  moleculas.add(nuevaMolecula);
}


class Molecula {
 
  float x;
  float y;
  float diametro;
  float velocidad;
  ArrayList<Molecula> particulas; 
  
  Molecula(float x, float y, float diametro, float velocidad) {
    this.x = x;
    this.y = y;
    this.diametro = diametro;
    this.particulas = new ArrayList<Molecula>();
    this.velocidad = velocidad;
  }
  
  void desintegrarse() {
    if(diametro > 0) { //<>//
      diametro -= 1;
      this.moverse();
      float nuevoDiametro = diametro/random(3,6);
      Molecula particula = new Molecula(x+random(-diametro,diametro),y+random(-diametro,diametro),nuevoDiametro,random(-velocidad,velocidad));
      particulas.add(particula);
    } 
  }
  
  void moverse() {
    x += random(-velocidad, velocidad);
    y += random(-velocidad, velocidad);
  }
  
  void dibujarse() {
    // Solo dibujo cuando tiene un diámetro válido
    if(diametro > 0) {
      this.dibujarCirculo();
      for(Molecula p : particulas) {
        p.desintegrarse();
        p.dibujarse();
      }
    }
  }
  
  boolean estaMuerta() {
    return diametro <= 0;  
  }
  
  
  void dibujarCirculo() {
    noStroke();
    float radio = diametro/2;
    float tono = random(80, 150);
    float saturacion = 90;
    float brillo = 100;
    for(float r = radio; r > 0; --r) {
      fill(tono, saturacion, brillo);
      ellipse(x, y, r, r);
      tono++;
      saturacion--;
      brillo--;
      if(tono == 151) {
        tono = 80;
      }
      if(brillo == 0){
        brillo = 100;
      }
      if(saturacion == 0){
        saturacion = 100;
      }
    }
  }


  
}
