class Rocket {
  //describe var
  PVector locationRocket;
  PImage raketIjsje;
  
//constructur + define var
  Rocket(PVector location) {
    raketIjsje = loadImage("raket-ijs-icecream-the-dad.png");
    locationRocket = location.copy();
  }

//display rocket
  void display() {
    imageMode(CENTER);
    image(raketIjsje, locationRocket.x, locationRocket.y-100, 200, 479 );
    move();
  }
  
  //define direction of the rocket
  void move() {
    locationRocket.add(0,-0.3); 
  }
}
