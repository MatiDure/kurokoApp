//ELEVENTH SCREEN
class Screen11
{
  Button[] buttons;
  Button[] stayingLeaving;
  PImage screen9Img;
  PImage collegeGuy;
  ChatBox chatBox;
  boolean firstText = true;
  boolean secondText = false;
  boolean thirdText = false;
  boolean clicked = false;
  boolean yesNo;
  boolean choseSomething = false;
  boolean displayWarning = false;
  boolean received = false;
  int counter = 92;
  
  
  void init()
  {
    buttons = new Button[]{(new Button(200/2 + 20, 30, "START SCREEN")),(new Button(width-200/2-20, 30, "NEXT"))};
    screen9Img = loadImage("screenBackground/screen11Img.png");
    collegeGuy = loadImage("playerFace/collegeGuy.png");
    stayingLeaving = new Button[]{(new Button(width*0.47 - 100,height*0.35 + 40,"YEAH")),(new Button(width*0.47+100,height*0.35 + 40,"NOPE"))};
    for(int i=0; i < stayingLeaving.length; i++)
    {
      stayingLeaving[i].rect = false;
      stayingLeaving[i].buttonWidth = 15*3;
      stayingLeaving[i].buttonHeight = 20;  
    }
    //float pPosX, float pPosY, boolean pNoMoreText, float pTextPosX, float pTextPosY
    chatBox = new ChatBox(width*0.47,height*0.35,false,width*0.47-150,height*0.35-60);
  }
  
  void update()
  {
   //background
   image(screen9Img,0,0,width,height);
   
   //teammate image
   image(collegeGuy,width/2-500,height-600,400,600);
   //chatBox updates
   if(firstText)
   {
      if(chatBox.text == null) chatBox.text = "Hey " + PlayerInfo.name + ", you are finally \ngraduating college! These have been \ngreat years for the basketball team, all \nbecause of you! We will definitely miss \nyour game.";
      if(mousePressed && !clicked && chatBox.hoverOverPlay())
      {
        firstText = false;
        secondText = true;
        chatBox.text = "I heard you got offers from NBA teams! \nThat's awesome! Are you planning on \njoining one of them?";
        chatBox.noMoreButton = true;
        clicked = true; 
      }
   }
   
   if(thirdText)
   {
     if(yesNo)chatBox.text = "Don't forget about us when you become \nthe next MVP!";
     else chatBox.text = "You're insane! That't a waste of your \npotential! Well, I guess all I can do is wish \nyou good luck on your next Journey. \nGood luck!";
   }
   if(!received && choseSomething){
     PlayerInfo.NBA = yesNo;
     received = true;
   }
   
   chatBox.update();
   
   //stayingLeaving buttons update
   if(secondText && !firstText)
   {
     for(int i = 0; i<stayingLeaving.length; i++)
     {
      if(stayingLeaving[i].hover())
      {
        stayingLeaving[i].textFill[0] = 255;
        stayingLeaving[i].textFill[1] = 0;
        stayingLeaving[i].textFill[2] = 0;
        if(mousePressed && !clicked)
        {
          secondText = false;
          if(i == 0) yesNo = true;
          else yesNo = false;
          choseSomething = true;
          thirdText = true;
          clicked = true;
        }
        if(choseSomething) break;
      }
      else
      {
        stayingLeaving[i].textFill[0] = 230;
        stayingLeaving[i].textFill[1] = 230;
        stayingLeaving[i].textFill[2] = 230;
      }
      stayingLeaving[i].update();
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
          
          if(buttons[i].hover() || buttons[other].hover()) cursor(HAND);
          else cursor(ARROW);
            
          buttons[i].update();
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
