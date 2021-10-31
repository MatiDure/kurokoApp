class School
{
  int schoolAlpha = 80;
  String schoolName;
  PImage schoolImg;
  float schoolPosX;
  float schoolPosY;
  int schoolWidth = 130;
  int schoolHeight = 169;
  int tint = 100;
  int[] borderColor;
 
  School(String pSchoolName, PImage pSchoolImg,
           float pSchoolPosX, float pSchoolPosY,
           int[] pBorderColor)
  {
     schoolName = pSchoolName;
     schoolImg = pSchoolImg;
     schoolPosX = pSchoolPosX; 
     schoolPosY = pSchoolPosY;
     borderColor = pBorderColor;
  }
  
  void update()
  {
    fill(0,0,0,0);
    stroke(borderColor[0],borderColor[1],borderColor[2]);
    strokeWeight(20);
    tint(255,tint);
    image(schoolImg, schoolPosX-schoolWidth/2,schoolPosY-schoolHeight/2, schoolWidth, schoolHeight);
    rect(schoolPosX,schoolPosY, schoolWidth,schoolHeight, 30);
    strokeWeight(0);
    stroke(75);
    tint(255,255);
  }
  
  boolean hover()
  {
   if(mouseX >= schoolPosX - schoolWidth/2&&
       mouseX <= schoolPosX + schoolWidth/2 &&
       mouseY >= schoolPosY - schoolHeight/2&&
       mouseY <= schoolPosY + schoolHeight/2)
   {
     return true;
   }
   return false;
  }
  
}
