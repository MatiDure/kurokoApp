//twelveth SCREEN
class Screen12
{
  Button[] buttons;
  PImage screen10Img;
  ChatBox aFewYearsLater;
  
  void init()
  {
    buttons = new Button[]{(new Button(200/2 + 20, 30, "START SCREEN")),(new Button(width-200/2-20, 30, "NEXT"))};
    screen10Img = loadImage("screenBackground/screen8Img.jpg");
    aFewYearsLater = new ChatBox(width/2,height*0.9,21*30,60,"YET AGAIN, ANOTHER FEW YEAR LATER...",width/2-(20*30/2),height*0.9-20,true);
    //aFewYearsLater.boxWidth = 600;
    aFewYearsLater.textSize = 30;
  }
  
  void update()
  {
   image(screen10Img,0,0,width,height);
   aFewYearsLater.update();
   for(int i=0; i<buttons.length; i++)
      {
          int other;
          
          if(i == 0) other = 1;
          else other = 0;
          if(buttons[i].hover())
          {
            buttons[i].buttonWidth = 210;
            buttons[i].buttonHeight = 55;
            buttons[i].buttonR = 85;
            buttons[i].buttonG = 3; 
            buttons[i].buttonB = 43;
            buttons[i].buttonTextSize = 25;
          }
          else
          {
            buttons[i].buttonWidth = 200;
            buttons[i].buttonHeight = 50;
            buttons[i].buttonR = 64;
            buttons[i].buttonG = 68; 
            buttons[i].buttonB = 88;
            buttons[i].buttonTextSize = 20;
          }
          
          if(buttons[i].hover() || buttons[other].hover()) cursor(HAND);
          else cursor(ARROW);
            
          buttons[i].update();
      }
  }
  
  boolean previousScreen()
   {
     if(buttons[0].hover()) return true;
     return false; 
   }
   
   boolean nextScreen()
   {
     if(buttons[1].hover()) return true;
     return false;
   }   
}
