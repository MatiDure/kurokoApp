class Button
{
 float buttonPosX;
 float buttonPosY;
 int buttonWidth;
 int buttonHeight;
 int buttonR = 64;
 int buttonG = 68;
 int buttonB = 88;
 int buttonTextSize = 20;
 int textFill[] = new int[]{230,230,230};
 String buttonText;
 boolean rect = true;
 
 
 Button(float pButtonPosX, float pButtonPosY, String pButtonText)
 {
   buttonPosX = pButtonPosX;
   buttonPosY = pButtonPosY;
   buttonText = pButtonText;
 }
 
 void update()
 {
   if(rect)
   {
    fill(buttonR,buttonG,buttonB);
    rect(buttonPosX,buttonPosY, buttonWidth,buttonHeight, 7); 
   }
  textSize(buttonTextSize);
  fill(textFill[0],textFill[1],textFill[2]);
  text(buttonText,buttonPosX,buttonPosY);
  textSize(15);
 }
 
 boolean hover()
{
   if(mouseX >= (buttonPosX - buttonWidth/2) && 
   mouseX <= (buttonPosX + buttonWidth/2)&&
   mouseY >= (buttonPosY-buttonHeight/2) &&
   mouseY <= (buttonPosY+buttonHeight/2))
   {
     return true;
   }
   return false;
}
}
