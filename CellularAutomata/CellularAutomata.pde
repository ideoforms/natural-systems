/*-------------------------------------------------------------------*
 *
 * Implementation of 1-dimensional cellular automata.
 *
 * Written by Daniel Jones (2008, 2018)
 *   <http://www.erase.net>
 *
 * This program can be freely distributed and modified under the
 * terms of the MIT License.
 *   <https://opensource.org/licenses/MIT> 
 *
 *-------------------------------------------------------------------*/
 
int SCALE = 1;

boolean RANDOM_START = false;
boolean RANDOM_RULES = false;
float NOISE_LEFT = 0.0;
float NOISE_RIGHT = 0.0;

CA1D ca;

void setup()
{
  size(600, 800);
  background(10);
  frameRate(45);
  
  ca = new CA1D(width / SCALE, 110);
}

void draw()
{
  ca.step(); 
  ca.draw();
}

void keyPressed()
{
  if (key == 's')
    saveFrame("growth-" + random(9000) + 1000);
}
