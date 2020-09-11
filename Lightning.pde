
import java.util.*;

//initializing variables
int startX = 0;
int startY = 150;
int endX = 0;
int endY = 150;
int listLength = 4;
int oldNeckX; //previous squidward location
int oldNeckY;
int oldOldNeckX; //squidward location two cycles ago
int oldOldNeckY;
//declare a variable for image of PImage type
PImage krustyKrab;
PImage spongebob;
int squidX = 250; //current squidward location
int squidY = 150;
float spongeX;
float spongeY;

ArrayList<Integer> oldNecks
  = new ArrayList <Integer>(listLength);
  

void setup() 
{
  size (500, 300);
  strokeWeight(18);
  background(255);
  frameRate(4);
  krustyKrab = loadImage("krustykrab.jpg");
  spongebob = loadImage("spongebob.png");
  image(krustyKrab, 0, 0, 500, 300);
}

void draw()
{
  image(krustyKrab, 0, 0, 500, 300);
  stroke(#a3d3c3);
  strokeWeight(18);
  line(startX,startY,squidX,squidY);
  oldNecks.add(startX);
  oldNecks.add(startY);
  oldNecks.add(squidX);
  oldNecks.add(squidY);
  listLength += 2;
  for (int i = 2; i < oldNecks.size(); i++) {
    if (i % 2 == 0) {
      oldNeckX = oldNecks.get(i);
      oldOldNeckX = oldNecks.get(i-2);
    }
    if (i % 2 == 1) {
      oldNeckY = oldNecks.get(i);
      oldOldNeckY = oldNecks.get(i-2);
       line(oldOldNeckX, oldOldNeckY, oldNeckX, oldNeckY);
    }
   
  }
 
  noStroke();
  fill(#80bfaa);
  ellipse(squidX, squidY, 80, 50); //squidward's top head
  rect(squidX-25, squidY+10, 50, 30);
  fill(#fffcbb);
  ellipse(squidX+10, squidY+10, 20, 30); //right eye
  ellipse(squidX-10, squidY+10, 20, 30); //left eye
  fill(#b22727);
  rect(squidX+8, squidY, 5, 15);//right pupil
  rect(squidX-12, squidY, 5, 15);//left pupil
  noFill();
  strokeWeight(15);
  stroke(#80bfaa);
  arc(squidX, squidY+40, 50, 15, -PI, 0); //squidward's frown
  strokeWeight(2);
  stroke(0, 0, 0);
  arc(squidX, squidY+40, 50, 20, -PI, 0); //squidward's frown line
  strokeWeight(1);
  arc(squidX, squidY, 60, 20, -PI, 0);//squidward's forehead wrinkles
  arc(squidX, squidY-10, 70, 10, -PI, 0);
  noStroke();
  fill(#6a9989);
  triangle(squidX-10, squidY+30, squidX, squidY+10, squidX+10, squidY+30); //nosebridge
  ellipse(squidX, squidY+40, 20, 30); //nose
  
  
  startX = squidX;
  startY = squidY;
  squidX = (int)(Math.random()*500)+1;
  squidY = (int)(Math.random()*300)+1;

}
void mousePressed()
{
  //reset variables
  startX = 0;
  startY = 150;
  endX = 0;
  endY = 150;
  
 spongeX = mouseX-41;
 spongeY = mouseY-52.5;
 image(spongebob, spongeX, spongeY, 82, 105.5);
}
