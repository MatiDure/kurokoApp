//FOURTH SCREEN
class Screen4
{
  Button[] buttons;
  ChatBox chatBox;
  PImage screen4Img;
  PImage teammate;
  String charName;
  String charSchool;
  boolean clicked = false;
  boolean secondText = false;
  
  void init()
  {
    buttons = new Button[]{(new Button(200/2 + 20, 30, "RETURN")),(new Button(width-200/2-20, 30, "NEXT"))};
    chatBox = new ChatBox(530,380,loadImage("otherImg/playButton.png"));
    screen4Img = loadImage("screenBackground/screen4And6Img.jpg");
    teammate = loadImage("playerFace/faceTeammate.png");
  }
  
  void update()
  {
   //background image
   image(screen4Img,0,0,width,height);
   //teammate image
   image(teammate,width/2-teammate.width,height-teammate.height);
   
   //chat box
   if(secondText) chatBox.text = "Brooo, it worked!";
   else chatBox.text = "Hey " + charName + ", welcome to\n" + charSchool + "'s basketball team! We are \nhappy you decided to join the basket \nclub. You'll definitely be a great addition.";
   if(chatBox.hoverOverPlay())
   {
    chatBox.tint[0] = 255;
    chatBox.tint[1] = 0;
    chatBox.tint[2] = 0;
    if(mousePressed && !clicked)
    {
     clicked = true; 
     secondText = true;
    }
   }
   else 
   {
    chatBox.tint[1] = 255;
    chatBox.tint[2] = 255;
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
          
          if(buttons[i].hover() || buttons[other].hover() || chatBox.hoverOverPlay()) cursor(HAND);
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
   
   void getNameAndSchool(String pCharName, String pSchoolName)
   {
     charName = pCharName;
     charSchool = pSchoolName;
   }

}
