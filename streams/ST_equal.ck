public class ST_equal extends ST_operator {
    fun float operator(float a,float b) {
        Math.floor(a) $ int => int A;
        Math.floor(b) $ int => int B;
        return (A == B) $ float;
    }
}