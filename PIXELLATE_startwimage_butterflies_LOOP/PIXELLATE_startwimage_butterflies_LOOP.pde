// Sketch by Kylie Nicholson
// just as the details of nature become intelligible as I get closer with my camera: zooming in, framing to tell a story-- so do the pixel data become visible only by zooming in.

PImage myFace1;
PImage myFace2;
// Size of each cell in the grid, ratio of window size to video size
int pixelWidth = 1;
// Number of columns and rows in our system
int cols, rows;
int time = millis();
int state = 0;

void setup(){
  size(1000,724);
  //size(534, 800); 
  //myFace = loadImage("butterflies.jpg"); 
  myFace2 = loadImage("myface-bigger.png");
  myFace1 = loadImage("butterflies.jpg"); 
    frameRate(0.75);
    image(myFace1, 0, 0);

}

void draw(){
  
    if(state == 0){
    background(0);
    myFace1.loadPixels();
    displayPixels(myFace1);
    if(pixelWidth == 120){
      pixelWidth=1; 
      state++;
    }
    }
    if(state == 1){
    background(0);
    myFace2.loadPixels();
    image(myFace2, 250, 0); 
    displayPixels(myFace2); 
    if(pixelWidth == 120){
      pixelWidth=1; 
      state--;
    }
    }

  /*
  image(myFace, 0, 0);
  myFace.loadPixels();
  displayPixels();
  */
  //if(time % 5000 == 0) 
    //displayPixels();
  
}

void displayPixels(PImage myFace){
  //if(time % 1000 == 0)
  println(pixelWidth);
  if(pixelWidth < 10)
    pixelWidth = pixelWidth+1; 
  /*else if(pixelWidth < 30)
    pixelWidth = pixelWidth + 10;
  else
    pixelWidth = 30; */
  else if(pixelWidth < 120)
    pixelWidth = pixelWidth + 10;
  else if(pixelWidth < 200)
    pixelWidth = pixelWidth + 20;
  else
    pixelWidth = 200; 
 
    
  cols = width/pixelWidth;
  rows = height/pixelWidth;
  
 
  //image(myFace, 0, 0); 
  //myFace.resize(0, 1000);

// Begin loop for columns
  for (int i = 0; i < cols; i++) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++) {
      
      // Where are we, pixel-wise?
      int x = i*pixelWidth;
      int y = j*pixelWidth;
      // Looking up the appropriate color in the pixel array
      color c = myFace.pixels[x+y*myFace.width];
      fill(c);
      int r= (int) red(myFace.pixels[x+y*myFace.width]);
      int g= (int) blue(myFace.pixels[x+y*myFace.width]);
      int b= (int) green(myFace.pixels[x+y*myFace.width]);
      //println(r + ", " + g + ", " + b);
      text(r + ", " + g + ", " + b, x, y);
      noStroke();
      // this draws the pixel. I wonder if I could re-write this code with the pixel as an object? I probably could. 
      // OR i could make an array of pixels? I need to be able to access each & its location in order to do hover effects. 
      rect(x,y,pixelWidth,pixelWidth);
    }
  }
}
