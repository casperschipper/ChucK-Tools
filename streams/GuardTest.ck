/*
 * A guard that has a test inside, 
 * The test is also an operator.
 * The walk first applies the test, if true, it applies the funktor to its inner value.
 * This way you can look before you leap.
 */
public class GuardTest extends Guard { 
    ST_operator st_test;
    
    fun Guard init(ST_operator arg,ST_operator funktorArg) { 
        arg @=> st_test;
        funktorArg @=> st_funktor;
        return this $ Guard;
    }
    
    fun int test(float in) {
        return (st_test.nextCurry(in) != 0);
    }
    
    fun float apply(float in) {
        // if test is true, apply funktor
        return st_funktor.nextCurry(in);
    }
}
