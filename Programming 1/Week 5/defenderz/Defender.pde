class Defender {

  final int x=30; //stays on the same side

  int y;


  Defender(int y) {

    this.y=y;

  }


  void render() {

    fill(0, 0, 200);

    rect(x, y, 20, 10); //draw top box

    fill(255, 0, 0); //draw rocket

    rect(x, y+10, 50, 20);

    triangle(x+50, y+10, x+50, y+30, x+60, y+20);

  }
  

}
