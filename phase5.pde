// phase5.pde by hobaksweetpotato

public void hit_(PImage img, float x, float y, float _width, float _height) {
  stroke(0, 255, 0);
  strokeWeight(3);
  rectMode(CENTER);
  image(img, x, y, _width, _height);
  if (isDevMode) {
    stroke(255, 0, 0);
    noFill();
    rect(x, y, _width, _height);
  }
  if (x - _width/2 <= charX && charX <= x + _width/2
    &&  y - _height/2 <= charY && charY <= y + _height/2) {
    if (ouchStart == 0 && isSuper == false) {
      health--;
      ouchStart = millis();
    }
    if (millis() - ouchStart < 1000 * SET_SUPER) isSuper = true;
    else {
      ouchStart = 0;
      isSuper = false;
    }
  }
}

int tX = 0;
int TIME;
int tY1 = 0;
int tY2 = 0;
int tY3 = 0;
int hX = 450;
int hY = 700;
int[] aX = {85, 140, 195, 250, 305, 380, 435, 490, 545, 600, 685, 740, 795, 850, 905};
int[] aY = {500, 450, 490, 440, 510, 480, 450, 500, 440, 510, 470, 510, 440, 500, 460};

int time1 = 500;
int time2 = 1800;
int time3 = 3300;
int time4 = 5300;
int time5 = 6900;
int time6 = 8500;

PImage heart;
PImage tree;
PImage apple;

void phase5() {
  if (TIME == 0) TIME = millis();
  pushStyle();
  pushMatrix();
  imageMode(CENTER);

  //나무 warning
  if (time1 <= millis() - TIME && millis() - TIME <= time1 + 1000) {
    pushMatrix();
    pushStyle();
    noStroke();
    fill(255, 0, 0, 150);
    rect(50, 400, 310, 300);
    //rectMode(CENTER);
    //rect(200, 485, 315, 180);
    //rect(198, 638, 100, 126);
    popStyle();
    popMatrix();
  }

  if (time2 <= millis() - TIME && millis() - TIME <= time2 + 1000) {
    pushMatrix();
    pushStyle();
    noStroke();
    fill(255, 0, 0, 150);
    rect(340, 400, 320, 300);
    popStyle();
    popMatrix();
  }

  if (time3 <= millis() - TIME && millis() - TIME <= time3 + 1000) {
    pushMatrix();
    pushStyle();
    noStroke();
    fill(255, 0, 0, 150);
    rect(640, 400, 320, 300);
    popStyle();
    popMatrix();
  }

  //나무 setting
  imageMode(CENTER);
  if (millis() - TIME >= time1 + 800 && tY1 <= 340) {
    hit_(tree, 200 + tX, 200 + tY1, 315, 370);
    tY1 += 30;
  } else if (millis() - TIME >= time1 + 1032) {
    image(tree, 200 + tX, 560, 315, 370);
  }

  if (millis() - TIME >= time2 + 800 && tY2 >= -300) {
    hit_(tree, 500 + tX, 890 + tY2, 315, 370);
    tY2 -= 30;
  } else if (millis() - TIME >= time2 + 1032) {
    image(tree, 500 + tX, 560, 315, 370);
  }

  if (millis() - TIME >= time3 + 800 && tY3 <= 340) {
    hit_(tree, 800 + tX, 200 + tY3, 315, 370);
    tY3 += 30;
  } else if (millis() - TIME >= time3 + 1032) {
    image(tree, 800 + tX, 560, 315, 370);
  }


  //사과
  for (int i = 0; i < aX.length; i++) {
    if (i % 3 == 0) {
      if (millis() - TIME >= time4 && millis() - TIME <= time4 + 1400) {
        if (millis() - TIME >= time4 + 300 && millis() - TIME <= time4 + 1000)
        {
          pushMatrix();
          pushStyle();
          noStroke();
          rectMode(CORNER);
          fill(255, 0, 0, 150);
          rect(aX[i] - 55/2, aY[i], 55, 700 - aY[i]);
          popStyle();
          popMatrix();
        }
        imageMode(CORNER);
        hit(apple, aX[i] - 30, aY[i] - 30, 60, 60);
      }
    } else if (i%3 == 1) {
      if (millis() - TIME >= time5 && millis() - TIME <= time5 + 1400) {
        imageMode(CORNER);
        if (millis() - TIME >= time5 + 300 && millis() - TIME <= time5 + 1000)
        {
          pushMatrix();
          pushStyle();
          noStroke();
          rectMode(CORNER);
          fill(255, 0, 0, 150);
          rect(aX[i] - 55/2, aY[i], 55, 700 - aY[i]);
          popStyle();
          popMatrix();
        }
        hit(apple, aX[i] - 30, aY[i] - 30, 60, 60);
      }
    } else {
      if (millis() - TIME >= time6 && millis() - TIME <= time6 + 1400) {
        if (millis() - TIME >= time6 + 300 && millis() - TIME <= time6 + 1000)
        {
          pushMatrix();
          pushStyle();
          noStroke();
          rectMode(CORNER);
          fill(255, 0, 0, 150);
          rect(aX[i] - 55/2, aY[i], 55, 700 - aY[i]);
          popStyle();
          popMatrix();
        }
        imageMode(CORNER);
        hit(apple, aX[i] - 30, aY[i] - 30, 60, 60);
      }
    }
  }
  popStyle();
  popMatrix();


  //사과 moving
  pushStyle();
  pushMatrix();
  for (int i = 0; i < aX.length; i++) {
    if (i % 3 == 0) {
      if (millis() - TIME >= time4 + 1000 && aY[i] <= 640) {
        aY[i] += 30;
      }
      if (aY[i] > 640 && aY[i] <= 650) {
        aY[i] += 20;
      } else if (aY[i] > 650 && aY[i] <= 660) {
        aY[i] += 10;
      }
    } else if (i%3 == 1) {
      if (millis() - TIME >= time5 + 1000 && aY[i] <= 640) {
        aY[i] += 30;
      }
      if (aY[i] > 640 && aY[i] <= 650) {
        aY[i] += 20;
      } else if (aY[i] > 650 && aY[i] <= 660) {
        aY[i] += 10;
      }
    } else {
      if (millis() - TIME >= time6 + 1000 && aY[i] <= 640) {
        aY[i] += 30;
      }
      if (aY[i] > 640 && aY[i] <= 650) {
        aY[i] += 20;
      } else if (aY[i] > 650 && aY[i] <= 660) {
        aY[i] += 10;
      }
    }
  }
  popMatrix();
  popStyle();


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
  //popMatrix();
  //popStyle();
}

public void defaultLayout5(int n) {
  pushMatrix();
  PImage img;
  switch (n) {
  case 1:
    img = health1;
    break;
  case 2:
    img = health2;
    break;
  case 3:
    img = health3;
    break;
  case 4:
    img = health4;
    break;
  case 5:
    img = health5;
    break;
  default:
    img = healthE;
    break;
  }
  image(img, 50, 700, 900, 100);
  popMatrix();
}
