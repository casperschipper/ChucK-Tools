// a class that does 
// input - (input % divisor);
public class ST_mod extends ST_operator {
    fun float operator(float a,float b) {
        return a - (a % b);
    }
}
