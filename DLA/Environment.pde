class DLAEnvironment
{
  int w;
  int h;
  boolean grid[][];
  Particle particles[];
  
  DLAEnvironment(int width, int height, int num_particles)
  {
    this.w = width;
    this.h = height;
    this.grid = new boolean[this.w][this.h];
    this.particles = new Particle[num_particles];
    
    this.grid[this.w / 2][this.h / 2] = true;
    
    for (int i = 0; i < num_particles; i++)
    {
      particles[i] = new Particle(this);
    }
  }
  
  void update()
  {
    for (Particle particle : particles)
    {
      particle.move();
      if (particle.has_neighbours())
      {
        this.grid[particle.x][particle.y] = true;

        if (particle.x == 0 ||
            particle.y == 0 ||
            particle.x == this.w - 1 ||
            particle.y == this.h - 1)
         {
           noLoop();
         }

        particle.reinit();
        
      }
    }
  }
  
  void draw()
  {
    stroke(255, 50);
    for (Particle particle : particles)
    {
      particle.draw();
    }
    
    stroke(AGGREGATE_COLOR);
    for (int x = 0; x < this.w; x++)
    for (int y = 0; y < this.h; y++)
    {
      if (this.grid[x][y])
      {
        point(x, y);
      }
    }
  }
}
