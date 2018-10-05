class Particle
{
  DLAEnvironment dla;
  int x;
  int y;
  
  Particle(DLAEnvironment dla)
  {
    this.dla = dla;
    this.reinit();
  }
  
  void reinit()
  {
    this.x = int(random(dla.w));
    this.y = int(random(dla.h));
  }
  
  void move()
  {
    int direction = int(random(4));
    switch (direction)
    {
      case 0: this.x -= 1; break;
      case 1: this.x += 1; break;
      case 2: this.y -= 1; break;
      case 3: this.y += 1; break;
    }
    if (x < 0) x = dla.w - 1;
    if (x >= dla.w) x = 0;
    if (y < 0) y = dla.h - 1;
    if (y >= dla.h) y = 0;
  }
  
  boolean has_neighbours()
  {
    if ((x > 0 && dla.grid[this.x - 1][this.y] && random(0, 1) < STICKINESS_RIGHT) ||
        (x < dla.w - 1 && dla.grid[this.x + 1][this.y] && random(0, 1) < STICKINESS_LEFT) ||
        (y > 0 && dla.grid[this.x][this.y - 1] && random(0, 1) < STICKINESS_BOTTOM) ||
        (y < dla.h - 1 && dla.grid[this.x][this.y + 1] && random(0, 1) < STICKINESS_TOP))
    {
        return true;
    }
    else
    {
      return false;
    }
  }
  
  void draw()
  {
    point(this.x, this.y);
  }
}
