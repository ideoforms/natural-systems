/*-------------------------------------------------------------------*
 * An empty sketch which creates the basic animation loop.
 *-------------------------------------------------------------------*/
 
void setup()
{
  size(800, 600);
  background(0, 0, 0);
  stroke(255, 255, 255);
  frameRate(200);
  noFill();
}

void draw()
{
  strokeWeight(1);
  ellipse(400, 300, 100, 100);
}
