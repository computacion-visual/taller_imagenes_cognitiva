
PGraphics sourceCanvas;
PGraphics destinationCanvas;
PImage source;
PImage destination;


void setup(){
size(1350, 500);
sourceCanvas = createGraphics(750, 500);
destinationCanvas = createGraphics(750, 500);
source = loadImage("doggy.jpg");
destination = createImage(source.width, source.height, RGB);

sourceCanvas.beginDraw();
sourceCanvas.background(100);
sourceCanvas.image(source, 50, 50);
sourceCanvas.endDraw();

source.loadPixels();
destination.loadPixels();

for (int x = 0; x < source.width; x++) {
   for(int y = 0; y < source.height; y++){
    int loc = x + y * source.width;
    destination.pixels[loc] = (source.pixels[loc]);
   }
}
destination.updatePixels();
destinationCanvas.beginDraw();
destinationCanvas.background(100);
destinationCanvas.image(destination, 50, 50);
destinationCanvas.endDraw();
}

void draw(){ 

image(sourceCanvas, 0, 0);
image(destinationCanvas, 600,0);


/*
//Draw Gray
for (int x = 0; x < source.width; x++) {
  for (int y = 0; y < source.height; y++ ) {
    int loc = x + y * source.width;
    int b = int(brightness(source.pixels[loc]));
    destination.pixels[loc] = color(b, b, b);
  }
}
destination.updatePixels();
destinationCanvas.beginDraw();
destinationCanvas.background(100);
destinationCanvas.image(destination, 50, 50);
destinationCanvas.endDraw();
*/

/*
//Convolution masks
int[] matriz = {1, 0, -1, 0, 0, 0, -1, 0, 1};
//int[] matriz = {0, -1, 0, -1, 5, -1, 0, -1, 0};
//int[] matriz = {1/9, 1/9, 1/9, 1/9, 1/9, 1/9, 1/9, 1/9, 1/9};
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
*/


//Draw Histogram
int[] hist = new int[256];

for (int x = 100; x < destination.width; x++) {
  for (int y = 100; y < destination.height; y++ ) {
    int loc = x + y * source.width;
    int bright = int(brightness(source.pixels[loc]));               
    hist[bright]++; 
  }
}

int histMax = max(hist);
stroke(0);
for (int i = 0; i < destination.width; i += 2) {
  int which = int(map(i, 0, destination.width, 0, 255));
  int y = int(map(hist[which], 0, histMax, destination.height, 0));
  line(650+i, destination.height+50, 650 + i, y+40);
}
}
