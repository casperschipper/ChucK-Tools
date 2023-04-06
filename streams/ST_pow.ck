public class ST_pow extends ST_operator 
{
    "ST_pow" @=> _type;
    
    fun float operator(float a,float b) {
        return Math.pow(a,b);
    }
}