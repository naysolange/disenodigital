
Molecula molecula;

void setup() {
  size(1200,800);
  background(255);
  color rgb = color(0,143,57);
  molecula = new Molecula(random(1200),random(800),200,rgb);
}

void draw() {
  frameRate(60);
  background(255);
  molecula.desintegrarse();
  molecula.dibujarse();
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
    noStroke();
    fill(rgb);
    circle(x,y,diametro);  
    for(Molecula p : particulas) {
      p.desintegrarse();
      p.dibujarse();
    }
  }
  
}
