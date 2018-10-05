class CA1D
{
  int size;
  int scale;
  
  boolean [] grid;
  boolean [][][] rules;

  CA1D(int size, int rule)
  {
    this.size = size;
    this.scale = SCALE;
    this.grid = new boolean[size];   
    this.rules = new boolean[2][2][2];
    
    this.setRule(rule);
        
    if (RANDOM_RULES)
    {
      for (int x = 0; x < 2; x++)
      for (int y = 0; y < 2; y++)
      for (int z = 0; z < 2; z++)
      {
        rules[x][y][z] = (random(1) < 0.5) ? true : false;
      }
    }
    
    if (RANDOM_START)
    {
      this.initRand();
    }
    else
    {
      this.initCenter();
    }
  }
  
  void setRule(int rule)
  {
    for (int r = 0; r < 8; r++)
    {
      int x = ((r & 1) > 0) ? 1 : 0;
      int y = ((r & 2) > 0) ? 1 : 0;
      int z = ((r & 4) > 0) ? 1 : 0;
      int rpow = (int) Math.pow(2, r);
      int result = ((rule & rpow) > 0) ? 1 : 0;
      rules[x][y][z] = boolean(result);
    }
  }
  
  void initCenter()
  {
    this.grid[floor(size / 2)] = true;    
  }
  
  void initRand()
  {
    for (int x = 0; x < size; x++)
    {
      this.grid[x] = (random(1) < 0.05) ? true : false;
    }
  }
  
  boolean applyRule(boolean left, boolean centre, boolean right)
  {
    if (random(1) < NOISE_LEFT) left = !left;
    if (random(1) < NOISE_RIGHT) right = !right;
    
    return rules[int(left)][int(centre)][int(right)];
  }
  
  void step()
  {
    boolean next[] = new boolean[size];
    
    for (int x = 0; x < size; x++)
    {
      boolean left = grid[wrapx(x, -1)];
      boolean centre = grid[x];
      boolean right = grid[wrapx(x, 1)];
      boolean result = applyRule(left, centre, right);
      next[x] = result;
    }

    for (int x = 0; x < size; x++)
      arraycopy(next, grid);
  }
  
  int wrapx(int x, int offset)
  {
    x += offset;
    if (x < 0) return x + size;
    if (x >= size) return x - size;
    return x;
  }
  
  void draw()
  {
    translate(0, (frameCount - 1) * SCALE);
    stroke(128, 128, 128, 50);
    
    for (int x = 0; x < size; x++)
    {
      fill(grid[x] ? 255 : 0);
      rect(x * scale, 0, scale, scale);
    }
  }
  
  void drawCircle(int radius)
  {
    translate(width / 2, height / 2);
    noFill();
    rotate(PI / 2);
    
    for (int x = 0; x < size; x++)
    {
//      rotate(frameCount * 0.00002);
//            rotate(frameCount * random(0.00003));
//      strokeWeight(random(1.0));
      strokeWeight(0.5);
      stroke(grid[x] ? 255 : 0, 255);
      arc(0, 0, radius, radius, x * TWO_PI / size, (x + 1) * TWO_PI / size);
    }    
  }
}
