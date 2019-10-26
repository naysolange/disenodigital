/**
Espejos de software - Nayla Portas
**/

import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
Instrucciones instrucciones;
Espejo espejo;
boolean doit = false;

void setup() {
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  instrucciones = new Instrucciones();
  espejo = new Espejo(opencv);
  video.start();
}

void draw() {
  
  scale(2);
  
  instrucciones.dibujar();
  
  if(doit) {
    espejo.dibujar();
  } 
    
}

void captureEvent(Capture c) {
  c.read();
}

void keyPressed() {
  
  switch(key) {
    case 'g': 
      saveFrame();
      break;
    case 'e':
      doit = true;
      break;
    case 'i':
      doit = false;
      break;
  }
  
}
