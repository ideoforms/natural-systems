class Ant
{
  int x,
      y;
  int x_vel,
      y_vel;
  Grid grid;
  
  Ant(int x, int y, Grid grid)
  {
    this.x = x;
    this.y = y;
    this.x_vel = 1;
    this.y_vel = 0;
    this.grid = grid;
  }
  
  void move()
  {
    x += x_vel;
    y += y_vel;
    
    if (x < 0 || y < 0 || x >= grid.size || y >= grid.size)
    {
      return;
    }
    
    if (grid.cells[x][y] == true)
    {
      grid.cells[x][y] = false;
      int tmp = y_vel;
      y_vel = -x_vel;
      x_vel = tmp;
    }
    else
    {
      grid.cells[x][y] = true;
      int tmp = y_vel;
      y_vel = x_vel;
      x_vel = -tmp;
    }
  }
  
  void draw()
  {
    
    ellipse((x + 0.5) * CELL_SIZE, (y + 0.5) * CELL_SIZE, 0.5 * CELL_SIZE, 0.5 * CELL_SIZE);
    ellipse((x + (x_vel * 0.3) + 0.5) * CELL_SIZE, (y + (y_vel * 0.3) + 0.5) * CELL_SIZE, 0.3 * CELL_SIZE, 0.3 * CELL_SIZE);
    
    fill(255, 0, 50, 50);
    // rect(0, y * CELL_SIZE, width, CELL_SIZE);
  }
}

class Grid
{
  int size;
  boolean cells[][];
  
  Grid (int size)
  {
    this.size = size;
    this.cells = new boolean[size][size];
  }
  
  void draw()
  {
    for (int x = 0; x < size; x++)
    for (int y = 0; y < size; y++)
    {
      if (cells[x][y])
      {
        rect(x * CELL_SIZE, y * CELL_SIZE, CELL_SIZE, CELL_SIZE);
      }
    }    
  }
}
