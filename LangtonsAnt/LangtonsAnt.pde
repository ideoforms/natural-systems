/*-------------------------------------------------------------------*
 *
 * LangtonsAnt: Langton's Ant, a 2D Turing machine.
 *
 * Written by Daniel Jones (2009, 2018)
 *   <http://www.erase.net>
 *
 * This program can be freely distributed and modified under the
 * terms of the MIT License.
 *   <https://opensource.org/licenses/MIT> 
 *
 *-------------------------------------------------------------------*/

/*--------------------------------------------------------------------------------
 * Width of the grid, in cells.
 *-------------------------------------------------------------------------------*/
int GRID_WIDTH = 100;

/*--------------------------------------------------------------------------------
 * Frame rate (frames per second)
 *-------------------------------------------------------------------------------*/
int FRAME_RATE = 50;

/*--------------------------------------------------------------------------------
 * Cell size. (This is automatically generated.)
 *-------------------------------------------------------------------------------*/
int CELL_SIZE;

final boolean ON = true;
final boolean OFF = false;

Grid grid;
Ant ant;

void setup()
{
  size(800, 800);
  CELL_SIZE = width / GRID_WIDTH;
  smooth();
  frameRate(FRAME_RATE);
  
  grid = new Grid(GRID_WIDTH);
  ant = new Ant(GRID_WIDTH / 2, GRID_WIDTH / 2, grid);
}

void draw()
{
  background(255);
  noStroke();
  
  ant.move();
  ant.move();
  ant.move();
  ant.move();
  ant.move();
  ant.move();
  ant.move();
  ant.move();

  fill(0);
  grid.draw();
  
  fill(200, 50, 0);
  ant.draw();
}
