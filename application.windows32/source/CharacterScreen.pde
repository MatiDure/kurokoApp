//SECOND SCREEN
class CharacterScreen
{
   Button[] buttons;
   Player[] players;
   PImage characterScreenImg;
   PImage[] playersImgs;
   int textSizeTitle = 40;
   int[] rgbTitleText = {64,68,88};
   String chosenChar = null;
   String title;
   String titlePlaceHolder;
   boolean clicked = false;
   boolean displayWarning = false;
   int currentPlayer;
   int counter = 92;

  void init()
  {
      //loading player images
      playersImgs = new PImage[]{loadImage("playerFace/faceAkashi.png"),
                                 loadImage("playerFace/faceKuroko.png"),
                                 loadImage("playerFace/faceMidorima.png"),
                                 loadImage("playerFace/faceMurasakibara.png"),
                                 loadImage("playerFace/faceAomine.png"),
                                 loadImage("playerFace/faceKagami.png"),
                                 loadImage("playerFace/faceKise.png")};
      characterScreenImg = loadImage("screenBackground/characterScreenImg.jpg");
      //adding buttons to buttons array
      buttons = new Button[]{(new Button(200/2 + 20, 30, "RETURN")),(new Button(width-200/2-20, 30, "NEXT"))};
      //adding players to players array
      players = new Player[]{new Player("Akashi",playersImgs[0],width*0.25,height*0.25,new int[]{281,5,83}), 
                             new Player("Kise",playersImgs[6],width*0.25,height*0.5,new int[]{255,230,0}), 
                             new Player("Kuroko",playersImgs[1],width*0.5,height*0.5,new int[]{122,204,229}),
                             new Player("Kagami",playersImgs[5],width*0.75,height*0.25,new int[]{154,0,0}),
                             new Player("Midorima",playersImgs[2],width*0.25,height*0.75,new int[]{102,153,102}),
                             new Player("Murasakibara",playersImgs[3],width*0.75,height*0.5,new int[]{96,58,112}),
                             new Player("Aomine",playersImgs[4],width*0.75,height*0.75,new int[]{12,1,110})};
  
  }

  void update()
  {
      tint(255,255);
      image(characterScreenImg,0,0,width,height);
      strokeWeight(0);

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
      
      //outputting players on the screen
      for(int i=0;i<players.length;i++)
      {
        if(players[i].hover())
        {
          players[i].tint = 255;tint(255,255);
          titlePlaceHolder = players[i].playerName;
          currentPlayer = i;
          if(mousePressed && !clicked)
          {
            title = players[i].playerName;
            chosenChar = players[i].playerName;
            clicked = true;
           }
        }
        else{
          players[i].tint = 150;//tint(255,150); 
        }
        if(players[0].hover() || players[1].hover() || players[2].hover() || players[3].hover() || players[4].hover() || players[5].hover() || players[6].hover()) titlePlaceHolder = players[currentPlayer].playerName;
        else titlePlaceHolder = "Choose Your Character";
        players[i].update(); 
     
     }
     //title output
      fill(rgbTitleText[0],rgbTitleText[1],rgbTitleText[2]);
      textSize(textSizeTitle);
      text(title == null?titlePlaceHolder:title, width/2, 70);
      
   if(displayWarning)
   {
    textSize(20);
    fill(255,150);
    rect(width/2,height-100,20*26/2,40,7);
    fill(255,0,0);
    text("NO CHARACTER SELECTED",width/2,height-100);
    counter--;
      if(counter == 0)
      {
       counter = 92;
       displayWarning = false;
      }
   }
   
}
   String chosenChar()
   {
     return chosenChar;
   }
   
    boolean previosScreen()
   {
     if(buttons[0].hover()) return true;
     return false; 
   }
   
   boolean nextScreen()
   {
     if(buttons[1].hover())
     {
       if(chosenChar != null) return true;
       else displayWarning = true;       
     }
     return false;
   }   
      
}
