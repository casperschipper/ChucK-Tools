public class ST_overwrite extends ST_operator {
    "ST_overwrite" @=> _type;
    
    fun float operator(float a,float b) {
        return b;
    }
}