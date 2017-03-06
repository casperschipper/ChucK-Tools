Stream ST_if extends Stream {
    "ST_if" @=> _type;
    /* this will return next value of then stream if test is not zero */
    
    Stream @ st_test;
    Stream @ st_then;
    Stream @ st_else;
    
    fun ST_if init( Stream testArg, Stream thenArg, Stream elseArg ) {
        testArg @=> st_test;
        thenArg @=> st_then;
        elseArg @=> st_else;
        return this;
    }
    
    fun float next() {
        if (st_test.next() != 0) {
            return st_then.next();
        } 
        return st_else.next();
    }
}