//SEVENTH SCREEN
class Screen7
{
  Button[] buttons;
  PImage screen7Img;
  ChatBox[] conversation;
  
  void init()
  {
    buttons = new Button[]{(new Button(200/2 + 20, 30, "START SCREEN")),(new Button(width-200/2-20, 30, "NEXT"))};
    screen7Img = loadImage("screenBackground/screen7Img.jpg");
    conversation = new ChatBox[]{new ChatBox(width*0.2,height*0.25,30*11,60,"This looks delicious!",width*0.2-(30*11/2)+10,height*0.25-15,true),
                                  new ChatBox(width*0.7,height*0.5,30*17,60,"This is not going to be enough...",width*0.7-(30*17/2)+10,height*0.5-15,true),
                                  new ChatBox(width*0.5,height*0.9,30*11,60,"Let's eat! I'm starving!",width*0.5-(30*11/2)+10,height*0.9-15,true)};
    for(int i=0; i<conversation.length; i++)conversation[i].textSize = 30;
  }
  
  void update()
  {
   
   image(screen7Img,0,0,width,height);
   for(int i=0; i<conversation.length; i++)conversation[i].update();
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
