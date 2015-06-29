public class Walk
{
    int steparray[];
    int step;
    int previous;
    int lowbound;
    int highbound;
    
    Random random;
    
    fun void init(int start,int low,int high) {
        start => previous;
        low => lowbound;
        high => highbound;
    }
    
    fun int next()
    {
        int next;
        findstep() => int nextstep;
        previous + findstep() => next;
        if (next > highbound)    
        { return previous - Std.abs(nextstep) => previous; }
        else if (next < lowbound)
        { return previous + Std.abs(nextstep) => previous; }
        else 
        { return previous + nextstep => previous; }
    }
    
    fun int findstep()
    { return random.choice(steparray); }
    
    fun void set(int value)
    { value => previous; }
    
    fun int get()
    { return previous; }
}


    