public class Line 
{
    float delta;
    float last;
    
    fun void init(float a,float b,int steps) {
        (b-a)/steps => delta;
        a => last;
    }
    
    fun float next()
    {
        last => float temp;
        last + delta => last;
        return temp;
    }
}
        