
public class Espejo {
  
  private OpenCV opencv;
  
  Espejo(OpenCV opencv) {
    this.opencv = opencv;
  }
  
  public void dibujar() {
    opencv.loadImage(video);
    opencv.useGray();
    opencv.findCannyEdges(mouseX, mouseY);
    opencv.dilate();
    opencv.blur(6);
    opencv.equalizeHistogram();
    image(opencv.getOutput(), 0, 0); 
  }
  
}
