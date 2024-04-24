/*
Copyright (C) 2024 AndyH0ng
 
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.
 
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Affero General Public License for more details.
 
You should have received a copy of the GNU Affero General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
*/
// Version: 0423-005

// 장애물 배치하는 법
// 1. 전역 변수 PImage 선언
// 2. setup()에서 이미지 불러오기
// 3. hit(PImage 이름, x좌표, y좌표, 가로 길이, 세로 길이)
//    해주면 이미지를 출력함과 동시에 장애물로 인식함.

final boolean isDevMode = true;
// 디버그 모드
// 1. 게임 플레이 시 콘솔에 다음을 출력함
//    캐릭터의 x좌표, y좌표
//    Health
//    가장 최근에 데미지를 입은 시간
//    페이즈
//    현재 페이즈에서 지난 시간
//
// 2. 게임 플레이 시 조종하는 캐릭터에 히트 박스 표시
//
// 3. 게임 플레이 화면을 제외한 모든 화면에서 키보드 입력 시 다른 화면으로 건너 뜀
//    0 -> 메인 화면
//    1 -> 게임 플레이 화면
//    2 -> 게임 설명 화면
//    - -> 게임 오버 화면
//
// 4. 게임 오버 화면에서 키보드 입력 시 health n개의 결과가 출력됨
//    q -> n = 5
//    w -> n = 4
//    e -> n = 3
//    r -> n = 2
//    t -> n = 1
//    y -> n = 0
// 

final int SET_HEALTH = 5;         // 캐릭터에게 부여된 생명
final int SET_CHARX = 500;        // 캐릭터의 기본 x좌표
final int SET_CHARY = 550;        // 캐릭터의 기본 y좌표
final float SET_SUPER = 0.5;      // 데미지를 입은 경우 무적이 되는 쿨타임 시간 (단위: 초)
final int SET_PHASETOTAL = 5;     // 총 페이즈 수
final int SET_STORY1TIME = 1;     // 대화1 진행 시간 (단위: 초)
final int SET_STORY2TIME = 2;     // 대화2 진행 시간 (단위: 초)
final int SET_PHASE3TIME = 10;    // 페이즈3 진행 시간 (단위: 초)
final int SET_PHASE4TIME = 20;    // 페이즈4 진행 시간 (단위: 초)
final int SET_PHASE5TIME = 12;    // 페이즈5 진행 시간 (단위: 초)
final int SET_CONTROL_SENSITIVITY = 3;

final int MAINSCREEN = 0;         // 처음 시작 화면
final int GAMEPLAYING = 1;        // 게임 화면
final int GAMEDESC = 2;           // 게임 설명 화면
final int GAMEOVER = -1;          // 게임오버 화면

// 손 대지 말 것!
public int screenState = MAINSCREEN;
public int health = SET_HEALTH;
public int charX = SET_CHARX;
public int charY = SET_CHARY;
public int gamePhase = 1;
public int prevTime = 0;
public boolean isSuper = false;
public int ouchStart = 0;

// End of 손 대지 말 것!


// PImage 선언
PImage logo;
PImage start0, start0_, start1, back;
PImage health1, health2, health3, health4, health5, healthE;
PImage character, enemy;
PImage gameOver;
PImage gameOver_Result1;
PImage gameOver_Result2_0, gameOver_Result2_1, gameOver_Result2_2,
       gameOver_Result2_3, gameOver_Result2_4, gameOver_Result2_5;
PImage desc;
// End of PImage 선언

public void setup() {
  size(1000, 800);
  frameRate(60);
  // 이미지 불러오기
  logo = loadImage("game/logo.png");
  
  start0 = loadImage("button/start0.png");
  start0_ = loadImage("button/start0_.png");
  start1 = loadImage("button/start1.png");
  back = loadImage("button/back.png");

  health1 = loadImage("game/health1.png");
  health2 = loadImage("game/health2.png");
  health3 = loadImage("game/health3.png");
  health4 = loadImage("game/health4.png");
  health5 = loadImage("game/health5.png");
  healthE = loadImage("game/healthE.png");
  
  chara1 = loadImage("dialog/chara1.png");
  story1 = loadImage("game/story1.png");
  chara2 = loadImage("dialog/chara1.png");
  story2 = loadImage("game/story1.png");
  
  character = loadImage("game/ssung.png");
  enemy = loadImage("game/enemy1.png");  
  
  gameOver = loadImage("game/gameOver.png");
  gameOver_Result1 = loadImage("game/gameOver_Result1.png");
  gameOver_Result2_0 = loadImage("game/gameOver_Result2_0.png");
  gameOver_Result2_1 = loadImage("game/gameOver_Result2_1.png");
  gameOver_Result2_2 = loadImage("game/gameOver_Result2_2.png");
  gameOver_Result2_3 = loadImage("game/gameOver_Result2_3.png");
  gameOver_Result2_4 = loadImage("game/gameOver_Result2_4.png");
  gameOver_Result2_5 = loadImage("game/gameOver_Result2_5.png");
  desc = loadImage("desc.png");
  
  imgA = loadImage("phase3/A.png");
  imgB = loadImage("phase3/B.png");
  imgC = loadImage("phase3/C.png");
  imgF = loadImage("phase3/F.png");
  imgG = loadImage("phase3/gujjing.png");
  
  runningShoong = loadImage("phase4/runningshoong.png");
  walkingShoong = loadImage("phase4/walkingshoong.png");
  talkingShoong = loadImage("phase4/talkingshoong.png");
  skatingShoong = loadImage("phase4/skatingshoong.png");
  soundwave = loadImage("phase4/soundwave.png");
  
  heart = loadImage("phase5/heart_1.png");
  tree = loadImage("phase5/tree_pen1.png");
  apple = loadImage("phase5/appleWW.png");

  startTime = 0;
  TIME = 0;
  for (int i = 0; i < 20; i++) {
    arcX0[i] = 100;
    arcY0[i] = 680;
    arcX1[i] = 100;
    arcY1[i] = 680;
  }
  arcX0[0] = 101;
  arcX1[0] = 101;
  for (int i = 0; i < 4; i++) {
    wX[i] = 930;
    rX[i] = 900;
    sX[i] = 50;
  }
  sY[0] = 400; sY[1] = 400; sY[2] = 500; sY[3] = 500;
  hakjeoms.add(new Hakjeom(random(rectLeftX, rectRightX), rectTopY, imgA, random(-4, 4), random(4, 8)));
  hakjeoms.add(new Hakjeom(random(rectLeftX, rectRightX), rectTopY, imgB, random(-4, 4), random(4, 8)));
  hakjeoms.add(new Hakjeom(random(rectLeftX, rectRightX), rectTopY, imgC, random(-4, 4), random(4, 8)));
  hakjeoms.add(new Hakjeom(random(rectLeftX, rectRightX), rectTopY, imgF, random(-4, 4), random(4, 8)));
  hakjeoms.add(new Hakjeom(imgG_X, imgG_Y, imgG, 0, 0)); 
}

public void draw() {
  // 게임 플레이 중일 때 키보드 입력 값에 따라 플레이어 조종합니다.
  // + 박스 경계에 다다를 경우 조종 제한
  if (screenState == GAMEPLAYING) {
    if (keyPressed && ((key == CODED && keyCode == UP) || key == 'w')
    && charY > 400 + 36) charY -= SET_CONTROL_SENSITIVITY;
    else if (keyPressed && ((key == CODED && keyCode == DOWN) || key == 's')
    && charY < 700 - 36) charY += SET_CONTROL_SENSITIVITY;
    else if (keyPressed && ((key == CODED && keyCode == LEFT) || key == 'a')
    && charX > 50 + 39) charX -= SET_CONTROL_SENSITIVITY;
    else if (keyPressed && ((key == CODED && keyCode == RIGHT) || key == 'd')
    && charX < 950 - 39) charX += SET_CONTROL_SENSITIVITY;
  }
  // screenState에 따라 화면을 다르게 표시합니다.
  switch (screenState) {
    case MAINSCREEN: mainScreen(); break;
    case GAMEPLAYING: gameScreen(); break;
    case GAMEDESC: gameDesc(); break;
    case GAMEOVER: gameOverScreen(); break;
    default: println("[INFO] Error Occured! Code: SCREEN_STATE_FAILURE"); break;
  }
  
}

// 상태 별 버튼이 존재하는 좌표를 클릭 시 실행할 작업을 지정합니다.
public void mousePressed() {
  switch (screenState) {
    case MAINSCREEN:
    button(350, 400, 295, 118, 1);
    button(350, 600, 295, 118, 2);
    break;
    
    case GAMEPLAYING:
    break;
    
    case GAMEDESC:
    button(350, 550, 295, 118, 0);
    break;
    
    case GAMEOVER:
    //button(353, 650, 295, 118, -1);
    break;
    
    default:
    println("[INFO] Error Occured! Code: SCREEN_STATE_EXCHANGE_FAILURE");
    break;
  }
}

public void mouseDragged() {
  switch (screenState) {
    case MAINSCREEN:
    image(start0_, 350, 400);
    button(350, 600, 295, 118, -2);
    break;
    
    case GAMEPLAYING:
    break;
    
    case GAMEDESC:
    button(350, 550, 295, 118, 0);
    break;
    
    case GAMEOVER:
    //button(353, 650, 295, 118, -1);
    break;
    
    default:
    println("[INFO] Error Occured! Code: SCREEN_STATE_EXCHANGE_FAILURE");
    break;
  }
}

public void keyPressed() {
  // DEBUG MODE
  if (isDevMode) {
    if (screenState != GAMEPLAYING) {
      switch (key) {
        case '0': screenState = MAINSCREEN; break;
        case '1': screenState = GAMEPLAYING; break;
        case '2': screenState = GAMEDESC; break;
        case '-': screenState = GAMEOVER; break;
      }
    }
  }
}

// 버튼의 사이즈와 위치에 따라 마우스 클릭에 반응하는 범위를 지정합니다.
public void button(int x, int y, int xSize, int ySize, int whereTo) {
  if (x <= mouseX && mouseX <= x + xSize
  &&  y <= mouseY && mouseY <= y + ySize) screenState = whereTo;
}

// MAINSCREEN = 0
// 게임 실행 시 나타나는 메인 화면입니다.
public void mainScreen() {
  background(0);
  image(logo, 200, 200);
  image(start0, 350, 400);
  image(start1, 350, 600);
}

// GAMESELECT = 1
// 게임 플레이 화면입니다.
public void gameScreen() {
   //DEBUG MODE
  if (isDevMode) {
    println("\n좌표: ", "(", charX, ",", charY, ")",
            "\nHealth: ", health,
            "\nouchStart:", ouchStart,
            "\ngamePhase: ", gamePhase,
            "\nTime took from this phase: ", millis() - prevTime, "ms",
            "\nmillis() - TIME: ", millis() - TIME
            );
            
  }
  background(0);
  defaultLayout(health);
  
  
  // 페이즈 당 부여할 시간을 지정합니다.
  switch (gamePhase) {
    case 1: circuit(prevTime, SET_STORY1TIME); break;
    case 2: circuit(prevTime, SET_STORY2TIME); break;
    case 3: circuit(prevTime, SET_PHASE3TIME); break;
    case 4: circuit(prevTime, SET_PHASE4TIME); break;
    case 5: circuit(prevTime, SET_PHASE5TIME); break;
  }
  
  // TODO: 여기에 페이즈 별 장애물을 넣으세요.
  switch (gamePhase) {
    case 1: dialog(chara1, story1); break;
    case 2: dialog(chara1, story2); break;
    case 3: phase3(); break;
    case 4: phase4(); break;
    case 5: phase5(); break;
    case 6: hit(enemy, 50, 400, 164, 231); break;
    case 7: hit(enemy, 50, 400, 164, 231); break;
    default: println("[INFO] Error Occured! Code: PHASE_OUT_OF_BOUNDS"); break;
  } if (prevTime == 0) prevTime = millis();
  
  character(charX, charY);
}

public void circuit(int m, int howLong) {
  // 페이즈 당 정한 시간이 지나면 다음 페이즈로 넘어갑니다.
  if (millis() - m >= 1000 * howLong) {
    if (gamePhase < SET_PHASETOTAL) {
      prevTime = millis();
      gamePhase++;
    // 5 페이즈까지 시행
    } else if (gamePhase == 5) screenState = GAMEOVER;
  }
  // health가 0이 되면 게임 오버
  if (health == 0) screenState = GAMEOVER;
}

// 조종가능한 캐릭터가 존재하는 사각형 틀
// + Health bar를 그립니다.
public void defaultLayout(int n) {
  pushMatrix();
  PImage img;
  stroke(255);
  strokeWeight(5);
  fill(0);
  rect(50, 400, 900, 300);
  switch (n) {
    case 1: img = health1; break;
    case 2: img = health2; break;
    case 3: img = health3; break;
    case 4: img = health4; break;
    case 5: img = health5; break;
    default: img = healthE; break;
  }
  image(img, 50, 700, 900, 100);
  popMatrix();
}

public void hit(PImage img, float x, float y, float _width, float _height) {
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

public void dialog(PImage img, PImage txt) {
  image(img, 53, 403, 295, 295);
  image(txt, 353, 403, 597, 297);
}

// 캐릭터를 그립니다.
void character(int x, int y) {
  image(character, x - 25, y - 25, 50, 50);
  if (isDevMode) {
    stroke(255, 255, 0);
    strokeWeight(3);
    noFill();
    rect(x - 25, y - 25, 50, 50);
  }
}

// GAMEDESC = 2
public void gameDesc() {
  background(0);
  image(desc, 0 ,0);
  image(back, 350, 550);
}

// GAMEOVERSCREEN = -1
// 게임 오버 화면입니다.
public void gameOverScreen() {
  if (isDevMode) {
    switch (key) {
      case 'q': health = 5; break;
      case 'w': health = 4; break;
      case 'e': health = 3; break;
      case 'r': health = 2; break;
      case 't': health = 1; break;
      case 'y': health = 0; break;
    }
  }
  background(0);
  image(gameOver, 130, 30);
  image(gameOver_Result1, 300, 150);
  switch (health) {
    case 0: image(gameOver_Result2_0, 300, 150); break;
    case 1: image(gameOver_Result2_1, 300, 150); break;
    case 2: image(gameOver_Result2_2, 300, 150); break;
    case 3: image(gameOver_Result2_3, 300, 150); break;
    case 4: image(gameOver_Result2_4, 300, 150); break;
    case 5: image(gameOver_Result2_5, 300, 150); break;
    default: println("[INFO] Error Occured! Code: NO_SUCH_HEALTH_VALUE"); break;
  }
}
PImage chara1, story1, chara2, story2;
