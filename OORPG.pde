PImage img, img1, enemy;

String playerClass;
int start = 0;

int myX = 450;
int myY = 400;

rpgCharacter player;
Ork orkGrunt = new Ork();

boolean alive = true;

int exp = 0;

void setup(){
  size(1016,800);
  PImage chooseClass;
  chooseClass = loadImage("Class Selection.jpg");
  background(chooseClass);
}

void draw(){  
  println(mouseX + " " + mouseY);

  //Choosing Class
  if(start == 0){
    if(mousePressed && mouseY>217 && mouseY<780){
      if(mouseX>10 && mouseX<320) playerClass = "Paladin";
      else if(mouseX>350 && mouseX<655) playerClass = "Mage";
      else if(mouseX>685 && mouseX<1002) playerClass = "Elven";
      start = 1;
    }
  }
  
  //Normal Sprite
  else if(start == 1){    
    PImage grass;
    grass = loadImage("grass.jpg");
    background(grass);
    textSize(25);
    fill(255,0,0);
    text("UPGRADE",900,50);
    fill(0,0,255);
    text("EXP: " + exp,100,50);
    
    if(keyPressed && key == 'r'){
      alive = true;
      orkGrunt.health = 70;
    }
    
    if(alive){
      enemy = loadImage("Ork.png");
      image(enemy,700,400);
    }
    
    if(playerClass.equals("Paladin")){
      player = new Paladin();
      img = loadImage("Paladin.png");
      image(img,myX,myY); 
    }
    if(playerClass.equals("Mage")){
      player = new Mage();
      img = loadImage("Mage.png");
      image(img,myX,myY); 
    }
    if(playerClass.equals("Elven")){
      player = new Elven();
      img = loadImage("Elven.png");
      image(img,myX,myY); 
    }
    
    //Walking
    if(keyPressed){
      if(key == 'w') myY -= player.speed;
      if(key == 'a') myX -= player.speed;
      if(key == 's') myY += player.speed;
      if(key == 'd') myX += player.speed;
    }
    
    //Attack Sprite
    if(mousePressed && mouseX>902 && mouseX<1011 && mouseY>32 && mouseY<46){
      start = 3;
      println("here" +start);
    } else if(mousePressed){
        start++;
        background(grass);
        fill(255,0,0);
        text("UPGRADE",900,50);
        fill(0,0,255);
        text("EXP: " + exp,100,50);
        if(alive) image(enemy,700,400);
        if(playerClass.equals("Paladin")){
          
          //Deal Damage (NOT FINAL)
          if(700 - myX < 50 && 400 - myY < 50){
            println("Hit");
            orkGrunt.health -= player.attack;
            println(orkGrunt.health);
            if(orkGrunt.health <= 0){
              alive = false;
              exp++;
              println(exp);
            }
          }
          
          img1 = loadImage("Paladin Attack.png");
          image(img1,myX,myY);
          delay(500);
          start = 1;
        }
        if(playerClass.equals("Mage")){
          img1 = loadImage("Mage Attack.png");
          image(img1,myX,myY);
          delay(500);
          start = 1;        
        }
        if(playerClass.equals("Elven")){
          img1 = loadImage("Elven Attack.png");
          image(img1,myX,myY);
          delay(500);
          start = 1;
        }
    }
    
    
  }
  
  //Upgrade Menu
  else if(start == 3){
    println("here!");
    PImage upgrade;
    upgrade = loadImage("Upgrade.jpg");
    background(upgrade);
    textSize(25);
    fill(255,0,0);
    text("QUIT",900,100);
    fill(0,0,255);
    text("EXP: " + exp,100,50);
    
    if(mousePressed && mouseX>25 && mouseX<890){
      if(mouseY>24 && mouseY<224 && exp>=2){
        player.health += 10;
        exp -= 2;
      }
      else if(mouseY>264 && mouseY<461 && exp>=3){
        player.attack += 10;
        exp -= 3;
      }
      /*Ultimate Strike
      else if(mouseY>499 && mouseY<775){
        
      }
      */
    }
    else if(mousePressed && mouseX>904 && mouseX<959 && mouseY>83 && mouseY<102){
      start = 1;
    }
  }
  println();
}

//Classes
class rpgCharacter{
  int health;
  int speed;
  int attack;
  
  //Upgrades-----------------------------------------------
  void hpUp(){
    health += 10;
  }
  
  void attackUp(){
    attack += 10;
  }    
}

class Paladin extends rpgCharacter{
  Paladin(){
    health = 100;
    speed = 10;
    attack = 50;
  }
  
  void imperialFury(){
    
  }
}

class Mage extends rpgCharacter{
  int range;
  
  Mage(){
    health = 70;
    speed = 20;
    attack = 40;
    range = 50;
  }
  
  void magUnlock(){
    
  }
  
  void merlinsDeathWish(){
    
  }
}

class Elven extends rpgCharacter{
  int range;
  
  Elven(){
    health = 50;
    speed = 30;
    attack = 60;
    range = 100;
  }
  
  void shadowPiercer(){
    
  }
}

class Ork extends rpgCharacter{
  Ork(){
    health = 70;
    speed = 20;
    attack = 10;
  }
  
}
