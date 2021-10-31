//SIXTH SCREEN
class Screen6 extends PlayerInfo
{
  Button[] buttons;
  Button[] yesNo;
  PImage screen6Img;
  PImage teammateAfterGame;
  ChatBox chatBox;
  boolean secondText = false;
  boolean thirdText = false;
  boolean clicked = false;
  boolean goingForBite;
  boolean choseSomething = false;
  boolean displayWarning = false;
  int counter = 92;
  
  
  void init()
  {
    buttons = new Button[]{(new Button(200/2 + 20, 30, "START SCREEN")),(new Button(width-200/2-20, 30, "NEXT"))};
    yesNo = new Button[]{(new Button(650,450,"YES")),(new Button(720,450,"NO"))};
    yesNo[0].rect = false;
    yesNo[0].buttonWidth = 40;
    yesNo[0].buttonHeight = 20;
    yesNo[1].rect = false;
    yesNo[1].buttonWidth = 30;
    yesNo[1].buttonHeight = 20;
    screen6Img = loadImage("screenBackground/screen4And6Img.jpg");
    teammateAfterGame = loadImage("playerFace/teammateAfterGame.png");
    //float pPosX,float pPosY, int pWidth, int pHeight, String pText, float pTextPosX, float pTextPosY, boolean pNoMoreText
    chatBox = new ChatBox(600,410, 300,120, 600-130,400-45, false);
  }
  
  void update()
  {

   //background img
   image(screen6Img,0,0,width,height);
   //teammate img
   image(teammateAfterGame,width*0.70,height*0.4,300,480);
   //chatbox update
   if(!secondText)chatBox.text = "That was crazy, " + PlayerInfo.name + "! You \ndestroyed <enemy team> all by \nyourself. You are officially part of the \nstarting team from now on!";
   
   if(!secondText && chatBox.hoverOverPlay())
   {
    if(mousePressed && !clicked)
    {
      secondText = true;
      chatBox.text = "We are all going to get a bite to \nreplenish our energy, would you \nlike to join?";
      chatBox.noMoreButton = true;
      clicked = true; 
    }
   }
   chatBox.update();
   
   //yes or no answer update
   if(!thirdText && secondText)
   {
     for(int i = 0; i<yesNo.length; i++)
     {
      if(yesNo[i].hover())
      {
        yesNo[i].textFill[0] = 255;
        yesNo[i].textFill[1] = 0;
        yesNo[i].textFill[2] = 0;
        if(mousePressed && !clicked)
        {
          if(i == 0) goingForBite = true;
          else goingForBite = false;
          choseSomething = true;
          thirdText = true;
          clicked = true;
          break;
        }
      }
      else
      {
        yesNo[i].textFill[0] = 230;
        yesNo[i].textFill[1] = 230;
        yesNo[i].textFill[2] = 230;
      }
      yesNo[i].update();
     }
     
   }
   else if(thirdText)
   {
     if(goingForBite)chatBox.text = "Great, let's go!";
     else chatBox.text = "Next time then! See you tomorrow!";
   }
   
   //if user doesnt press play bottom or chooses an answer
   if(displayWarning)
   {
    textSize(20);
    fill(255,150);
    rect(width/2,height-100,20*26/2,40,7);
    fill(255,0,0);
      if(!secondText) text("Press play in the text box",width/2,height-100);
      else text("Choose an option",width/2,height-100);
    counter--;
      if(thirdText || counter == 0)
      {
       counter = 92;
       displayWarning = false;
      }
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
          
          if(yesNo != null)
          {
            if(buttons[i].hover() || buttons[other].hover() || (chatBox.hoverOverPlay() && !secondText) || yesNo[0].hover() || yesNo[1].hover()) cursor(HAND);
            else cursor(ARROW);
          }
          else
          {
            if(buttons[i].hover() || buttons[other].hover() || (chatBox.hoverOverPlay() && !secondText)) cursor(HAND);
            else cursor(ARROW);
          }
            
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
     if(buttons[1].hover())
     {
       if(thirdText) return true;
       displayWarning = true;
     }
     return false;
   }   

}
