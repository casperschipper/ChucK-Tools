public class ST_index extends Stream {
    float table[];
    null @=> Stream @ st_table[];
    
    null @=> Stream @ indexer;
    
    
    "ST_index" @=> _type;
    
    fun static ST_index make(float _values[], Stream _indexer) {
        ST_index stream;
        stream.init(_values,_indexer);
        return stream;
    }
    
    fun static ST_index make(int _values[], Stream _indexer) {
        ST_index stream;
        stream.init(_values,_indexer);
        return stream;
    }
    
    
    fun static ST_index make(Stream _values[], Stream _indexer) {
        ST_index stream;
        stream.init(_values,_indexer);
        return stream;
    }    
    
    fun ST_index init(float _values[],Stream _indexer) {
        _values @=> table;
        null @=> st_table;
        table.size() => size;
        _indexer @=> indexer;
        return this;
    }
    
    fun ST_index init(Stream _values[],Stream _indexer) {
        _values @=> st_table;
        st_table.size() => size;
        _indexer @=> indexer;
        return this;
    }
    
    
    fun ST_index init(int _values[],Stream _indexer) {
        cs.int2float(_values) @=> table;
        null @=> st_table;
        table.size() => size;
        _indexer @=> indexer;
        return this;
    }

    
    fun int safeIndex() {
        wrap(indexer.nextInt(),0,size-1) => int index;
        return index;
    }
    
    fun int wrap(int x,int low, int high) {
        Math.abs(high - low + 1) => int range;
        ((x-low) % range) => x;
        if (x<0)
            return high + 1 + x;
        else 
            return low + x;
    }
    
    fun float next() {
        if (st_table != null) {
            if (st_table[index].more()) {
                return st_table[index].next();
            }
            return st_table[safeIndex()].next();
        }
        
        return table[safeIndex()];
    }
}  