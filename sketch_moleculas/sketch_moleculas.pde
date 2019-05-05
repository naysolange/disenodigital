import processing.sound.*;

ArrayList<Molecula> moleculas = new ArrayList<Molecula>();
PImage img;
SoundFile hit;

void setup() {
  size(1200,800);
  
  // Carga la imagen de fondo
  img = loadImage("humo.jpg");
  img.resize(1200,800);
  image(img, 0, 0);
  
  // Carga y ejecuta el audio base
  SoundFile base = new SoundFile(this, "space-synth.wav");
  base.loop();
  // Carga el audio de hit para cada molécula
  hit = new SoundFile(this, "Deep-Kick.wav");
    
  // Setea el modo de color a HSB
  colorMode(HSB, 360, 100, 100);
  
  // Crea moléculas y las guarda en una lista
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
      // Reproduzco el sonido por cada molécula muerta (no en todos los frames porque suena feo sino)
      if(frameCount % 5 == 0) {
        // El volúmen depende del tamaño original que tenía la molécula
        hit.amp(1/120*molecula.diametroOriginal-10/120-1);
        hit.play();
      }
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
  float diametroOriginal;
  float velocidad;
  ArrayList<Molecula> particulas; 
  
  Molecula(float x, float y, float diametro, float velocidad) {
    this.x = x;
    this.y = y;
    this.diametro = diametro;
    this.particulas = new ArrayList<Molecula>();
    this.velocidad = velocidad;
    this.diametroOriginal = diametro;
  }
  
  void desintegrarse() {
    // Solo sigue desintegrando si la molécula tiene un diámetro válido
    if(diametro > 0) { //<>//
      diametro -= 1;
      this.moverse();
      float nuevoDiametro = diametro/random(3,6);
      Molecula particula = new Molecula(x+random(-diametro,diametro),y+random(-diametro,diametro),nuevoDiametro,random(-velocidad,velocidad)); //<>//
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
    float tono = random(80, 165);
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
