//TODO: Update draw functions to use centre mode
//TODO: implement scoring
//TODO: add more alien rows
//TODO: add endgame conditions
//TODO: add sound effects
//TODO: update draw functions to accept PVector

PVector[] pBullets = new PVector[0];
PVector[] pAliens = new PVector[0];

boolean aliensRight = true;
float theta = 0.0;

void setup() {
  size(600, 400);
  background(0);
  noStroke();
  for(int i=100; i<500;i+=50){
    pAliens = (PVector[])append(pAliens, new PVector(i, 40));
  }
}

void draw() {
  background(0);
  // Draw laser on mouseX
  laser(mouseX, 380);
  checkCollision();
  // Check gameover
  // Draw and move bullets
  for (int i=0; i<pBullets.length; i++){
    if (pBullets[i].y > 0){
      bullet(pBullets[i].x, pBullets[i].y);
      pBullets[i].sub(new PVector(0, 10));
    }
  }
  // Draw and move aliens
  for (int i = 0; i < pAliens.length; i++){
    alien(pAliens[i].x, pAliens[i].y);
    if (sin(radians(theta)) > 0) {
      if (theta % 540 == 0) {
        pAliens[i].add(new PVector(0, 20));
      } else {
        pAliens[i].add(new PVector(2, 0));
      }
    } else {
      if (theta % 540 == 0) {
        pAliens[i].add(new PVector(0, 20));
      } else {
        pAliens[i].add(new PVector(-2, 0));
      }
    }
  }
  theta += 10; //<>//
}


/*
  Draws an alien at the provided x, y coords
*/
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

/*
  Draws a laser at the provided x, y coords
*/
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

/*
  Draws a bullet at the provided x, y coords
*/
void bullet(float x, float y){
  noStroke();
  fill(255);
  rect(x-2,y-8,4,16);
  // Draw centre point
  //stroke(255,0,0);
  //strokeWeight(5);
  //point(x,y);
}

/*
  Fires a bullet
*/
void mousePressed(){
  pBullets = (PVector[])append(pBullets, new PVector(mouseX, 380)); //<>//
}

/*
  Check if any bullets have hit aliens
*/
void checkCollision() {
  for (int i=0; i < pBullets.length; i++) {
    for (int j=0; j < pAliens.length; j++) {
      if ((abs(pBullets[i].x - pAliens[j].x) <= 10) && (abs(pBullets[i].y - pAliens[j].y) <= 10)) {
        pAliens[j] = new PVector(2000, 0);
        // TODO: Increase score
      }
    }
  }
}
