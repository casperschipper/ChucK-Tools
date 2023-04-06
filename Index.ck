public class Index
{
    int idx;
    int min;
    int max;
    
    fun void set(int _min,int _max,int _initial) {
        _min => min;
        _max => max;
        _initial => idx;
    }
    
    fun void set(int _min,int _max) {
        set(_min,_max,_min);
    }
    
    fun void set(int _max) {
        set(0,_max,0);
    }
    
    fun int next() {
        idx => int value;
        idx + 1 => idx;
        if (idx > max) min => idx;
        return value;
    }
}