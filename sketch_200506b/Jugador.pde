class Jugador {
  PVector posicion, velocidad;
  int ancho, alto, numeroJugador, puntos;
  
  Jugador(int numeroJugador_) {
    numeroJugador = numeroJugador_;
    ancho = 20; 
    alto = 100; 
    puntos = 0; 

    if(numeroJugador == 1) {
      posicion = new PVector(ancho/2, height/2);
    } else if(numeroJugador == 2) {
      posicion = new PVector(width - ancho/2, height/2);
    }
    
    velocidad = new PVector(0,3);
  }
  
  void mover() {
    if(numeroJugador == 1 && key == 'a') {
      posicion.sub(velocidad);
    } 
    else if(numeroJugador == 1 && key == 'b') {
      posicion.add(velocidad);
    }
    
    if(numeroJugador == 2 && keyCode == UP) {
      posicion.sub(velocidad);
    } 
    else if(numeroJugador == 2 && keyCode == DOWN) {
      //DOWN(flecha abajo)
      posicion.add(velocidad);
    }

    posicion.y = constrain(posicion.y,alto/2,height - alto/2);
  }

  void mostrar() {
    fill(0);
    noStroke();
    rectMode(CENTER);
    rect(posicion.x, posicion.y, ancho, alto);
  }
  
  PVector getPosicion() {
    return posicion;
  }
  
  void setPuntos(int puntos_) {
    puntos += puntos_;
  }
  
  int getPuntos() {
    return puntos;
  }
}
