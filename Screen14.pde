//fourteenth SCREEN
class Screen14
{
  Button button;
  PImage screen14Img;
  
  void init()
  {
    button = new Button(width/2, 35, "START SCREEN");
    screen14Img = loadImage("screenBackground/notNbaRoute.jpg");
  }
  
  void update()
  {
   noStroke();
   image(screen14Img,0,0,width,height);
   fill(0,60);
   rect(width/2,height/2+200,500,200,14);
   fill(255);
   textSize(30);
   text(PlayerInfo.name + " has been working in \naccounting for many years now.\nHe is a loving husband, \nand a father of four!", width/2,height/2+200);
   //screen button update
          if(button.hover())
          {
            button.buttonWidth = 210;
            button.buttonHeight = 55;
            button.buttonR = 85;
            button.buttonG = 3; 
            button.buttonB = 43;
            button.buttonTextSize = 25;
          }
          else
          {
            button.buttonWidth = 200;
            button.buttonHeight = 50;
            button.buttonR = 64;
            button.buttonG = 68; 
            button.buttonB = 88;
            button.buttonTextSize = 20;
          }
          if(button.hover()) cursor(HAND);
          else cursor(ARROW);
          
          button.update(); 
  }
  
  boolean previousScreen()
   {
     if(button.hover()) return true;
     return false; 
   }
}
