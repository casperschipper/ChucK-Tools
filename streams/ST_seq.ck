public class ST_seq extends Stream 
{
    "ST_seq" @=> _type;
    float sequence[];
    
    null @=> Stream @ st_sequence[];
    
    0 => int _min;
    0 => int _max;
    
    null @=> Stream @ st_min;
    null @=> Stream @ st_max;
    
    1 => int _loop;

    false => int _holdMode;
    true => int _more;
    
    fun ST_seq init(float _sequence[]) {
        _sequence @=> sequence;
        _sequence.size() => size => _max;
        return this;
    }
    
    fun ST_seq init(int _sequence[]) {
        cs.int2float(_sequence) @=> sequence;
        _sequence.size() => size => _max;
        return this;
    }
    
    fun ST_seq init(Stream _sequence[]) {
        _sequence @=> st_sequence;
        _sequence.size() => size => _max;
        return this;
    }

    fun ST_seq holdMode(int arg) {
        arg => _holdMode;
        return this;
    }
    
    fun float next() {
        float result;
        
        if (st_sequence != null) {
            st_sequence[index].next() => result;
        } else {
            sequence[index] => result;
        }
        
        updateIndex();
        
        return result;
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
    
    fun void updateIndex() {
        if (st_sequence != null) {
            if (st_sequence[index].more()) {
                // do nothing;
            } else {
                index++;
            }
        } else {
            index++;
        }
        
        if (st_min != null) st_min.nextInt() => _min;
        if (st_max != null) st_max.nextInt() => _max;
        
        Math.min(_min,_max) $ int => int tmp;
        Math.max(_min,_max) $ int => _max;
        tmp => _min;
        
        if (index >= _max || index >= size) {
            _min => index;
            false => _more;
        } 
    }
    
    fun ST_seq min(int arg) {
        null @=> st_min;
        arg => _min;
        return this;
    }
    
    fun ST_seq max(int arg) {
        null @=> st_max;
        arg => _max;
        return this;
    }
    
    fun ST_seq min(Stream arg) {
        arg @=> st_min;
        return this;
    }
    
    fun ST_seq max(Stream arg) {
        arg @=> st_max;
        return this;
    }   
    
    fun static ST_seq make(float _sequence[]) {
        ST_seq stream;
        stream.init(_sequence);
        return stream;
    }
    
    fun static ST_seq make(int _sequence[]) {
        ST_seq stream;
        stream.init(_sequence);
        return stream;
    }
    
    fun static ST_seq make(Stream _sequence[]) {
        ST_seq stream;
        stream.init(_sequence);
        return stream;
    }
}