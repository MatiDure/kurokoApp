//TENTH SCREEN
class Screen10
{
  Button[] buttons;
  PImage screen4Img;
  
  void init()
  {
    buttons = new Button[]{(new Button(200/2 + 20, 30, "RETURN")),(new Button(width-200/2-20, 30, "NEXT"))};
    screen4Img = loadImage("screenBackground/screen4Img.jpg");
  }
  
  void update()
  {
   
   image(screen4Img,0,0,width,height);
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
