public class Toggle {
    1 => int state;
    
    fun int toggle() {
        state * -1 => state;
    }
    
    fun void on() {
        1 => state;
    }
    
    fun void off() {
        -1 => state;
    }
    
    fun int report() {
        return state;
    }
}