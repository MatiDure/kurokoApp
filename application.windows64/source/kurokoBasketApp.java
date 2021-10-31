import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 
import java.util.Hashtable; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class kurokoBasketApp extends PApplet {

/*Needs to be optimized using mp3 compressed sound files
  extending the Screen class to all screen class and adding them into a Screen array
*/

//screens
StartScreen startScreen;
CharacterScreen charScreen;
SchoolScreen schoolScreen;
Screen4 screen4;
Screen5 screen5;
Screen6 screen6;
Screen7 screen7;
Screen8 screen8;
Screen9 screen9;
Screen10 screen10;
Screen11 screen11;
Screen12 screen12;
Screen13 screen13;
Screen14 screen14;

//keeping track of screen
int screen = 0;

//sounds
SoundFile soundStartScreen;
SoundFile soundCharSchoolScreen;
SoundFile soundAllScreen;

//character info
String characterName;
String characterSchool;

//keeping track of sounds
boolean soundStartScreenOn = false;
boolean soundCharSchoolScreenOn = false;
boolean soundAllScreenOn = false;

//fading 
SoundFile currentTrack = null;
SoundFile nextTrack = null;
float targetVolume = 1;
boolean fading = false;


public void setup()
{
  
  //initializing screens
  startScreen = new StartScreen();
  charScreen = new CharacterScreen();
  schoolScreen = new SchoolScreen();
  screen4 = new Screen4();
  screen5 = new Screen5();
  screen6 = new Screen6();
  screen7 = new Screen7();
  screen8 = new Screen8();
  screen9 = new Screen9();
  screen10 = new Screen10();
  screen11 = new Screen11();
  screen12 = new Screen12();
  screen13 = new Screen13();
  screen14 = new Screen14();
  
  startScreen.init();
  charScreen.init();
  schoolScreen.init();
  screen4.init();
  screen5.init();
  screen6.init();
  screen7.init();
  screen8.init();
  screen9.init();
  screen10.init();  
  screen11.init();
  screen12.init();
  screen13.init();
  screen14.init();
  
  soundStartScreen = new SoundFile(this,"sounds/kurokoStartScreen.wav");
  soundCharSchoolScreen = new SoundFile(this,"sounds/kurokoCharSchoolScreen.wav");
  soundAllScreen = new SoundFile(this,"sounds/kurokoAllScreen.wav");
  //this changes the volume level (number between 0 and 1)
  soundStartScreen.amp(0.7f);
  soundCharSchoolScreen.amp(0.7f);
  soundAllScreen.amp(0.7f);
       
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
  
  //starting soundtrack for screen 1
  startFade(soundStartScreen);
  
}

public void draw()
{
  if(fading) doFade();
  switch(screen)
  {
    //resetting all changes to default
    case -1:
      //charScreen and schoolScreen sound
      //if(soundCharSchoolScreenOn)
      //{
      // soundCharSchoolScreen.stop();
      // soundCharSchoolScreenOn = false;
      //}
      //charScreen
      charScreen.title = null;
      charScreen.chosenChar = null;
      //schoolScreen
      schoolScreen.title = null;
      schoolScreen.chosenSchool = null;
      //screen4-14
      // if(soundAllScreenOn)
      //{
      //   soundAllScreen.stop();
      //   soundAllScreenOn = false;
      //}
      //screen4
      screen4.secondText = false;
      screen4.chatBox.noMoreButton = false;
      screen4.chatBox.text = null;
      PlayerInfo.name = null;
      PlayerInfo.school = null;
      //screen6
      screen6.secondText = false;
      screen6.thirdText = false;
      screen6.choseSomething = false;
      screen6.chatBox.noMoreButton = false;
      //screen9
      screen9.firstText = true;
      screen9.secondText = false;
      screen9.thirdText = false;
      screen9.chatBox.noMoreButton = false;
      screen9.choseSomething = false;
      //screen11
      screen11.chatBox.noMoreButton = false;
      screen11.choseSomething = false;
      screen11.firstText = true;
      screen11.secondText = false;
      screen11.thirdText = false;
      screen11.received = false;
      screen11.chatBox.text = null;
      
      //if(!soundStartScreenOn)
      //{
      //  soundStartScreen.loop();
      //  soundStartScreenOn = true;
      //}
      startFade(soundStartScreen);
      startScreen.update();
    case 0:
      //if(!soundStartScreenOn)
      //{
      //  soundStartScreen.loop();
      //  soundStartScreenOn = true;
      //}
      startScreen.update();
      break;
    case 1:
      //if(soundStartScreenOn)
      //{
      //  soundStartScreen.stop();
      //  soundStartScreenOn = false;
      //}
      // if(!soundCharSchoolScreenOn)
      //{
      //   soundCharSchoolScreen.loop();
      //   soundCharSchoolScreenOn = true;
      //}
      startFade(soundCharSchoolScreen);
      charScreen.update();
      break;
    case 2:
      schoolScreen.update();
      break;
    case 3:
      //if(soundCharSchoolScreenOn)
      //{
      //  soundCharSchoolScreen.stop();
      //  soundCharSchoolScreenOn = false;
      //}
      //if(!soundAllScreenOn)
      //{
      //  soundAllScreen.loop();
      //  soundAllScreenOn = true;
      //}
      startFade(soundAllScreen);
      screen4.update();
      break;
    case 4:
      screen5.update();
      break;
    case 5:
      screen6.update();
      break;
    case 6:
      screen7.update();
      break;
    case 7:
      screen8.update();
      break;
    case 8:
      screen9.update();
      break;
    case 9:
      screen10.update();
      break;
    case 10:
      screen11.update();
      break;
    case 11:
      screen12.update();
      break;
    case 12:
      startFade(soundCharSchoolScreen);
      screen13.update();
      break;
    case 13:
      screen14.update();
      break;
  }
 
}

public void mousePressed()
{
 
 switch(screen)
 {
    //start screen
    case -1:
      if(startScreen.nextScreen()) screen = 1;
      break;
    case 0:
      if(startScreen.nextScreen()) screen++;
      break;
    //character screen
    case 1:
      if(charScreen.previosScreen()) screen = -1;        
      else if(charScreen.nextScreen() && (characterName != null)) screen++;
      break;
    //school screen
    case 2:
      if(schoolScreen.previousScreen()) screen--;
      else if(schoolScreen.nextScreen() && (characterSchool != null)) screen++;
      break;
    //screen 4
    case 3:
      if(screen4.previousScreen()) screen = -1;
      else if(screen4.nextScreen()) screen++;
      break;
    //screen 5
    case 4:
      if(screen5.previousScreen()) screen = -1;
      else if(screen5.nextScreen()) screen++;
      break;
    //screen 6
    case 5:
      if(screen6.previousScreen()) screen = -1;
      if(screen6.nextScreen() && screen6.choseSomething)
      {
        if(screen6.goingForBite) screen++;
        else screen+=2;
      }
      break;
    //screen 7
    case 6:
      if(screen7.previousScreen()) screen = -1;
      else if(screen7.nextScreen()) screen++;
      break;
    //screen 8
    case 7:
      if(screen8.previousScreen()) screen = -1;
      else if(screen8.nextScreen()) screen++;
      break;
    //screen 9
    case 8:
      if(screen9.previousScreen()) screen = -1;
      else if(screen9.nextScreen()) screen++;
      break;
    //screen 10
    case 9:
      if(screen10.previousScreen()) screen = -1;
      else if(screen10.nextScreen()) screen++;
      break;
    //screen 11
    case 10:
      if(screen11.previousScreen()) screen = -1;
      else if(screen11.nextScreen()) screen++;
      break;
    //screen 12
     case 11:
       if(screen12.previousScreen()) screen = -1;
       else if(screen12.nextScreen())
         {
           if(PlayerInfo.NBA) screen++;
           else screen += 2;
         }
       break;
    //screen 13
     case 12:
       if(screen13.previousScreen()) screen = -1;
       break;
    //screen 14
     case 13:
       if(screen14.previousScreen()) screen = -1;
       break;
 }
}

public void mouseReleased()
{
 
  switch(screen)
 {
    case 1:
      charScreen.clicked = false; 
      characterName = charScreen.chosenChar();
      break;
    case 2:
      schoolScreen.clicked = false;
      characterSchool = schoolScreen.chosenSchool();
      break;
    case 3:
      screen4.clicked = false;
    case 5:
      screen6.clicked = false;
      break;
    case 8:
      screen9.clicked = false;
      break;
    case 10:
      screen11.clicked = false;
      break;
    
 }
 if(characterName != null && characterSchool != null)PlayerInfo.getNameAndSchool(characterName,characterSchool);
 
}

public void startFade(SoundFile pNextTrack)
{
  if(nextTrack == pNextTrack) return;
  currentTrack = nextTrack;
  nextTrack = pNextTrack;
  fading = true;
  targetVolume = 1 - targetVolume;
  pNextTrack.amp(targetVolume);
  pNextTrack.loop();
}

public void doFade()
{
  targetVolume += 1/50.0f;
  if (currentTrack != null) currentTrack.amp(constrain (1-targetVolume, 0, 1));
  if (nextTrack != null) nextTrack.amp(constrain (targetVolume, 0, 1));
  fading = targetVolume < 1;
  
  if (!fading && currentTrack != null) {
    currentTrack.stop();
  }
}
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
 
 public void update()
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
 
 public boolean hover()
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

  public void init()
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
      players = new Player[]{new Player("Akashi",playersImgs[0],width*0.25f,height*0.25f,new int[]{281,5,83}), 
                             new Player("Kise",playersImgs[6],width*0.25f,height*0.5f,new int[]{255,230,0}), 
                             new Player("Kuroko",playersImgs[1],width*0.5f,height*0.5f,new int[]{122,204,229}),
                             new Player("Kagami",playersImgs[5],width*0.75f,height*0.25f,new int[]{154,0,0}),
                             new Player("Midorima",playersImgs[2],width*0.25f,height*0.75f,new int[]{102,153,102}),
                             new Player("Murasakibara",playersImgs[3],width*0.75f,height*0.5f,new int[]{96,58,112}),
                             new Player("Aomine",playersImgs[4],width*0.75f,height*0.75f,new int[]{12,1,110})};
  
  }

  public void update()
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
   public String chosenChar()
   {
     return chosenChar;
   }
   
    public boolean previosScreen()
   {
     if(buttons[0].hover()) return true;
     return false; 
   }
   
   public boolean nextScreen()
   {
     if(buttons[1].hover())
     {
       if(chosenChar != null) return true;
       else displayWarning = true;       
     }
     return false;
   }   
      
}
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
  
  public void update()
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
  
  public boolean hoverOverPlay()
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
class LastScreen
{
  
}
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
   
   public void update()
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
   
   public boolean hover()
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
static class PlayerInfo 
{
 static String name = "Aomine";
 static String school;
 static boolean NBA;
 
 public static void getNameAndSchool(String pName, String pSchool)
 {
   name = pName;
   school = pSchool;
 }
 
 public static void getNBA(boolean yesNo)
 {
  NBA = yesNo; 
 }
  
}
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
  
  public void update()
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
  
  public boolean hover()
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
//THIRD SCREEN
class SchoolScreen
{
    PImage schoolScreenImg;
    Button[] buttons;
    PImage[] schoolImgs = new PImage[7]; 
    School[] schools;
    int textSizeTitle = 40;
    int[] rgbTitleText = {64,68,88};
    String chosenSchool = null;
    boolean clicked = false;
    boolean displayWarning = false;
    String title;
    String titlePlaceHolder;
    int currentSchool;
    int counter = 92;
    
    
    public void init()
    {
      buttons = new Button[2];
      schools = new School[6];
      //loading schools imgages
      schoolImgs[0] = loadImage("schoolLogo/schoolRakuzan.png");
      schoolImgs[1] = loadImage("schoolLogo/schoolYosen.png");
      schoolImgs[2] = loadImage("schoolLogo/schoolSeirin.png");
      schoolImgs[3] = loadImage("schoolLogo/schoolToo.png");
      schoolImgs[4] = loadImage("schoolLogo/schoolShutoku.png");
      schoolImgs[5] = loadImage("schoolLogo/schoolKaijo.png");
      //adding buttons to buttons array
      buttons[0] = (new Button(200/2 + 20, 30, "RETURN"));
      buttons[1] = (new Button(width-200/2-20, 30, "NEXT"));
      //adding schools to school array
      schools[0] = (new School("Rakuzan",schoolImgs[0],width*0.25f,height*0.25f,new int[]{281,5,83}));
      schools[1] = (new School("Yosen",schoolImgs[1],width*0.25f,height*0.5f,new int[]{281,5,83}));
      schools[2] = (new School("Seirin",schoolImgs[2],width*0.25f,height*0.75f,new int[]{281,5,83}));
      schools[3] = (new School("Too",schoolImgs[3],width*0.75f,height*0.25f,new int[]{281,5,83}));
      schools[4] = (new School("Shutoku",schoolImgs[4],width*0.75f,height*0.5f,new int[]{281,5,83}));
      schools[5] = (new School("Kaijo",schoolImgs[5],width*0.75f,height*0.75f,new int[]{281,5,83}));
      //adding background image
      schoolScreenImg = loadImage("screenBackground/schoolScreenImg.png");
      
    }
    
    public void update()
    {
      tint(255,255);
      image(schoolScreenImg,0,0,width,height);
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
      
      //outputting schools on the screen
      for(int i=0;i<schools.length;i++)
      {
        if(schools[i].hover())
        {
          schools[i].tint = 255;
          titlePlaceHolder = schools[i].schoolName;
          currentSchool = i;
          if(mousePressed && !clicked)
          {
            title = schools[i].schoolName;
            chosenSchool = schools[i].schoolName;
            //println(chosenSchool);
            clicked = true;
           }
        }
        else{
          schools[i].tint = 150;//tint(255,150); 
        }
        if(schools[0].hover() || schools[1].hover() || schools[2].hover() || schools[3].hover() || schools[4].hover() || schools[5].hover()) titlePlaceHolder = schools[currentSchool].schoolName;
        else titlePlaceHolder = "Choose Your School";
        schools[i].update(); 
     
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
      text("NO SCHOOL SELECTED",width/2,height-100);
      counter--;
        if(counter == 0)
        {
         counter = 92;
         displayWarning = false;
        }
     }
      
    }
    
    public String chosenSchool()
   {
     return chosenSchool;
   }
   
    
    public boolean previousScreen()
    {
      if(buttons[0].hover()) return true;
      return false;
    }
    
    public boolean nextScreen()
    {
     if(buttons[1].hover())
     {
       if(chosenSchool!=null) return true;
       else displayWarning = true;  
     }
     return false;
    }

}
class Screen
{
  
public void init(){}
public void update(){}
  
}
//TENTH SCREEN
class Screen10
{
  Button[] buttons;
  PImage screen10Img;
  ChatBox aFewYearsLater;
  
  public void init()
  {
    buttons = new Button[]{(new Button(200/2 + 20, 30, "START SCREEN")),(new Button(width-200/2-20, 30, "NEXT"))};
    screen10Img = loadImage("screenBackground/screen8Img.jpg");
    aFewYearsLater = new ChatBox(width/2,height*0.9f,15*30,60,"ANOTHER FEW YEARS PASS BY...",width/2-(15.5f*30/2),height*0.9f-20,true);
    aFewYearsLater.boxWidth = 500;
    aFewYearsLater.textSize = 30;
  }
  
  public void update()
  {
   
   image(screen10Img,0,0,width,height);
   aFewYearsLater.update();
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
  }
  
  public boolean previousScreen()
   {
     if(buttons[0].hover()) return true;
     return false; 
   }
   
   public boolean nextScreen()
   {
     if(buttons[1].hover()) return true;
     return false;
   }   

}
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
  
  
  public void init()
  {
    buttons = new Button[]{(new Button(200/2 + 20, 30, "START SCREEN")),(new Button(width-200/2-20, 30, "NEXT"))};
    screen9Img = loadImage("screenBackground/screen11Img.png");
    collegeGuy = loadImage("playerFace/collegeGuy.png");
    stayingLeaving = new Button[]{(new Button(width*0.47f - 100,height*0.35f + 40,"YEAH")),(new Button(width*0.47f+100,height*0.35f + 40,"NOPE"))};
    for(int i=0; i < stayingLeaving.length; i++)
    {
      stayingLeaving[i].rect = false;
      stayingLeaving[i].buttonWidth = 15*3;
      stayingLeaving[i].buttonHeight = 20;  
    }
    //float pPosX, float pPosY, boolean pNoMoreText, float pTextPosX, float pTextPosY
    chatBox = new ChatBox(width*0.47f,height*0.35f,false,width*0.47f-150,height*0.35f-60);
  }
  
  public void update()
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
  
   public boolean previousScreen()
   {
     if(buttons[0].hover()) return true;
     return false; 
   }
   
   public boolean nextScreen()
   {
     if(buttons[1].hover()) 
     {
       if(thirdText) return true;
       displayWarning = true;
     }
     return false;
   }   

}
//twelveth SCREEN
class Screen12
{
  Button[] buttons;
  PImage screen10Img;
  ChatBox aFewYearsLater;
  
  public void init()
  {
    buttons = new Button[]{(new Button(200/2 + 20, 30, "START SCREEN")),(new Button(width-200/2-20, 30, "NEXT"))};
    screen10Img = loadImage("screenBackground/screen8Img.jpg");
    aFewYearsLater = new ChatBox(width/2,height*0.9f,21*30,60,"YET AGAIN, ANOTHER FEW YEAR LATER...",width/2-(20*30/2),height*0.9f-20,true);
    //aFewYearsLater.boxWidth = 600;
    aFewYearsLater.textSize = 30;
  }
  
  public void update()
  {
   image(screen10Img,0,0,width,height);
   aFewYearsLater.update();
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
  }
  
  public boolean previousScreen()
   {
     if(buttons[0].hover()) return true;
     return false; 
   }
   
   public boolean nextScreen()
   {
     if(buttons[1].hover()) return true;
     return false;
   }   
}
//thirteenth SCREEN

class Screen13
{
  Button button;
  PImage screen4Img;
  PFont font;
  PFont defaultFont;
  PImage[] myWords;
  PImage mura;
  
  public void init()
  {
    button = new Button(200/2 + 180, 35, "START SCREEN");
    screen4Img = loadImage("screenBackground/nbaRoute.png");
    myWords = new PImage[]{loadImage("screenBackground/letterMiNBA.png"),loadImage("screenBackground/letterKiNBA.png"),loadImage("screenBackground/letterAkNBA.png"),
                            loadImage("screenBackground/letterKuNBA.png"),loadImage("screenBackground/letterMuNBA.png"),loadImage("screenBackground/letterKaNBA.png"),
                             loadImage("screenBackground/letterAoNBA.png")};
               mura = loadImage("screenBackground/letterMuNBA.png"); 
  }
  
  public void update()
  {
   
   image(screen4Img,0,0,width,height);
   //screen text
   switch(PlayerInfo.name)
   {
    case "Akashi":
      image(myWords[2],20,60,500,200);
      break;
    case "Midorima":
      image(myWords[0],20,60,500,200);
      break;
    case "Kise":
      image(myWords[1],20,60,500,200);
      break;
    case "Kuroko":
      image(myWords[3],20,60,500,200);
      break;
    case "Murasakibara":
      image(myWords[4],20,60,500,200);
      break;
    case "Kagami":
       image(myWords[5],20,60,500,200);
      break;
    case "Aomine":
      image(myWords[6],20,60,500,200);
      break;
        
   }
   
   //screen buttons updates
          if(button.hover())
          {
            button.buttonWidth = 210;
            button.buttonHeight = 55;
            button.buttonR = 85;
            button.buttonG = 3; 
            button.buttonB = 43;
            button.buttonTextSize = 25;
          }
          else
          {
            button.buttonWidth = 200;
            button.buttonHeight = 50;
            button.buttonR = 64;
            button.buttonG = 68; 
            button.buttonB = 88;
            button.buttonTextSize = 20;
          }
               if(button.hover()) cursor(HAND);
     else cursor(ARROW);

            
          button.update(); 
  }
  
  public boolean previousScreen()
   {
     if(button.hover()) return true;
     return false; 
   }

}
//fourteenth SCREEN
class Screen14
{
  Button button;
  PImage screen14Img;
  
  public void init()
  {
    button = new Button(width/2, 35, "START SCREEN");
    screen14Img = loadImage("screenBackground/notNbaRoute.jpg");
  }
  
  public void update()
  {
   noStroke();
   image(screen14Img,0,0,width,height);
   fill(0,60);
   rect(width/2,height/2+200,500,200,14);
   fill(255);
   textSize(30);
   text(PlayerInfo.name + " has been working in \naccounting for many years now.\nHe is a loving husband, \nand a father of four!", width/2,height/2+200);
   //screen button update
          if(button.hover())
          {
            button.buttonWidth = 210;
            button.buttonHeight = 55;
            button.buttonR = 85;
            button.buttonG = 3; 
            button.buttonB = 43;
            button.buttonTextSize = 25;
          }
          else
          {
            button.buttonWidth = 200;
            button.buttonHeight = 50;
            button.buttonR = 64;
            button.buttonG = 68; 
            button.buttonB = 88;
            button.buttonTextSize = 20;
          }
          if(button.hover()) cursor(HAND);
          else cursor(ARROW);
          
          button.update(); 
  }
  
  public boolean previousScreen()
   {
     if(button.hover()) return true;
     return false; 
   }
}
//FOURTH SCREEN
class Screen4 extends PlayerInfo
{
  Button[] buttons;
  ChatBox chatBox;
  PImage screen4Img;
  PImage teammate;
  boolean clicked = false;
  boolean secondText = false;
  boolean displayWarning = false;
  int counter = 92;
  
  public void init()
  {
    buttons = new Button[]{(new Button(200/2 + 20, 30, "START SCREEN")),(new Button(width-200/2-20, 30, "NEXT"))};
    chatBox = new ChatBox(530,380,secondText, 386, 320);
    screen4Img = loadImage("screenBackground/screen4And6Img.jpg");
    teammate = loadImage("playerFace/faceTeammate.png");
  }
  
  public void update()
  {
   //background image
   image(screen4Img,0,0,width,height);
   //teammate image
   image(teammate,width/2-teammate.width,height-teammate.height);
   
   if(!secondText)
   {
     if(chatBox.text == null) chatBox.text = "Hey " + PlayerInfo.name + ", welcome to\n" + PlayerInfo.school + "'s basketball team! We are \nhappy you decided to join the basket \nclub. You'll definitely be a great addition.";
   }

   if(displayWarning)
   {
    textSize(20);
    fill(255,150);
    rect(width/2,height-100,20*26/2,40,7);
    fill(255,0,0);
    text("Press play in the text box",width/2,height-100);
    counter--;
      if(counter == 0)
      {
       counter = 92;
       displayWarning = false;
      }
   }
   if(!secondText && chatBox.hoverOverPlay())
   {
    if(mousePressed && !clicked)
    {
     clicked = true; 
     secondText = true;
     chatBox.noMoreButton = true;
     chatBox.text = "Quick! Get Ready! We have a friendly\nmatch against <rival team>. We will rate \nyou based on your perfomance of this \ngame.";
    }
   }
   
   chatBox.update();

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
          
          if(buttons[i].hover() || buttons[other].hover() || (!secondText && chatBox.hoverOverPlay())) cursor(HAND);
          else cursor(ARROW);
            
          buttons[i].update();
      }
      
      
  }
  
  public boolean previousScreen()
   {
     if(buttons[0].hover()) return true;
     return false; 
   }
   
   public boolean nextScreen()
   {
     if(buttons[1].hover()){
      if(secondText) return true;
      else displayWarning = true;
     }
     return false;
   }   

}
//FIFTH SCREEN
class Screen5 extends PlayerInfo
{
  Button[] buttons;
  ChatBox[] chatBoxes;
  PImage screen5Img;
  PImage[] teammates;
  
  public void init()
  {
    buttons = new Button[]{(new Button(200/2 + 20, 30, "START SCREEN")),(new Button(width-200/2-20, 30, "NEXT"))};
    teammates = new PImage[]{loadImage("playerFace/backHead.png"),loadImage("playerFace/backHead2.png")};
    chatBoxes = new ChatBox[]{new ChatBox(width*0.25f+240,height-250,true,width*0.25f+150,height-270),new ChatBox(width*0.5f+220,height-170,true,width*0.5f+130,height-190)};
    for(int i = 0;i<chatBoxes.length;i++)
    {
     chatBoxes[i].boxWidth = 200;
     chatBoxes[i].boxHeight = 50;
    }
    screen5Img = loadImage("screenBackground/screen5Img.png");
  }
  
  public void update()
  {
   
   image(screen5Img,0,0,width,height);
   
   //teammates images
   image(teammates[0],width*0.25f,height-300,200,300);
   image(teammates[1],width*0.5f,height-200,150,200);
   
   //text box for teammates
   chatBoxes[0].text = PlayerInfo.name+" is a beast...";
   chatBoxes[1].text = "Yeah, he's gonna get far";

   
   for(int i=0;i<chatBoxes.length;i++)
   {
    chatBoxes[i].update(); 
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
  }
  
  public boolean previousScreen()
   {
     if(buttons[0].hover()) return true;
     return false; 
   }
   
   public boolean nextScreen()
   {
     if(buttons[1].hover()) return true;
     return false;
   }   

}
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
  
  
  public void init()
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
  
  public void update()
  {

   //background img
   image(screen6Img,0,0,width,height);
   //teammate img
   image(teammateAfterGame,width*0.70f,height*0.4f,300,480);
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
  
  public boolean previousScreen()
   {
     if(buttons[0].hover()) return true;
     return false; 
   }
   
   public boolean nextScreen()
   {
     if(buttons[1].hover())
     {
       if(thirdText) return true;
       displayWarning = true;
     }
     return false;
   }   

}
//SEVENTH SCREEN
class Screen7
{
  Button[] buttons;
  PImage screen7Img;
  ChatBox[] conversation;
  
  public void init()
  {
    buttons = new Button[]{(new Button(200/2 + 20, 30, "START SCREEN")),(new Button(width-200/2-20, 30, "NEXT"))};
    screen7Img = loadImage("screenBackground/screen7Img.jpg");
    conversation = new ChatBox[]{new ChatBox(width*0.2f,height*0.25f,30*11,60,"This looks delicious!",width*0.2f-(30*11/2)+10,height*0.25f-15,true),
                                  new ChatBox(width*0.7f,height*0.5f,30*17,60,"This is not going to be enough...",width*0.7f-(30*17/2)+10,height*0.5f-15,true),
                                  new ChatBox(width*0.5f,height*0.9f,30*11,60,"Let's eat! I'm starving!",width*0.5f-(30*11/2)+10,height*0.9f-15,true)};
    for(int i=0; i<conversation.length; i++)conversation[i].textSize = 30;
  }
  
  public void update()
  {
   
   image(screen7Img,0,0,width,height);
   for(int i=0; i<conversation.length; i++)conversation[i].update();
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
  }
  
  public boolean previousScreen()
   {
     if(buttons[0].hover()) return true;
     return false; 
   }
   
   public boolean nextScreen()
   {
     if(buttons[1].hover()) return true;
     return false;
   }   

}
//EIGHTH SCREEN
class Screen8
{
  Button[] buttons;
  PImage screen8Img;
  ChatBox aFewYearsLater;
  
  public void init()
  {
    buttons = new Button[]{(new Button(200/2 + 20, 30, "START SCREEN")),(new Button(width-200/2-20, 30, "NEXT"))};
    screen8Img = loadImage("screenBackground/screen8Img.jpg");
    aFewYearsLater = new ChatBox(width/2,height*0.9f,10*30+10,60,"A FEW YEARS LATER",width/2-(10*30/2)+5,height*0.9f-20,true);
    aFewYearsLater.textSize = 30;
  }
  
  public void update()
  {
   
   image(screen8Img,0,0,width,height);
   aFewYearsLater.update();
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
  }
  
  public boolean previousScreen()
   {
     if(buttons[0].hover()) return true;
     return false; 
   }
   
   public boolean nextScreen()
   {
     if(buttons[1].hover()) return true;
     return false;
   }   

}
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
  
  
  public void init()
  {
    buttons = new Button[]{(new Button(200/2 + 20, 30, "RETURN")),(new Button(width-200/2-20, 30, "NEXT"))};
    screen9Img = loadImage("screenBackground/screen9Img.png");
    collegeGuy = loadImage("playerFace/faceCollege.png");
    stayingLeaving = new Button[]{(new Button(width*0.2f - 100,height*0.35f + 40,"STAYING")),(new Button(width*0.2f+80,height*0.35f + 40,"LEAVING"))};
    for(int i=0; i < stayingLeaving.length; i++)
    {
      stayingLeaving[i].rect = false;
      stayingLeaving[i].buttonWidth = 15*6;
      stayingLeaving[i].buttonHeight = 20;  
    }
    //float pPosX, float pPosY, boolean pNoMoreText, float pTextPosX, float pTextPosY
    chatBox = new ChatBox(width*0.2f,height*0.35f,false,width*0.2f-150,height*0.35f-60);
  }
  
  public void update()
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
  
  public boolean previousScreen()
   {
     if(buttons[0].hover()) return true;
     return false; 
   }
   
   public boolean nextScreen()
   {
     if(buttons[1].hover()) 
     {
       if(thirdText) return true;
       displayWarning = true;
     }
     return false;
   }   

}
//FIRST SCREEN
class StartScreen
{
  PImage startScreenImg;
  Button button;
  int buttonWidth = 240;
  int buttonHeight = 50;
  int buttonTextSize = 20;
  int[] rgbButton = {255,255,255};
  int[] rgbButtonText = {60,60,80};
  
  
  public void init()
  {
   startScreenImg = loadImage("screenBackground/startScreenImg.png"); 
   button = new Button(width/2,height - 60,"START");
  }
  public void update()
  {
    
    //hover over start button
    if(button.hover())
    {
      button.buttonR = 85;
      button.buttonG = 3;
      button.buttonB = 43;
      button.buttonWidth = 260;
      button.buttonHeight = 60;
      button.buttonTextSize = 25;
      cursor(HAND);
    }
    else
    {
      button.buttonR = 64;
      button.buttonG = 68;
      button.buttonB = 88;
      button.buttonWidth = buttonWidth;
      button.buttonHeight = buttonHeight;
      button.buttonTextSize = 20;
      cursor(ARROW); 
    }
    
    strokeWeight(0);
    image(startScreenImg, 0, 0, width,height);
    //title
    fill(100,100,100,100);
    rectMode(CENTER);
    rect(width/2, 60, 650, 70, 7);
    fill(255,255,255);
    textAlign(CENTER, CENTER);
    textSize(70);
    text("Kuroko no basket", width/2,50);
    
    //button 
    button.update();
    
  }
  
  public boolean nextScreen()
  {
   if(button.hover())
   {
     return true; 
   }
   return false;
  }
}
  public void settings() {  size(1000,800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "kurokoBasketApp" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
