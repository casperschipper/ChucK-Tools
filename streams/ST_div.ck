public class ST_div extends ST_operator 
{
    "ST_div" @=> _type;
    
    fun float operator(float a,float b) {
        if (b == 0) {
            return a;
        }
    	return a / b;
    }
}