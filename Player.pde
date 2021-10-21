class Player
{
   int playerAlpha = 80;
   String playerName;
   PImage playerImg;
   float playerPosX;
   float playerPosY;
   int playerWidth = 130;
   int playerHeight = 169;
   int tint = 100;
   int[] borderColor;
   
   Player(String pPlayerName, PImage pPlayerImg,
           float pPlayerPosX, float pPlayerPosY,
           int[] pBorderColor)
   {
     playerName = pPlayerName;
     playerImg = pPlayerImg;
     playerPosX = pPlayerPosX; 
     playerPosY = pPlayerPosY;
     borderColor = pBorderColor;
   }
   
   void update()
   {
    fill(0,0,0,0);
    stroke(borderColor[0],borderColor[1],borderColor[2]);
    strokeWeight(20);
    tint(255,tint);
    image(playerImg, playerPosX-playerWidth/2,playerPosY-playerHeight/2, playerWidth, playerHeight);
    rect(playerPosX,playerPosY, playerWidth,playerHeight, 30);
    strokeWeight(0);
    stroke(75);
    tint(255,255);
   }
   
   boolean hover()
   {
     if(mouseX >= playerPosX - playerWidth/2 &&
         mouseX <= playerPosX + playerWidth/2 &&
         mouseY >= playerPosY - playerHeight/2 &&
         mouseY <= playerPosY + playerHeight/2)
     { 
       return true;
     }
     
     return false; 
   }
}
