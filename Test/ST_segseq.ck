class ST_segseq extends Stream {
    ST_seg st_input;
    Stream st_min;
    Stream st_max;
    
    float min;
    float max;
    
    fun void init( ST_seg arg, Stream minArg, Stream maxArg ) {
        arg @=> this.input;
        minArg @=> this.st_min;
        maxArg @=> this.st_max;
    }
    
    fun int more() {
        return st_input.more();
    }
    
    fun float next() {
        if (!st_input.more()) {
            st_min.next() => this.min;
            st_max.next() => this.max;
        }
        return cs.scalef( st_input.next() , -1 , 1 , min , max );
    }
}w