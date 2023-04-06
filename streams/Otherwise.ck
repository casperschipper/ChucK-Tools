/** 
 * A default guard, but with a stream as value.
 * This provides more flexibility: one can construct complex streams from the old value and other values.
 * The name is taken from Haskell
 */
public class Otherwise extends Guard {
    // default is always.
    Stream value;
    
    fun Guard init(Stream valueArg) { 
        valueArg @=> value;
        return this $ Guard;
    }
    
    fun int test(float in) {
        // returns true always;
        return 1;
    }
    
    fun float apply(float in) {
        // if test is true, apply funktor
        return value.next();
    }
}
