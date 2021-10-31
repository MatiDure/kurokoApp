class ChatBox
{
  float posX;
  float posY;
  float textPosX;
  float textPosY;
  int boxWidth;
  int boxHeight;
  int textSize = 15;
  String text;
  PImage buttonPlay = loadImage("otherImg/playButton.png"); 
  int[] tint = new int[]{255,255,255};
  boolean noMoreButton = false;
  
  ChatBox(float pPosX,float pPosY, int pWidth, int pHeight, String pText, float pTextPosX, float pTextPosY, boolean pNoMoreText)
  {
    posX = pPosX;
    posY = pPosY;
    boxWidth = pWidth;
    boxHeight = pHeight;
    text = pText;
    textPosX = pTextPosX;
    textPosY = pTextPosY;
    noMoreButton = pNoMoreText;
  }
  
  ChatBox(float pPosX,float pPosY, int pWidth, int pHeight, float pTextPosX, float pTextPosY, boolean pNoMoreText)
  {
    posX = pPosX;
    posY = pPosY;
    boxWidth = pWidth;
    boxHeight = pHeight;
    textPosX = pTextPosX;
    textPosY = pTextPosY;
    noMoreButton = pNoMoreText;
  }

  ChatBox(float pPosX, float pPosY, boolean pNoMoreText, float pTextPosX, float pTextPosY)
  {
    posX = pPosX;
    posY = pPosY;
    boxWidth = 320;
    boxHeight = 130;
    noMoreButton = pNoMoreText;
    textPosX = pTextPosX;
    textPosY = pTextPosY;
  }
  
  void update()
  {
    
   fill(0,150);
   rect(posX,posY,boxWidth,boxHeight,10);
   fill(255,255);
   textSize(textSize);
   textAlign(LEFT,TOP); 
   text(text,textPosX,textPosY);
   //play button animation
      if(!noMoreButton)
     {
       if(hoverOverPlay())
       {
        tint[0] = 255;
        tint[1] = 0;
        tint[2] = 0;
       }
       else
       {
         tint[1] = 255;
         tint[2] = 255;
       }
        tint(tint[0],tint[1],tint[2]);
       image(buttonPlay,posX+boxWidth/2-50,posY+boxHeight/2-40,45,45);
     }
   tint(255,255);
   textAlign(CENTER,CENTER);
  }
  
  boolean hoverOverPlay()
  {
    if(mouseX >= posX+boxWidth/2-42 &&
        mouseX <= posX+boxWidth/2-15 &&
        mouseY >= posY+boxHeight/2-35 &&
        mouseY <= posY+boxHeight/2-5)
    {
      return true;
    }
   return false; 
  }
  
}
