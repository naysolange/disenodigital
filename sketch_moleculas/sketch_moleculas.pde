
ArrayList<Molecula> moleculas = new ArrayList<Molecula>();

void setup() {
  size(1200,800);
  background(255);
  color rgb = color(0,143,57);
  
  for(int i=0;i<100;i++) {
    Molecula molecula = new Molecula(random(1200),random(800),random(10,150),rgb);
    moleculas.add(molecula);
  }
}

void draw() {
  frameRate(20);
  background(255);
  ArrayList<Molecula> moleculasMuertas = new ArrayList<Molecula>();
  
  for(Molecula molecula : moleculas) {
    molecula.desintegrarse();
    molecula.dibujarse();
    if(molecula.estaMuerta()) {
      moleculasMuertas.add(molecula);
    }
  }
  
  moleculas.removeAll(moleculasMuertas);
  
  color rgb = color(0,143,57);
  Molecula nuevaMolecula = new Molecula(random(1200),random(800),random(10,150),rgb);
  moleculas.add(nuevaMolecula);
}


class Molecula {
 
  float x;
  float y;
  float diametro;
  color rgb;
  ArrayList<Molecula> particulas; 
  
  Molecula(float x, float y, float diametro, color rgb) {
    this.x = x;
    this.y = y;
    this.diametro = diametro;
    this.particulas = new ArrayList<Molecula>();
    this.rgb = rgb;
  }
  
  void desintegrarse() {
    if(diametro > 0) { //<>//
      diametro -= 1;
      this.moverse();
      Molecula particula = new Molecula(x+random(-diametro,diametro),y+random(-diametro,diametro),diametro/4,rgb);
      particulas.add(particula);
    } 
  }
  
  void moverse() {
    x += random(-2.5, 2.5);
    y += random(-2.5, 2.5);
  }
  
  void dibujarse() {
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
