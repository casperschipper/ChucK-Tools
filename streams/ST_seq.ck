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

    false => _latchMode;
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
    
    fun ST_seq init(string steno) { // allow people to use "abcdefg" as input
        steno.length() => int size;
        int stenoList[size];
        for (int i;i<size;i++) {
            (steno.charAt(i) - 97) => stenoList[i];
        }
        return init(stenoList);
    }

    fun ST_seq holdMode(int arg) {
        arg => _latchMode;
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
    
    fun void reset() {
        if (st_min != null) st_min.nextInt() => index => _min;
        if (st_sequence != null) {
            for (int i;i<st_sequence.cap();i++) {
                st_sequence[i].reset();
            }
        }
    }
    
    fun int more() {
        if (_latchMode) {
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
        0 => int special;
        if (st_sequence != null) {
            if(st_sequence[index].more()) {
                true => _more;
                return;
            } 
        }
        
        index++;        
        
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
    
    fun ST_seq seq(float arg[]) {
        arg @=> sequence;
        null @=> st_sequence;
        return this;
    }
    
    fun ST_seq seq(Stream arg[]) {
        arg @=> st_sequence;
        return this;
    }
    
    fun ST_seq set(int arg) {
        arg @=> index;
        return this;
    }
    
    /*
    fun void reset() {
        0 => index;
    }
    */
}