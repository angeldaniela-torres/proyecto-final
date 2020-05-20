Jugador jugador1, jugador2;
Pelota pelota;
boolean ganador;
int puntajeMaximo;
PFont font;
PImage ball;
PImage mesa;

void setup() {
  size(600,400);
  mesa = loadImage("mesa.jpg");
  mesa.resize(650,400);
  ball = loadImage("ball.png");
  ball.resize(20,20);
  //fuente
  font = loadFont("juego.vlw");
  textFont(font);
  
  jugador1 = new Jugador(1);
  jugador2 = new Jugador(2); 
  pelota = new Pelota(1); 
  
  ganador = false; 
  
  puntajeMaximo = 3; 
}

void draw() {
  background(0);
  imageMode(CENTER);
  image(mesa, 300, 200);
  textSize(20);
   text("Jugador 1.", 80, 35);
     textSize(15);
   text("Presiona a-arriba y b-abajo", 30, 20);
   textSize(20);
   text("Jugador 2.", 400, 35);
     textSize(15);
    text("Presiona flecha arriba y flecha abajo", 360, 20);
     textSize(15);
    text("Hacer click sobre la linea de la mitad para comenzar a moverte", 105, 380);
    textSize(30);
  text(jugador1.getPuntos(), width/2 - 60, 40);
  text(jugador2.getPuntos(), width/2 + 30, 40);
  if(ganador == false) {
    strokeWeight(2);
    stroke(255);
    
    for(int y = 0; y < height; y+= 10) {
      line(width/2,y,width/2,y+5);
    }
    
    pelota.display();
    pelota.mover();
  }
  
  jugador1.mostrar();
  jugador1.mover();
  pelota.validarReboteJugador1(jugador1.getPosicion());
  
  jugador2.mostrar();
  jugador2.mover();
  pelota.validarReboteJugador2(jugador2.getPosicion());
  
  pelota.validarReboteParedes();
  validarPuntos();
  validarGanador();
}

void validarPuntos() {
  PVector posicionPelota = pelota.getPosicion();
  if(posicionPelota.x > width && jugador1.getPuntos() <= puntajeMaximo) {
    jugador1.setPuntos(1);
    pelota = new Pelota(-1);
  } 
  else if(posicionPelota.x < 0 && jugador2.getPuntos() <= puntajeMaximo) { 
    jugador2.setPuntos(1);
    pelota = new Pelota(1);
  }
  else if (keyPressed && ganador == true) {
    setup();
  }
}

void validarGanador() {
  if(jugador1.getPuntos() == puntajeMaximo) {
    text("Jugador 1 ha ganado.", 150, height/2);
    textSize(20);
    text("Presione cualquier tecla para volver a jugar", 95, height/2 + 30);
    ganador = true;
  } else if(jugador2.getPuntos() == puntajeMaximo) {
    text("Jugador 2 ha ganado.", 150, height/2);
    textSize(20);
    text("Presione cualquier tecla para volver a jugar", 95, height/2 + 30);
    ganador = true;
  }
}
