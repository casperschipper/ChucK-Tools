public class ST_sum extends ST_operator 
{
    "ST_sum" @=> _type;
    
    fun float operator(float a,float b) {
        return a + b;
    }
}