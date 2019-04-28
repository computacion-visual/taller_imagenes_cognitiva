color[] segmentImage(color[] pixelArray, int minValue, int maxValue){
  for(int i = 0; i < pixelArray.length; i++) {
    int brightness = int(brightness(pixelArray[i]));
    if (brightness < minValue || brightness > maxValue) {
      pixelArray[i] = color(0, 0, 0);
    }
  }

  return pixelArray;
}

int[] segmentHisto(color[] pixelArray){
  int[] hist = new int[256];
   for (int i = 0; i < pixelArray.length; i++) {
    int value = int(brightness(pixelArray[i]));
    hist[value]++; 
  }
  return hist;
}

void drawsegmentHisto(int[] hist, color strokeColor, PImage img, int minValue, int maxValue){
  int histMax = max(hist);
  
  stroke(strokeColor);
  for (int i = minValue; i < maxValue; i+=2) {
    int which = int(map(i, 0, img.width, 0, 255));
    int y = int(map(hist[which], 0, histMax, img.height, 0));
    line(612 + i, img.height + 50, 612 + i, y + 50);
  }
}