/** 
 * Guards are for use in guarded walks
 * They work similar to guards in haskell
 * All guards have a funktor, which is just an operator with one value already filled in.
 * This guard is the default, when it is encountered its test is always true.
 */
public class Guard {
    // default is always.
    ST_operator st_funktor;
    
    fun Guard funktor(ST_operator arg) {
        arg @=> st_funktor;
        return this;
    }
    
    fun Guard init(ST_operator funktorArg) { 
        funktorArg @=> st_funktor;
        return this;
    }
    
    fun int test(float in) {
        // returns true always;
        return 1;
    }
    
    fun float apply(float in) {
        // if test is true, apply funktor
        return st_funktor.nextCurry(in);
    }
}
