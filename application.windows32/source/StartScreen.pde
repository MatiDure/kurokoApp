//FIRST SCREEN
class StartScreen
{
  PImage startScreenImg;
  Button button;
  int buttonWidth = 240;
  int buttonHeight = 50;
  int buttonTextSize = 20;
  int[] rgbButton = {255,255,255};
  int[] rgbButtonText = {60,60,80};
  
  
  void init()
  {
   startScreenImg = loadImage("screenBackground/startScreenImg.png"); 
   button = new Button(width/2,height - 60,"START");
  }
  void update()
  {
    
    //hover over start button
    if(button.hover())
    {
      button.buttonR = 85;
      button.buttonG = 3;
      button.buttonB = 43;
      button.buttonWidth = 260;
      button.buttonHeight = 60;
      button.buttonTextSize = 25;
      cursor(HAND);
    }
    else
    {
      button.buttonR = 64;
      button.buttonG = 68;
      button.buttonB = 88;
      button.buttonWidth = buttonWidth;
      button.buttonHeight = buttonHeight;
      button.buttonTextSize = 20;
      cursor(ARROW); 
    }
    
    strokeWeight(0);
    image(startScreenImg, 0, 0, width,height);
    //title
    fill(100,100,100,100);
    rectMode(CENTER);
    rect(width/2, 60, 650, 70, 7);
    fill(255,255,255);
    textAlign(CENTER, CENTER);
    textSize(70);
    text("Kuroko no basket", width/2,50);
    
    //button 
    button.update();
    
  }
  
  boolean nextScreen()
  {
   if(button.hover())
   {
     return true; 
   }
   return false;
  }
}
