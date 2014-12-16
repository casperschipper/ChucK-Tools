public class ST_sub extends ST_operator 
{
    "ST_sub" @=> _type;
    
    fun float operator(float a,float b) {
        return a - b;
    }
}