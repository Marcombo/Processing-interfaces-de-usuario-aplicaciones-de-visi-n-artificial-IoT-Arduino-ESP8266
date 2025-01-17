int x, y, tamanioEmoticono;

void setup(){
  size(600, 600);
  background(255);
  tamanioEmoticono = 400;
  x = width/2;
  y = height/2;
  textAlign(CENTER, CENTER);
  textSize(30);
}

void draw(){
  text("¡SONRÍE! ES GRATIS", width/2, width-50);
  strokeWeight(1);
  fill(255, 255, 0);
  ellipse(x, y, tamanioEmoticono, tamanioEmoticono);
  fill(0);
  ellipse(x-70, y-70, 50, 70);
  ellipse(x+70, y-70, 50, 70);
  noFill();
  strokeWeight(10);
  arc(x, y+60, 200, 150, 0, PI);
}