//TODO: Implement hit detection of aliens
//TODO: Make aliens move
//TODO: implement mousePressed() for shooting
//TODO: use sin wave to oscillate alien movement
//int[] bulletX = {0};
//int[] bulletY = {0};

IntList bulletX;
IntList bulletY;
IntList alienX;
IntList alienY;
boolean aliensRight = true;

void setup() {
  size(600, 400);
  background(0);
  noStroke();
  bulletX = new IntList();
  bulletY = new IntList();
  alienX = new IntList();
  alienY = new IntList();
  for(int i=100; i<500;i+=50){
    alienX.append(i);
    alienY.append(40);
  }
}

void draw() {
  background(0);
  // Draw laser on mouseX
  laser(mouseX, 380);
  //Collision detection
  //Update score
  //Check gameover
  // Fire laser if mouse clicked
  // Draw and move bullets
  for (int i=0; i<bulletX.size(); i++){
    if (bulletY.get(i) > 0){
      bullet(bulletX.get(i), bulletY.get(i));
      bulletY.sub(i, 10);
    } else {
      bulletX.remove(i);
      bulletY.remove(i);
    }
  }
  // Draw and move aliens
  for (int i=0; i<alienX.size(); i++){
    alien(alienX.get(i), alienY.get(i));
    if (aliensRight){
      alienX.add(i,2);
    } else {
      alienX.sub(i,2);
    }
  }
  // Determine alien direction
  if (alienX.get(0) < 100) {
    aliensRight = true;
  } else if (alienX.get(alienX.size()-1) > 500) {
    aliensRight = false;
  } //<>//
}


//TODO: Update draw functions to use centre
void alien(float x, float y){
  noStroke();
  fill(255);
  rect(x-15,y-5,30,10);
  rect(x-8,y+5,5,10);
  rect(x+4,y+5,5,10);
  fill(0);
  rect(x-7,y,4,4);
  rect(x+7,y,4,4);
  
  // Draw centre point
  //stroke(255,0,0);
  //strokeWeight(5);
  //point(x,y);
}

void laser(float x, float y){
  noStroke();
  fill(255);
  rect(x-10,y+10,20,5);
  rect(x-2,y-2,5,10);
  rect(x-5,y+5,10,5);
  
  // Draw centre point
  //stroke(255,0,0);
  //strokeWeight(5);
  //point(x,y);
}

void bullet(float x, float y){
  noStroke();
  fill(255);
  rect(x-2,y-8,4,16);
  // Draw centre point
  //stroke(255,0,0);
  //strokeWeight(5);
  //point(x,y);
}

void mousePressed(){
  bulletX.append(mouseX);
  bulletY.append(380);
}
