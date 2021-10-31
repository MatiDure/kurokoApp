//NINETH SCREEN
class Screen9
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
  boolean goingAbroad;
  boolean choseSomething = false;
  boolean displayWarning = false;
  int counter = 92;
  
  
  void init()
  {
    buttons = new Button[]{(new Button(200/2 + 20, 30, "RETURN")),(new Button(width-200/2-20, 30, "NEXT"))};
    screen9Img = loadImage("screenBackground/screen9Img.png");
    collegeGuy = loadImage("playerFace/faceCollege.png");
    stayingLeaving = new Button[]{(new Button(width*0.2 - 100,height*0.35 + 40,"STAYING")),(new Button(width*0.2+80,height*0.35 + 40,"LEAVING"))};
    for(int i=0; i < stayingLeaving.length; i++)
    {
      stayingLeaving[i].rect = false;
      stayingLeaving[i].buttonWidth = 15*6;
      stayingLeaving[i].buttonHeight = 20;  
    }
    //float pPosX, float pPosY, boolean pNoMoreText, float pTextPosX, float pTextPosY
    chatBox = new ChatBox(width*0.2,height*0.35,false,width*0.2-150,height*0.35-60);
  }
  
  void update()
  {
   //background
   image(screen9Img,0,0,width,height);
   
   //teammate image
   image(collegeGuy,width/2-200,height-600,400,600);
   
   //chatBox updates
   if(firstText)
   {
      chatBox.text = "It's your last day at school, captain\n" + PlayerInfo.name + "! Aren't you excited for \ncollege?";
      if(mousePressed && !clicked && chatBox.hoverOverPlay())
      {
        firstText = !firstText;
        secondText = !secondText;
        chatBox.text = "What am I even saying, of course you are!\nAre you staying in Japan or going \nsomewhere else?";
        chatBox.noMoreButton = true;
        clicked = true; 
      }
   }
   
   if(thirdText)
   {
     if(goingAbroad)chatBox.text = "Nice! Let us know when you're around so \nthat we can play some friendly matches!";
     else chatBox.text = "Well, I wish you a safe flight and \nmuch luck wherever you're heading. \nI'm sure you are going to kill it there\nas well!";
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
          secondText = !secondText;
          if(i == 0) goingAbroad = true;
          else goingAbroad = false;
          choseSomething = true;
          thirdText = !thirdText;
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
