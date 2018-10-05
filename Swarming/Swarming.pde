/*-------------------------------------------------------------------*
 *
 * Implementation of Reynolds Boids algorithm.
 *
 * Written by Daniel Jones (2006, 2018)
 *   <http://www.erase.net>
 *
 * This program can be freely distributed and modified under the
 * terms of the MIT License.
 *   <https://opensource.org/licenses/MIT> 
 *
 *-------------------------------------------------------------------*/

int AGENT_COUNT = 50;
float AGENT_SIZE = 3;
float WEIGHT_COHESION = 2.0;
float WEIGHT_SEPARATION = 1.0;
float WEIGHT_ALIGNMENT = 1.0;
float WEIGHT_BROWNIAN = 1.0;
float INERTIA = 0.97;
boolean NO_CLEAR = false;
float SEPARATION_DISTANCE = 10;

Swarm swarm;

void setup ()
{
  size(1300, 800);
  frameRate(40);
  smooth();
  
  swarm = new Swarm(AGENT_COUNT);
}

void draw ()
{
  if (!NO_CLEAR)
  {
    background(250);
  }
  swarm.move();
  swarm.draw();
}
