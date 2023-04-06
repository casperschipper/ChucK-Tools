public class ST_couple extends Stream {
    /* This is useful for procedures.
    it allows you to sync the update of b with a.
    the value for a is returned */
    Stream _a;
    Stream _b;
    
    fun ST_couple init(Stream arg,Stream arg2) {
        arg @=> _a;
        arg2 @=> _b;
        return this;
    }
    
    fun float next() {
        _b.next();
        return _a.next();
    }
}
    
    