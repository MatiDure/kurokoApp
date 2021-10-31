//FIFTH SCREEN
class Screen5 extends PlayerInfo
{
  Button[] buttons;
  ChatBox[] chatBoxes;
  PImage screen5Img;
  PImage[] teammates;
  
  void init()
  {
    buttons = new Button[]{(new Button(200/2 + 20, 30, "START SCREEN")),(new Button(width-200/2-20, 30, "NEXT"))};
    teammates = new PImage[]{loadImage("playerFace/backHead.png"),loadImage("playerFace/backHead2.png")};
    chatBoxes = new ChatBox[]{new ChatBox(width*0.25+240,height-250,true,width*0.25+150,height-270),new ChatBox(width*0.5+220,height-170,true,width*0.5+130,height-190)};
    for(int i = 0;i<chatBoxes.length;i++)
    {
     chatBoxes[i].boxWidth = 200;
     chatBoxes[i].boxHeight = 50;
    }
    screen5Img = loadImage("screenBackground/screen5Img.png");
  }
  
  void update()
  {
   
   image(screen5Img,0,0,width,height);
   
   //teammates images
   image(teammates[0],width*0.25,height-300,200,300);
   image(teammates[1],width*0.5,height-200,150,200);
   
   //text box for teammates
   chatBoxes[0].text = PlayerInfo.name+" is a beast...";
   chatBoxes[1].text = "Yeah, he's gonna get far";

   
   for(int i=0;i<chatBoxes.length;i++)
   {
    chatBoxes[i].update(); 
   }
   
   
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
