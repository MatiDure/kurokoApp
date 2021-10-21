//import processing.sound.*;
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


//keeping track of screen
int screen = 0;

//SoundFile file;

//character info
String characterName;
String characterSchool;

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
  
  
  //file = new SoundFile(this,"kurokoStartScreen.wav");
  //file.play();
  //this changes the volume level (number between 0 and 1)
  //file.amp(.5);
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
  
}

void draw()
{
  switch(screen)
  {
    case -1:
      charScreen.title = null;
      charScreen.chosenChar = null;
      schoolScreen.title = null;
      schoolScreen.chosenSchool = null;
      screen4.secondText = false;
      startScreen.update();
    case 0:
      startScreen.update();
      break;
    case 1:
      charScreen.update();
      break;
    case 2:
      schoolScreen.update();
      break;
    case 3:
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
  }
 
}

void mousePressed()
{
 
 switch(screen)
 {
    case -1:
      if(startScreen.nextScreen()) screen = 1;
      break;
    case 0:
      if(startScreen.nextScreen()) screen++;
      break;
    case 1:
      if(charScreen.previosScreen()) screen--;        
      else if(charScreen.nextScreen()) screen++;
      break;
    case 2:
      if(schoolScreen.previousScreen()) screen--;
      else if(schoolScreen.nextScreen()) screen++;
      break;
    case 3:
      if(screen4.previousScreen()) screen = -1;
      else if(screen4.nextScreen()) screen++;
      break;
    case 4:
      if(screen5.previousScreen()) screen = -1;
      else if(screen5.nextScreen()) screen++;
      break;
    case 5:
      if(screen6.previousScreen()) screen = -1;
      else if(screen4.nextScreen()) screen++;
      break;
    case 6:
      if(screen7.previousScreen()) screen = -1;
      else if(screen4.nextScreen()) screen++;
      break;
    case 7:
      if(screen8.previousScreen()) screen = -1;
      else if(screen4.nextScreen()) screen++;
      break;
    case 8:
      if(screen9.previousScreen()) screen = -1;
      else if(screen4.nextScreen()) screen++;
      break;
    case 9:
      if(screen10.previousScreen()) screen = -1;
      else if(screen4.nextScreen()) screen++;
      break;
    case 10:
      if(screen11.previousScreen()) screen = -1;
      else if(screen4.nextScreen()) screen++;
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
    
 }
 if(characterName != null && characterSchool != null) screen4.getNameAndSchool(characterName,characterSchool);
 
}
