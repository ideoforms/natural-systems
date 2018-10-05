/*-------------------------------------------------------------------*
 *
 * LSystems: Implementation of Lindenmayer systems
 * Emulates plant growth via a simple formal grammar.
 *
 * Written by Daniel Jones (2007, 2018)
 *   <http://www.erase.net>
 *
 * This program can be freely distributed and modified under the
 * terms of the MIT License.
 *   <https://opensource.org/licenses/MIT> 
 *
 *-------------------------------------------------------------------*/
 
String default_rule = "F[+F]F[-F]";

int    default_iterations = 1;
float  default_angle = PI / 8;
float  default_angle_chaos = 0.0;
float  default_extension = 30;
float  default_extension_chaos = 0.0;

int     default_y_offset = 400;
boolean default_draw_tips = true;

LSystem system;


void setup ()
{
  int iterations = default_iterations;

  size(1300, 900);
  background(250);
  frameRate(50);
  smooth();
  system = new LSystem();
  system.iterate(iterations);

  system.draw();
}

void _draw ()
{
  // To draw segment by segment, rename this routine to draw()
  // and remove system.draw() from setup().
  translate(100, default_y_offset);
  rotate(1.5 * PI);

  system.draw();
  for (int i = 0; i < random(10, 50); i++)
  {
    system.drawSegment();
  }
}
