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
 String buttonText;
 
 
 Button(float pButtonPosX, float pButtonPosY, String pButtonText)
 {
   buttonPosX = pButtonPosX;
   buttonPosY = pButtonPosY;
   buttonText = pButtonText;
 }
 
 void update()
 {
  fill(buttonR,buttonG,buttonB);
  rect(buttonPosX,buttonPosY, buttonWidth,buttonHeight, 7); 
  textSize(buttonTextSize);
  fill(230);
  text(buttonText,buttonPosX,buttonPosY);
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
