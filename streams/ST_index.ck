public class ST_index extends Stream {
    float table[];
    null @=> Stream @ st_table[];
    
    null @=> Stream @ indexer;
    
    false => int _holdMode; 
    false => int _more;   
    
    "ST_index" @=> _type;
    
    fun ST_index holdMode(int arg) {
        arg => _holdMode;
        arg => _more;
        return this;
    }
    
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
        indexer.more() => _more;
        
        indexer.nextInt() => index;
        if (index < 0) {
            -1 * index => index;
        }
        if(st_table != null) {            
            return index % st_table.cap();
        } 
        return index % table.cap();
    }
    
    fun float next() {
        if (st_table != null) {
            if (st_table[index].more()) {
                true => _more;
                return st_table[index].next();
            }
            false => _more;
            safeIndex() => index;
            return st_table[index].next();
        } 
        return table[safeIndex()];
    }
    
    fun int more() {
        if (_more) {
            return true;
        } 
        true => _more;
        return false;
    }        
    
    fun void reset() {
        indexer.reset();
        if (st_table != null) {
            for (int i;i<st_table.cap();i++) {
                st_table[i].reset();
            }
        }
    }
}  