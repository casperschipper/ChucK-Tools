public class ST_rewrite extends Stream {
    float _table[];
    
    Stream st_index;
    Stream st_value;
    Stream st_mix;
    
    fun ST_rewrite init(float arg[],Stream valueArg,Stream indexArg,Stream mixArg) {
        table(arg);
        value(valueArg);
        indexer(indexArg);
        return this;
    }
    
    fun ST_rewrite table(float arg[]) {
        arg @=> _table;
        arg.cap() => size;
        return this;
    }
    
    fun ST_rewrite indexer(Stream arg) {
        arg @=> st_index;
        return this;
    }
    
    fun ST_rewrite value(Stream arg) {
        arg @=> st_value;
        return this;
    }
    
    fun ST_rewrite mixArg(Stream arg) {
        arg @=> st_mix;
    }
    
    fun float next() {
        st_value.next() => float tmp;
        st_index.nextInt() => int idx;
        cs.safeTableIndex(idx,size) => idx;
        st_mix.next() => float mix;
        (tmp * mix) + ((1.0 - mix) * _table[idx]) => _table[idx];
        return tmp $ float;
    }
}



