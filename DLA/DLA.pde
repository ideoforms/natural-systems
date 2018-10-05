/*--------------------------------------------------------------------------------
 * DLA: Diffusion Limited Aggregation.
 * From research: Witten & Sander (1983)
 *
 * Written by Daniel Jones (2018)
 *   <http://www.erase.net>
 *
 * This program can be freely distributed and modified under the
 * terms of the MIT License.
 *   <https://opensource.org/licenses/MIT>
 *
 *-------------------------------------------------------------------------------*/

/*--------------------------------------------------------------------------------
 * Determines how likely a particle is to aggregate on each side.
 *-------------------------------------------------------------------------------*/
float STICKINESS_LEFT = 1.0;
float STICKINESS_RIGHT = 1.0;
float STICKINESS_TOP = 1.0;
float STICKINESS_BOTTOM = 1.0;

/*--------------------------------------------------------------------------------
 * Number of particles to create.
 *-------------------------------------------------------------------------------*/
int PARTICLES = 1000;

/*--------------------------------------------------------------------------------
 * Number of simuation steps to iterate each frame.
 *-------------------------------------------------------------------------------*/
int STEPS_PER_FRAME = 10;

/*--------------------------------------------------------------------------------
 * Visual scaling factor.
 *-------------------------------------------------------------------------------*/
int SCALE = 4;

/*--------------------------------------------------------------------------------
 * Background colour (R, G, B)
 *-------------------------------------------------------------------------------*/
color BACKGROUND_COLOR = color(0, 50, 80);

/*--------------------------------------------------------------------------------
 * Aggregate colour
 *-------------------------------------------------------------------------------*/
color AGGREGATE_COLOR = color(255, 200, 200);

DLAEnvironment dla;

void setup()
{
  size(1200, 600);
  frameRate(50);
  dla = new DLAEnvironment(width / SCALE, height / SCALE, PARTICLES);
  
}

void draw()
{
  background(BACKGROUND_COLOR);
  
  for (int i = 0; i < STEPS_PER_FRAME; i++)
  {
    dla.update();
  }
  
  if (mousePressed)
  {
    dla.grid[mouseX / SCALE][mouseY / SCALE] = true;
  }
    
  scale(SCALE);
  dla.draw();
}
