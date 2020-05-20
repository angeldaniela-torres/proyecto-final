class Pelota {
  PVector posicion, velocidad;
  int anchoJugador, altoJugador;
  
  Pelota(int direccion) {
    anchoJugador = 20;
    altoJugador = 100;
    
    posicion = new PVector(width/2, height/2);
    velocidad = new PVector(direccion*random(3,4), random(3,4));
  }
  
  void mover() {
    posicion.add(velocidad);
  }
  
  void display() {
    fill(255);
    noStroke();
    ellipse(posicion.x, posicion.y, 20,20);
    imageMode(CENTER);
    image(ball,posicion.x,posicion.y);
  }
  void validarReboteJugador1(PVector posicionJugador) {
    float min = posicionJugador.y - altoJugador/2;
    float max = posicionJugador.y + altoJugador/2;
    if(posicion.x < anchoJugador && posicion.y > min && posicion.y < max) {
      velocidad.x *= -1;
    }
  }
  
  void validarReboteJugador2(PVector posicionJugador) {
    float min = posicionJugador.y - altoJugador/2;
    float max = posicionJugador.y + altoJugador/2;
    
    //al tocar con el rectangulo esta pelota rebotara en el
    if(posicion.x > width - anchoJugador && posicion.y > min && posicion.y < max) {
      velocidad.x *= -1;
    }
  }
  
  void validarReboteParedes() {
    if(posicion.y > height) {
      velocidad.y *= -1;
    } else if(posicion.y < 0) {
      velocidad.y *= -1;
    }
  }
  
  PVector getPosicion() {
    return posicion;
  }
}
