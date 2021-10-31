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
    
    
    void init()
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
      schools[0] = (new School("Rakuzan",schoolImgs[0],width*0.25,height*0.25,new int[]{281,5,83}));
      schools[1] = (new School("Yosen",schoolImgs[1],width*0.25,height*0.5,new int[]{281,5,83}));
      schools[2] = (new School("Seirin",schoolImgs[2],width*0.25,height*0.75,new int[]{281,5,83}));
      schools[3] = (new School("Too",schoolImgs[3],width*0.75,height*0.25,new int[]{281,5,83}));
      schools[4] = (new School("Shutoku",schoolImgs[4],width*0.75,height*0.5,new int[]{281,5,83}));
      schools[5] = (new School("Kaijo",schoolImgs[5],width*0.75,height*0.75,new int[]{281,5,83}));
      //adding background image
      schoolScreenImg = loadImage("screenBackground/schoolScreenImg.png");
      
    }
    
    void update()
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
    
    String chosenSchool()
   {
     return chosenSchool;
   }
   
    
    boolean previousScreen()
    {
      if(buttons[0].hover()) return true;
      return false;
    }
    
    boolean nextScreen()
    {
     if(buttons[1].hover())
     {
       if(chosenSchool!=null) return true;
       else displayWarning = true;  
     }
     return false;
    }

}
