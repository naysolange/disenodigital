
ArrayList<Molecula> moleculas = new ArrayList<Molecula>();

void setup() {
  size(1200,800);
  background(255);
  
  // Creo moléculas y las guardo en una lista
  for(int i=0;i<100;i++) {
    color colorDeLaMolecula = color(0,random(50,245),57);
    Molecula molecula = new Molecula(random(1200),random(800),random(10,150),colorDeLaMolecula,2.5);
    moleculas.add(molecula);
  }
}

void draw() {
  frameRate(20);
  background(255);
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
  color rgb = color(0,random(50,245),57);
  Molecula nuevaMolecula = new Molecula(random(1200),random(800),random(10,150),rgb,2.5);
  moleculas.add(nuevaMolecula);
}


class Molecula {
 
  float x;
  float y;
  float diametro;
  color rgb;
  float velocidad;
  ArrayList<Molecula> particulas; 
  
  Molecula(float x, float y, float diametro, color rgb, float velocidad) {
    this.x = x;
    this.y = y;
    this.diametro = diametro;
    this.particulas = new ArrayList<Molecula>();
    this.rgb = rgb;
    this.velocidad = velocidad;
  }
  
  void desintegrarse() {
    if(diametro > 0) { //<>//
      diametro -= 1;
      this.moverse();
      Molecula particula = new Molecula(x+random(-diametro,diametro),y+random(-diametro,diametro),diametro/4,rgb,random(-velocidad,velocidad));
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
      noStroke();
      fill(rgb);
      circle(x,y,diametro);  
      for(Molecula p : particulas) {
        p.desintegrarse();
        p.dibujarse();
      }
    }
  }
  
  boolean estaMuerta() {
    return diametro <= 0;  
  }
  
}
