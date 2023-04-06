public class ST_writeover extends Stream {
    float _table[];

    Stream st_index;
    Stream st_value;
    Stream st_mix; // balance between input and old signal. 0.5 is exactly balanced
    Stream st_offset;
    
    float out, previousX;
    
    fun ST_writeover init(float arg[],Stream valueArg,Stream indexArg, Stream mixArg, Stream offArg) {
        table(arg);
        value(valueArg);
        indexer(indexArg);
        mix(mixArg);
        offset(offArg);
        return this;
    }
  
    fun ST_writeover mix(Stream arg) {
        arg @=> st_mix;
        return this;
    }

    fun ST_writeover table(float arg[]) {
        arg @=> _table;
        arg.cap() => size;
        return this;
    }
    
    fun ST_writeover indexer(Stream arg) {
        arg @=> st_index;
        return this;
    }
    
    fun ST_writeover value(Stream arg) {
        arg @=> st_value;
        return this;
    }
    
    fun ST_writeover offset(Stream arg) {
        arg @=> st_offset;
        return this;
    }
    
    fun float next() {
        st_value.next() => float tmp;
        st_index.nextInt() => int idx;
        cs.safeTableIndex(idx,size) => idx;
        cs.clipf(st_mix.next(),0.0,1.0) => float currentMix;
        st_offset.next() => float off;
        
        _table[idx] => float xIn;
        
        xIn - previousX + (0.999 * out) => out;
        xIn => previousX;
        
        (tmp * (off+currentMix)) + ((1.0 - currentMix + off) * out) => _table[idx];
        return _table[idx];
    }
}

        
        
    