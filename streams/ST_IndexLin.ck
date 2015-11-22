public class ST_indexLin extends Stream {
    float table[];
    null @=> Stream @ st_table[];
    0 => int areStreams;
    
    null @=> Stream @ indexer;
    
    float previous;
    
    float findex;
    
        
    false => int _holdMode; 
    false => int _more;   
    
    "ST_index" @=> _type;
    
    
    
    "ST_indexLin" @=> _type;
    
    fun static ST_indexLin make(float _values[], Stream _indexer) {
        ST_indexLin stream;
        stream.init(_values,_indexer);
        return stream;
    }
    
    fun static ST_indexLin make(int _values[], Stream _indexer) {
        ST_indexLin stream;
        stream.init(_values,_indexer);
        return stream;
    }
    
    
    fun static ST_indexLin make(Stream _values[], Stream _indexer) {
        ST_indexLin stream;
        stream.init(_values,_indexer);
        return stream;
    }    
    
    fun ST_indexLin init(float _values[],Stream _indexer) {
        _values @=> table;
        null @=> st_table;
        table.size() => size;
        _indexer @=> indexer;
        return this;
    }
    
    fun ST_indexLin init(Stream _values[],Stream _indexer) {
        _values @=> st_table;
        st_table.size() => size;
        _indexer @=> indexer;
        return this;
    }
    
    
    fun ST_indexLin init(int _values[],Stream _indexer) {
        cs.int2float(_values) @=> table;
        null @=> st_table;
        table.size() => size;
        _indexer @=> indexer;
        return this;
    }
    
    fun float wrapf(float x, float high) {
        Math.fabs(high + 1.0) => float range;
        (x % range) => x;
        if (x<0)
            return high + 1.0 + x;
        else 
            return x;
    }
    
    fun float lerp(float v0,float v1,float t) {
        return v0 + t * ( v1 - v0 ); // fast but wrong, f(t = 1) != v1 
    }
    
    fun int more() {
        if (_holdMode) {
            if (_more) {
                return true;
            } else {
                true => _more;
                return false;
            }
        } 
        return false;
    }
    
    fun float interpSample() {
        indexer.more() => _more;

        indexer.next() => float newFindex;
        if (newFindex == findex) {
            if (!areStreams) {
                return previous;
            }
        }
        newFindex => findex;
        wrapf(findex,size-1) => findex;
        
        Math.floor(findex) $ int => index;
        findex - index => float remainder;
        (index + 1) % size => int index2; // never negative
        
        float a,b;
        if (areStreams) { // check if streams
            st_table[index].next() => a;
            st_table[index2].next() => b;
        } else {
            table[index] => a;
            table[index2] => b;
        }
                
        return lerp(a,b,remainder);
    }
    
    fun ST_indexLin holdMode(int arg) {
        arg => _holdMode;
        return this;
    }
    
    fun float next() {
        (st_table != null) => areStreams;
        if (areStreams) {
            if (st_table[index].more()) {
                return previous;
            }
            interpSample() => previous;
            return previous;
        } 
        interpSample() => previous;
        return previous;
    }
} 