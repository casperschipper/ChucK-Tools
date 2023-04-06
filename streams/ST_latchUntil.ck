class ST_latchUntil extends Stream {
    Stream @ input;
    ST_operator @ test;
    
    float nxt;
    false => _more;
      
    fun ST_latchUntil init( Stream inputArg, ST_operator testArg ) {
        inputArg @=> this.input;
        testArg @=> this.test;
        return this;
    }
    
    fun float next() {
        nxt => float tmp;
        input.next() => nxt;
        test.nextCurry(in) != 0 => _more;
        return tmp;
    }
    
    fun int more() {
        return _more;
    }
}
 

        
