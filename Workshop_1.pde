size(1100, 500);
PGraphics sourceCanvas = createGraphics(500, 500);
PGraphics destinationCanvas = createGraphics(500, 500);
PImage source = loadImage("kiwi.jpg");
PImage destination = createImage(source.width, source.height, RGB);

sourceCanvas.beginDraw();
sourceCanvas.background(100);
sourceCanvas.image(source, 50, 50);
sourceCanvas.endDraw();
image(sourceCanvas, 0, 0);

source.loadPixels();
/*destination.loadPixels();
for (int x = 0; x < source.width; x++) {
  for (int y = 0; y < source.height; y++ ) {
    int loc = x + y * source.width;
    int b = int(brightness(source.pixels[loc]));
    destination.pixels[loc] = color(b, b, b);
  }
}
destination.updatePixels();*/

//int[] matriz = {1, 0, -1, 0, 0, 0, -1, 0, 1};
//int[] matriz = {0, -1, 0, -1, 5, -1, 0, -1, 0};
int[] matriz = {1/9, 1/9, 1/9, 1/9, 1/9, 1/9, 1/9, 1/9, 1/9};

destination.loadPixels();
for (int x = 1; x < source.width-1; x++) {
  for (int y = 1; y < source.height-1; y++ ) {
    int loc = x + y * source.width;
     
    int b = matriz[8] * source.pixels[loc-1-source.width]  + matriz[7] * source.pixels[loc-source.width]   + matriz[6] * source.pixels[loc+1-source.width] + 
            matriz[5] * source.pixels[loc-1]               + matriz[4] * source.pixels[loc]                + matriz[3] * source.pixels[loc+1] + 
            matriz[2] * source.pixels[loc-1+source.width]  + matriz[1] * source.pixels[loc+source.width]   + matriz[0] * source.pixels[loc+1+source.width];
                
    destination.pixels[loc] = b;
  }
}
destination.updatePixels();

destinationCanvas.beginDraw();
destinationCanvas.background(100);
destinationCanvas.image(destination, 50, 50);
destinationCanvas.endDraw();
image(destinationCanvas, 600, 0);
