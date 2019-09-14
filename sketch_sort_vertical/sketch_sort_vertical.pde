boolean doit = false;
PImage img;
int y = 0;
int y2;
int index = width/2;
int z;


void setup() {
  size(509,765);
  colorMode(HSB, 255, 100, 100);
  img = loadImage("monalisa.jpg");
  image(img, 0, 0);
 /* loadPixels();
  
  for(int i=0; i<pixels.length; i++) {
    pixels[i] = color(random(255),100,100);
  }
  
  updatePixels(); */
}

void draw() {
  
  if(doit) {
   int y1 = y;
   
   // selection
   for(int i=0; i<width/2; i++) {
     float max = -1;
     for(int j=y; j<height; j++) {
       int c1 = get(i, j);
       float h = hue(c1);
       if(h>max) {
         y2 = j;
         max = h;
       } 
     }
     swapSelection(y1,y2,i); 
   }
    
    if(y<height-1) {
      y++;
    }
    
    // burbuja
    for (int i=width/2; i< width-1; i++) {
      for (int j=0; j< height; j++) {
        color c1 = get(i, j);
        color c2 = get(i+1, j);
        if ( hue(c1) < hue(c2) ) {
          swapBubble(i, j, c1, c2);
        }
      }
    }
  }
  
}


void swapSelection(int y1, int y2, int x) {
  color temp = get(x,y1);
  set(x, y1, get(x, y2));
  set(x, y2, temp);
  
}

void swapBubble(int x, int y, color a, color b) {
  set(x+1, y, a);
  set(x, y, b);
}



void mousePressed() {
 
  doit = !doit;
  
}
