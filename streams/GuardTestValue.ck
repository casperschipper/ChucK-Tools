public class GuardTestValue extends Guard { 
    ST_operator st_test;
    Stream st_value;
    
    fun Guard init(ST_operator arg,Stream value) { 
        arg @=> st_test;
        value @=> st_value;
        return this $ Guard;
    }
    
    fun int test(float in) {
        return (st_test.nextCurry(in) > 0);
    }
    
    fun float apply(float in) {
        // if test is true, apply value, ignore in.
        return st_value.next();
    }
}