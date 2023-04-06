public class ST_writeHead extends ST_write {
    Stream st_recordOn;
    
    fun void recordOn (Stream recordOn) {
        recordOn @=> this.st_recordOn;
    }

    fun float next() {
        st_value.next() => float tmp;
        if (! (st_recordOn.next() > 0.0)) {
            return tmp;
        } 
        st_index.nextInt() => int idx;
        cs.safeTableIndex(idx,size) => idx;
        tmp => _table[idx];
        return tmp $ float;
    }
}




