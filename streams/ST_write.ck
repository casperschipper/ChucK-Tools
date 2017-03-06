public class ST_write extends Stream {
    float _table[];

    Stream st_index;
    Stream st_value;
  
    fun ST_write table(float arg[]) {
        arg @=> _table;
        arg.cap() => size;
        return this;
    }
    
    fun ST_write indexer(Stream arg) {
        arg @=> st_index;
        return this;
    }
    
    fun ST_write value(Stream arg) {
        arg @=> st_value;
        return this;
    }
    
    fun float next() {
        st_value.next() => float tmp;
        st_index.nextInt() => int idx;
        cs.safeTableIndex(idx,size) => idx;
        tmp => _table[idx];
        return tmp $ float;
    }
}

        
        
    