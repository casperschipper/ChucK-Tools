// a class that does 
// input - (input % divisor);
public class ST_q extends ST_operator {
    fun float operator(float a,float b) {
        if (b == 0) return a;
        return a - (a % b);
    }
}
