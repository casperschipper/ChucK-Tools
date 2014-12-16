public class ST_mup extends ST_operator 
{
    "ST_mup" @=> _type;
    
    fun float operator(float a,float b) {
        return a * b;
    }
}