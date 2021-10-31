//FOURTH SCREEN
class Screen4 extends PlayerInfo
{
  Button[] buttons;
  ChatBox chatBox;
  PImage screen4Img;
  PImage teammate;
  boolean clicked = false;
  boolean secondText = false;
  boolean displayWarning = false;
  int counter = 92;
  
  void init()
  {
    buttons = new Button[]{(new Button(200/2 + 20, 30, "START SCREEN")),(new Button(width-200/2-20, 30, "NEXT"))};
    chatBox = new ChatBox(530,380,secondText, 386, 320);
    screen4Img = loadImage("screenBackground/screen4And6Img.jpg");
    teammate = loadImage("playerFace/faceTeammate.png");
  }
  
  void update()
  {
   //background image
   image(screen4Img,0,0,width,height);
   //teammate image
   image(teammate,width/2-teammate.width,height-teammate.height);
   
   if(!secondText)
   {
     if(chatBox.text == null) chatBox.text = "Hey " + PlayerInfo.name + ", welcome to\n" + PlayerInfo.school + "'s basketball team! We are \nhappy you decided to join the basket \nclub. You'll definitely be a great addition.";
   }

   if(displayWarning)
   {
    textSize(20);
    fill(255,150);
    rect(width/2,height-100,20*26/2,40,7);
    fill(255,0,0);
    text("Press play in the text box",width/2,height-100);
    counter--;
      if(counter == 0)
      {
       counter = 92;
       displayWarning = false;
      }
   }
   if(!secondText && chatBox.hoverOverPlay())
   {
    if(mousePressed && !clicked)
    {
     clicked = true; 
     secondText = true;
     chatBox.noMoreButton = true;
     chatBox.text = "Quick! Get Ready! We have a friendly\nmatch against <rival team>. We will rate \nyou based on your perfomance of this \ngame.";
    }
   }
   
   chatBox.update();

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
          
          if(buttons[i].hover() || buttons[other].hover() || (!secondText && chatBox.hoverOverPlay())) cursor(HAND);
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
     if(buttons[1].hover()){
      if(secondText) return true;
      else displayWarning = true;
     }
     return false;
   }   

}
