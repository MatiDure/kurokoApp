class ChatBox
{
  float posX;
  float posY;
  float posXText;
  float posYText;
  int boxWidth;
  int boxHeight;
  int textSize = 15;
  String text;
  PImage buttonPlay;
  int[] tint = new int[]{255,255,255};
  
  ChatBox(float pPosX,float pPosY, int pWidth, int pHeight,String pText)
  {
    posX = pPosX;
    posY = pPosY;
    boxWidth = pWidth;
    boxHeight = pHeight;
    text = pText;
  }
  
  ChatBox(float pPosX, float pPosY, PImage pButton)
  {
    posX = pPosX;
    posY = pPosY;
    boxWidth = 320;
    boxHeight = 130;
    buttonPlay = pButton;
  }
  
  void update()
  {
   fill(0,150);
   rect(posX,posY,boxWidth,boxHeight,10);
   fill(255,255);
   textSize(textSize);
   textAlign(LEFT,TOP); 
   text(text,386,320);
   tint(tint[0],tint[1],tint[2]);
   image(buttonPlay,posX+boxWidth/2-50,posY+boxHeight/2-40,45,45);
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
