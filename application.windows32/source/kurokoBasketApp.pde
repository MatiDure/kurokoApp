/*Needs to be optimized using mp3 compressed sound files
  extending the Screen class to all screen class and adding them into a Screen array
*/
import processing.sound.*;
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


void setup()
{
  size(1000,800);
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
  soundStartScreen.amp(0.7);
  soundCharSchoolScreen.amp(0.7);
  soundAllScreen.amp(0.7);
       
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
  
  //starting soundtrack for screen 1
  startFade(soundStartScreen);
  
}

void draw()
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

void mousePressed()
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

void mouseReleased()
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

void startFade(SoundFile pNextTrack)
{
  if(nextTrack == pNextTrack) return;
  currentTrack = nextTrack;
  nextTrack = pNextTrack;
  fading = true;
  targetVolume = 1 - targetVolume;
  pNextTrack.amp(targetVolume);
  pNextTrack.loop();
}

void doFade()
{
  targetVolume += 1/50.0;
  if (currentTrack != null) currentTrack.amp(constrain (1-targetVolume, 0, 1));
  if (nextTrack != null) nextTrack.amp(constrain (targetVolume, 0, 1));
  fading = targetVolume < 1;
  
  if (!fading && currentTrack != null) {
    currentTrack.stop();
  }
}
