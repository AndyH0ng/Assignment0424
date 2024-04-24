// phase3.pde by fo0ont

ArrayList<Hakjeom> hakjeoms = new ArrayList<Hakjeom>();
PImage imgA, imgB, imgC, imgF, imgG; // 이미지 객체
int rectTopY = 400;
int rectBottomY = rectTopY + 300;
int rectLeftX = 50;
int rectRightX = rectLeftX + 900;
int imgG_X = 500; // 이미지 G의 x 위치
int imgG_Y = 200; // 이미지 G의 y 위치


public void phase3() {
  pushStyle();
  //background(0);
  //drawRectangle();
  // 모든 이미지 표시
  
  for (int i = hakjeoms.size() - 1; i >= 0; i--) {
    Hakjeom b = hakjeoms.get(i);
    b.move();
    // 이미지가 아랫변에 닿으면 삭제
    if (b.y > rectBottomY || b.x < rectLeftX || b.x > rectRightX) {
      hakjeoms.remove(i);
      // 새로운 이미지 추가
      PImage img;
      if (b.img == imgA) 
        img = imgA;
      else if (b.img == imgB)
        img = imgB;
      else if (b.img == imgC)
        img = imgC;
      else if (b.img == imgF)
        img = imgF;
      else
        img = imgG;
      hakjeoms.add(new Hakjeom(random(rectLeftX, rectRightX), rectTopY, img, random(-4, 4), random(4, 8)));
    }
  }
  popStyle();
}
//피하는 사각형 그리기
void drawRectangle() {
  stroke(255);
  strokeWeight(5);
  fill(0);
  rect(rectLeftX, rectTopY, 900, 300);
}

class Hakjeom {
  float x, y;
  float speedX, speedY;
  PImage img; // 이미지 변수

  Hakjeom(float x, float y, PImage img, float speedX, float speedY) {
    this.x = x;
    this.y = y;
    this.img = img;
    this.speedX = speedX;
    this.speedY = speedY;
  }

  void move() {
    y += speedY;
    x += speedX;
    display();
  }

  void display() {
    pushStyle();
    hit2(img, x, y, 49, 61);
    popStyle();
  }
}

public void hit2(PImage img, float x, float y, float _width, float _height) {
  stroke(0, 255, 0);
  strokeWeight(3);
  rectMode(CORNER);
  image(img, x, y, _width, _height);
  if (isDevMode) {
    stroke(255, 0, 0);
    noFill();
    rect(x, y, _width, _height);
  }
  if (x <= charX && charX <= x + _width
  &&  y <= charY && charY <= y + _height) {
    if (ouchStart == 0 && isSuper == false) {
      if (img == imgA || img == imgB && health < 5) health++;
      else if (img == imgA || img == imgB && health >= 5) health = 5;
      else if (img == imgC || img == imgF) health--;
      ouchStart = millis();
    }
    if (millis() - ouchStart < 1000 * SET_SUPER) isSuper = true;
    else {
      ouchStart = 0;
      isSuper = false;
    }
  }
  
  //게임 플레이 창 (덮기)
  pushStyle();
  pushMatrix();
  rectMode(CORNER);
  stroke(0);
  strokeWeight(100);
  noFill();
  rect(0, 350, 1000, 400);
  rectMode(CENTER);
  strokeWeight(400);
  noFill();
  rect(500, 600, 1800, 800);
  rectMode(CORNER);
  stroke(255);
  strokeWeight(5);
  rect(50, 400, 900, 300);
  popStyle();
  popMatrix();
  
  image (imgG, 400, 90, 200, 250);
  
  defaultLayout5(health);
}
