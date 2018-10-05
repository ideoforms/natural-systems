/*-----------------------------------------------------------*
 * Some global configuration variables.
 *-----------------------------------------------------------*/
float max_speed      = 20,
      sep_threshold  = SEPARATION_DISTANCE,
      inertia        = INERTIA;

/*-----------------------------------------------------------*
 * Atom class: represents an agent in our swarm.
 *-----------------------------------------------------------*/
 
class Atom
{
  PVector pos = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  
  float   w_cohesion    = WEIGHT_COHESION,
          w_separation  = WEIGHT_SEPARATION,
          w_alignment   = WEIGHT_ALIGNMENT,
          
          w_cursor      = 1,
          w_centre      = 1,
          w_brownian    = WEIGHT_BROWNIAN;
  
  Atom()
  {
    pos.x = random(width);
    pos.y = random(height);
    this.randomize();
  }

  void move(Swarm swarm)
  {
    /*-----------------------------------------------------------*
     * Slow down according to inertia value
     * (similar to friction)
     *-----------------------------------------------------------*/
    vel.mult(inertia);
    
    /*-----------------------------------------------------------*
     * Now go through each rule we are following, adding 
     * the output vector of each to our velocity....
     *-----------------------------------------------------------*/
  
    /*-----------------------------------------------------------*
     * #1: Cohesion. Tend towards centre of swarm.
     *-----------------------------------------------------------*/
    PVector diffPos = PVector.sub(swarm.meanPos, pos);
    vel.add(PVector.mult(diffPos, w_cohesion / 500.0));
        
    /*-----------------------------------------------------------*
     * #2: Alignment. Follow the direction of others.
     *-----------------------------------------------------------*/
    PVector diffVel = PVector.sub(swarm.meanVel, vel);
    vel.add(PVector.mult(diffVel, w_alignment / 24.0));
    
    /*-----------------------------------------------------------*
     * #3: Separation. Avoid collisions with those nearby.
     *-----------------------------------------------------------*/
    for (int i = 0; i < swarm.atoms.length; i++)
    {
      float distance;
      
      if (swarm.atoms[i] == this)
        continue;
      
      distance = this.pos.dist(swarm.atoms[i].pos);
      if (distance < sep_threshold)
      {
        PVector diffSep = PVector.sub(swarm.atoms[i].pos, this.pos);
        vel.sub(PVector.mult(diffSep, w_separation / 6.0));        
      }
    }
    
    /*-----------------------------------------------------------*
     * #4: Centre. Don't go off-screen.
     *-----------------------------------------------------------*/
    vel.x += w_centre * ((width / 2) - pos.x) / width;
    vel.y += w_centre * ((height / 2) - pos.y) / height;     

    /*-----------------------------------------------------------*
     * #5: Brownian motion. Add some randomness to movement.
     *-----------------------------------------------------------*/
    if (random(1.0) < 0.02)
    {
        vel.x += w_brownian * (random(20.0) - 10);
        vel.y += w_brownian * (random(20.0) - 10);
    }
    
    /*-----------------------------------------------------------*
     * #6: Cursor. Follow mouse when it is pressed.
     *-----------------------------------------------------------*/
    if (mousePressed)
    {
      vel.x += w_cursor * (mouseX - this.pos.x) / 200;
      vel.y += w_cursor * (mouseY - this.pos.y) / 200;
    };
    
    /*-----------------------------------------------------------*
     * Finally, stay within the maximum speed limit.
     *-----------------------------------------------------------*/    
    float speed = vel.mag();
    if (speed > max_speed)
    {
      vel.mult(max_speed / speed);
    }
    
    /*-----------------------------------------------------------*
     * Now actually move, by adding this velocity to our
     * position.
     *-----------------------------------------------------------*/
    pos.add(vel);
  }
  
  void draw()
  {
    /*-----------------------------------------------------------*
     * draw head
     *-----------------------------------------------------------*/
    noFill();
    stroke(0, 0, 0, 250);
    ellipse(pos.x, pos.y, AGENT_SIZE, AGENT_SIZE);

    /*-----------------------------------------------------------*
     * draw tail
     *-----------------------------------------------------------*/
    stroke(0, 0, 0, 150);
    line(pos.x, pos.y, pos.x - vel.x * 0.3, pos.y - vel.y * 0.3);
    stroke(0, 0, 0, 100);
    line(pos.x, pos.y, pos.x - vel.x * 0.5, pos.y - vel.y * 0.5);
  }
  
  
  void randomize()
  {
    w_cohesion    = random(0.1, 2.0);
    w_separation  = random(0.1, 2.0);
    w_alignment   = random(0.1, 2.0);
    w_cursor      = random(0.1, 2.0);
    w_centre      = random(0.1, 2.0);
    w_brownian    = random(0.1, 2.0);
  }  
}
