import processing.serial.*;

Serial puerto; 
String datosLeidos;
int valor; 
int[] valores;

void setup() 
{
  size(1200, 500);
  //establece las comunicaciones con Arduino
  puerto = new Serial(this, Serial.list()[0], 115200);
  puerto.bufferUntil('\n');
  //array que almacena los valores de las tensiones que se muestran en pantalla
  valores = new int[width];
}

void draw()
{
  background(0);
  pintaTitulo();
  pintaRejilla();
  if (valor >= 0) pushValor(valor);
  pintaTrazo();
}

void serialEvent( Serial puerto) {
  datosLeidos = puerto.readStringUntil('\n');
  if (datosLeidos != null) {
    valor = int(trim(datosLeidos));
    //println(valor);
    puerto.clear();
  }
}

//almacena un nuevo valor en el array de valores
void pushValor(int valor) {
  for (int i = 0; i < width-1; i++) valores[i] = valores[i+1];
  valores[width-1] = valor;
}

void pintaTitulo(){
  textAlign(CENTER, CENTER);
  textSize(30);
  fill(255, 255, 255, 50);
  text("OSCILOSCOPIO", width/2, height/2);
}

//dibuja en pantanlla la evolución de la tensión en el tiempo
//para ello pinta líneas entre valores de tensión consecutivos
void pintaTrazo() {
  stroke(250, 250, 0);
  strokeWeight(2);
  int x0 = 0;
  int y0 = int(map(float(valores[0]), 0, 1023, height, 0));
  for (int i = 1; i < width; i++) {
    int x1 = i;
    int y1 = int(map(float(valores[i]), 0, 1023, height, 0));
    line(x0, y0, x1, y1);
    x0 = x1;
    y0 = y1;
  }
}

//dibuja la rejilla
void pintaRejilla() {
  stroke(150, 150, 180);
  fill(150, 150, 180);
  strokeWeight(1);
  textSize(15);
  for(int i = 0; i<= height; i += height/5){
    line(0, i, width, i);
    text(str((height - i)/100) + " V.", 20, i - 10);
  }
}

 