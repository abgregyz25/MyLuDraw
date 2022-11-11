////variables...
float colLayers = 2;
String screenPhase = "bgInitialized";
int widthExt = 2;


//setup...
void setup() {
  size(300, 600);
  //fullScreen();
  //noStroke();

  // println((((tileCount*4)+1)/tileSeperator)*(width/tileSeperator));
}

//draw...
void draw() {
  switch (screenPhase) {
  case "bgInitialized":
    background(255);
    fill(0);
    textSize(18);
    textAlign(CENTER);
    text("Choose background colour..", width/2, 40);
    bgColInz();
    break;
  }
}

//functions...

//background color algorthms needs work...
void bgColInz() {  ////Initialize background colors.
  /// background variables
  // background colors
  float R = 0;
  float G = 0;
  float B = 0;
  //BG layer count
  float Bc = 0;
  float Gc = 0;
  // background colors
  float bgTileX = 0;
  float bgTileY = 0;
  float tileCount = pow(colLayers+1, 3);
  float tileSeperator = (colLayers*4)+1;
  while ((((tileCount*4)+1)/tileSeperator)*(width/tileSeperator) > height - 120) {
    tileSeperator += 2;
    println("met");
  }
  bgTileX = (width/tileSeperator);
  bgTileY = 90;
  for (float i = 0; i < tileCount; i++) {
    //println("R:"+R+" G:"+G+" B:"+B);
    fill(R, G, B);
    
    ////use below code to expand tiles
    //rect(bgTileX - ((width/tileSeperator)/widthExt), bgTileY - ((width/tileSeperator)/widthExt), (width/tileSeperator) + ((width/tileSeperator)/(widthExt/2)), (width/tileSeperator) + ((width/tileSeperator)/(widthExt/2)));
    rect(bgTileX, bgTileY, (width/tileSeperator), (width/tileSeperator));
    Bc++;
    B+=255/colLayers;
    if (Bc >colLayers) {
      Bc =0;
      B =0;
      Gc++;
      G+=255/colLayers;
      if (Gc >colLayers) {
        Gc =0;
        G = 0;
        R+=255/colLayers;
      }
    }
    bgTileX += (width/tileSeperator)*2;
    if (bgTileX >= width - (width/tileSeperator)) {
      bgTileY += (width/tileSeperator)*2;
      bgTileX = (width/tileSeperator);
    }
  }  
  //println("R:"+R+" G:"+G+" B:"+B +" Rt:"+Rt+" Gt:"+Gt+" Bt:"+Bt);
}
