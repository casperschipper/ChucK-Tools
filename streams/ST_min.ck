public class ST_min extends ST_operator {
    "ST_min" @=> _type;
    
    fun float operator(float a,float b) {
        Math.min(a,b);
    }
}