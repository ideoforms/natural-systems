/*-----------------------------------------------------------*
 * Swarm class: contains a whole collection of agents.
 *-----------------------------------------------------------*/
 
class Swarm
{
  Atom[] atoms;      // array of agents
  PVector meanPos;   // stores the average position of all agents
  PVector meanVel;   // stores the average velocity of all agents

  Swarm(int size)
  {
    atoms = new Atom[size];
    for (int i = 0; i < atoms.length; i++)
    {
      atoms[i] = new Atom(); 
    }
    
    meanPos = new PVector(0, 0);
    meanVel = new PVector(0, 0);
  }

  void calculateNorms ()
  {
    // calculate the average position and velocity,
    // used for cohesion and alignment rules.
    meanPos.set(0, 0, 0);
    meanVel.set(0, 0, 0);
    
    // 1. sum values.
    for (int i = 0; i < atoms.length; i++)
    {
      meanPos.add(atoms[i].pos);
      meanVel.add(atoms[i].vel);
    }

    // 2. divide by number of agents.
    meanPos.div(atoms.length);
    meanVel.div(atoms.length);
  }

  void move ()
  {
    this.calculateNorms();

    for (int i = 0; i < atoms.length; i++)
      atoms[i].move(this);
  }

  void draw ()
  {
    for (int i = 0; i < atoms.length; i++)
      atoms[i].draw();
  }  
}
