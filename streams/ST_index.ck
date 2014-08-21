public class ST_index extends Stream {
    float table[];
    Stream @ indexer;
    "ST_index" @=> _type;
    
    
    fun void init(float _values[],Stream _indexer) {
        _values @=> table;
        table.size() => size;
        _indexer @=> indexer;
    }
    
    fun int safeIndex() {
        wrap(indexer.nextInt(),0,table.cap()) => int index;
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
        return table[safeIndex()];
    }
}  