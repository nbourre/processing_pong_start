int xPalette = 25;
int yPalette = 0;
int hauteurPalette = 75;
int largeurPalette = 15;
int vitesse = 5;

int xBalle = 400;
int yBalle = 300;
int vitXBalle = 2 * vitesse;
int vitYBalle = 2 * vitesse;

void setup () {
  size (800, 600);
  xBalle = width / 2;
  yBalle = height / 2;
}



void draw () {
  background (0);
  if (keyPressed) {
    gestionTouches();
  }
  
  // Gestion de la position X
  if (xBalle > xPalette && xBalle < (xPalette + largeurPalette) &&
      yBalle + 10 > yPalette && yBalle < yPalette + hauteurPalette ) {
      vitXBalle = -vitXBalle;
  }
  else {
    if ((xBalle + 10) > width || xBalle < 0) {
      vitXBalle = -vitXBalle;
      
      if (xBalle < 0) {
        xBalle = width / 2;
      }
    }
  } 
    
  if (yBalle < 0 || yBalle + 10 > height) {
    vitYBalle = -vitYBalle;
  } 
  
  xBalle = xBalle + vitXBalle;
  yBalle = yBalle + vitYBalle;
  
  // Palette
  rect (xPalette, yPalette, largeurPalette, hauteurPalette);
  
  // Balle
  rect (xBalle, yBalle, 10, 10);
}

void gestionTouches() {
  if (key == CODED) {
    
    if (keyCode == DOWN) {
      if ((yPalette + hauteurPalette) < height) {
        yPalette = yPalette + vitesse;
      } 
    }
    
    if (keyCode == UP) {
      if (yPalette > 0) {
        yPalette = yPalette - vitesse;
      }
    }
  }
}
