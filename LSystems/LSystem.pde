class LSystem
{
  String axiom,
  string;
  String [] rules;
  String rule;
  float [] state;
  float [][] state_stack;
  int stack_size = 0;
  int pos = 0;
  color col;

  float angle = default_angle;
  float angle_chaos = default_angle_chaos;
  float extension = default_extension;
  float extension_chaos = default_extension_chaos;

  LSystem ()
  {
    axiom = "F";
    string = "F";

    state = new float[] { 0, 0, 0 };

    col = color(0, 0, 0);
    rule = default_rule;
    state_stack = new float[4096][3];
  }

  void iterate ()
  {
    this.iterate(1);
  }

  void iterate (int count)
  {
    for (int i = 0; i < count; i++)
    {
      String string_next = "";

      for (int j = 0; j < string.length(); j++)
      {
        char c = string.charAt(j);
        if (c == 'F')
        {
          string_next = string_next + rule;
        } 
        else {
          string_next = string_next + c;
        } 
      }
      string = string_next;
    } 
  }



  void draw()
  {
    translate(100, default_y_offset);
    rotate(1.5 * PI);
    strokeWeight(0.5);

    for (int i = 0; i < string.length(); i++)
    {
      this.drawSegment();
    }

    endRecord();
  }

  void drawSegment ()
  {
    if (pos >= string.length())
    { 
      return; 
    }

    char c = string.charAt(pos);
    switch (c)
    {
    case 'F':
      float ext_this = extension + random(-1.0 * extension * extension_chaos, extension * extension_chaos);
      float x_delta = ext_this * sin(state[2]);
      float y_delta = ext_this * cos(state[2]);

      stroke(col);
      strokeWeight(0.5);
      // stroke(random(255), random(255), random(255), 230);

      line(state[0], state[1], state[0] + x_delta, state[1] + y_delta);
      state[0] += x_delta;
      state[1] += y_delta;

      if (default_draw_tips)
      {
        strokeWeight(0.5);
        line(state[0], state[1], state[0] + 0.1, state[1] + 0.1);
      }

      break;
    case '-':
      state[2] -= (angle + random(-1 * angle * angle_chaos, angle * angle_chaos));
      break;
    case '+':
      state[2] += (angle + random(-1 * angle * angle_chaos, angle * angle_chaos));
      break;
    case '[':
      arraycopy(state, state_stack[stack_size++]);
      break;
    case ']':
      arraycopy(state_stack[--stack_size], state);
      break;
    }

    pos++;
  }
}
