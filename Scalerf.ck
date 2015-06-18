public class Scalerf
{
    0. => float offset;
    1. => float range;
    1. => float outrange;
    0. => float outoffset;
    1. => float power;
    
    fun float scale(float value)
    { return (((value - offset) / range) * outrange) + outoffset; }
    
    fun float scale(float value)
    { return  ( Math.pow(((value - offset) / range), power ) * outrange) + outoffset; }
    
    fun void set(float a,float b,float c,float d,float p)
    {
        Math.min(a,b) => offset;
        Std.fabs(a-b) => range;
        Math.min(c,d) => outoffset;
        Std.fabs(c-d) => outrange;
        p => power;
    }
    
    fun void setIn(float a,float b)
    {
        Math.min(a,b) => offset;
        Std.fabs(a-b) => range;
    }
    
    fun void setOut(float c,float d)
    {
        Math.min(c,d) => outoffset;
        Std.fabs(c-d) => outrange;
    }
    
    fun void setPower(float p)
    {
       p => power;
    }
}