// phase4.pde by sandocsol

PImage runningShoong, walkingShoong, talkingShoong, skatingShoong, soundwave;
int startTime;
int[] arcX0 = new int [20], arcY0 = new int [20];
int[] arcX1 = new int [20], arcY1 = new int [20];
int[] arcX2 = new int [20], arcY2 = new int [20];
int[] wX = new int [4];
int wY = 400;
int[] rX = new int [4];
int rY = 600;
int[] sX = {50, 50, 50, 50}, sY = {400, 400, 500, 500};

void phase4() {
  if (startTime == 0) startTime = millis();
  pushStyle();
  int r = 60;
  hit(talkingShoong, 10, 640, 120, 120);
  for (int i = 0; i < 20; i++) {
    if (millis() - startTime > 2000 + 60 * i) {
      arcX0[i] += 10;
      arcY0[i] -= 5;
      hit(soundwave, arcX0[i], arcY0[i] - 60, 60, 60);
    }
    if (millis() - startTime > 6000 + 60 * i) {
      arcX1[i] += 10;
      arcY1[i] -= 5;
      hit(soundwave, arcX1[i], arcY1[i] - 60, 60, 60);
    }
    if (millis() - startTime > 10000 + 60 * i) {
      arcX2[i] += 10;
      arcY2[i] -= 5;
      hit(soundwave, arcX1[i], arcY1[i] - 60, 60, 60);
    }
    if (arcY0[i] < 450) {
      fill(0);
      noStroke();
      rect(500, 0, 500, 400);
      strokeWeight(5);
      stroke(255);
      line(500, 400, 950, 400);
    }
  }

  hit(walkingShoong, wX[0], wY, 80, 100);
  wX[0] -= 7;
  if (millis() - startTime > 8000) {
    hit(walkingShoong, wX[1], wY, 80, 100);
    wX[1] -= 7;
  }
  if (millis() - startTime > 15000) {
    hit(walkingShoong, wX[2], wY, 80, 100);
    wX[2] -= 7;
  }
  if (millis() - startTime > 19000) {
    hit(walkingShoong, wX[3], wY, 80, 100);
    wX[3] -= 7;
  }
  if (millis() - startTime > 7000) {
    hit(runningShoong, rX[0], rY, 90, 90);
    rX[0] -= 7;
  }
  if (millis() - startTime > 10000) {
    hit(runningShoong, rX[1], rY, 90, 90);
    rX[1] -= 7;
  }
  if (millis() - startTime > 16000) {
    hit(runningShoong, rX[2], rY, 90, 90);
    rX[2] -= 7;
  }
  if (millis() - startTime > 2000) {
    hit(runningShoong, rX[3], rY, 90, 90);
    rX[3] -= 7;
  }
  if (millis() - startTime > 4000) {
    hit(skatingShoong, sX[0], sY[0], 90, 90);
    sX[0] += 7;
    sY[0] += 5;
  }
  if (millis() - startTime > 14000) {
    hit(skatingShoong, sX[1], sY[1], 90, 90);
    sX[1] += 7;
    sY[1] += 5;
  }
  if (millis() - startTime > 19000) {
    hit(skatingShoong, sX[2], sY[2], 90, 90);
    sX[2] += 7;
  }
  if (millis() - startTime > 13000) {
    hit(skatingShoong, sX[3], sY[3], 90, 90);
    sX[3] += 7;
  }
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

  pushStyle();
  hit(talkingShoong, 10, 640, 120, 120);
  popStyle();
  image (imgG, 400, 90, 200, 250);
  defaultLayout5(health);
}
