//thirteenth SCREEN
import java.util.Hashtable;
class Screen13
{
  Button button;
  PImage screen4Img;
  PFont font;
  PFont defaultFont;
  PImage[] myWords;
  PImage mura;
  
  void init()
  {
    button = new Button(200/2 + 180, 35, "START SCREEN");
    screen4Img = loadImage("screenBackground/nbaRoute.png");
    myWords = new PImage[]{loadImage("screenBackground/letterMiNBA.png"),loadImage("screenBackground/letterKiNBA.png"),loadImage("screenBackground/letterAkNBA.png"),
                            loadImage("screenBackground/letterKuNBA.png"),loadImage("screenBackground/letterMuNBA.png"),loadImage("screenBackground/letterKaNBA.png"),
                             loadImage("screenBackground/letterAoNBA.png")};
               mura = loadImage("screenBackground/letterMuNBA.png"); 
  }
  
  void update()
  {
   
   image(screen4Img,0,0,width,height);
   //screen text
   switch(PlayerInfo.name)
   {
    case "Akashi":
      image(myWords[2],20,60,500,200);
      break;
    case "Midorima":
      image(myWords[0],20,60,500,200);
      break;
    case "Kise":
      image(myWords[1],20,60,500,200);
      break;
    case "Kuroko":
      image(myWords[3],20,60,500,200);
      break;
    case "Murasakibara":
      image(myWords[4],20,60,500,200);
      break;
    case "Kagami":
       image(myWords[5],20,60,500,200);
      break;
    case "Aomine":
      image(myWords[6],20,60,500,200);
      break;
        
   }
   
   //screen buttons updates
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
