class ST_choice2 extends Stream 

// fails to be efficient!
{
    "ST_choice2" @=> _type;
    
    float userList[];
    null @=> Stream @ st_userList[];
    false => int _latched;
        
    fun ST_choice2 init(float _userList[]) {
        _userList @=> userList;
        _userList.cap() => size;
        null @=> st_userList;
        return this;
    }
    
    fun ST_choice2 init(int _userList[]) {
        (cs.int2float(_userList)) @=> userList;
        _userList.cap() => size;
        null @=> st_userList;
        return this;
    }
    
    fun ST_choice2 init(Stream _userList[]) {
        _userList @=> st_userList;
        _userList.cap() => size;
        updateIndex();
        return this;
    }
    
    fun int updateIndex() {
        Math.random2(0,size-1) => index;
        if(st_userList != null) {
            st_userList[index]._latchMode => _latched;
        }
    }
    
    fun float next() {
        float result;
        if (st_userList != null) {
            if(_latched) {
                st_userList[index].next() => result;
                while (Math.isnan(result)) {
                    false => _latched;
                    updateIndex();
                    st_userList[index].next() => result;
                } 
                return result;
            }
            st_userList[index].next() => result;
            updateIndex();
            return result;
        } 
        return userList[Math.random2(0,size-1)];
    }
    
    fun static ST_choice2 make(float _userList[]) {
        return (new ST_choice2).init(_userList);
    }
    
    fun static ST_choice2 make(int _userList[]) {
        return (new ST_choice2).init(cs.int2float(_userList));
    }
    
    fun static ST_choice2 make(Stream _userList[]) {
        return (new ST_choice2).init(_userList);
    }   
}

class ST_seq2 extends Stream 
{
    "ST_seq2" @=> _type;
    float sequence[];
    
    null @=> Stream @ st_sequence[];
    
    0 => int _min;
    0 => int _max;
    
    null @=> Stream @ st_min;
    null @=> Stream @ st_max;
        
    false => _latchMode;
    true => int _more;
    false => int _latched;
    
    fun ST_seq2 init(float _sequence[]) {
        _sequence @=> sequence;
        _sequence.size() => size => _max;
        return this;
    }
    
    fun ST_seq2 init(int _sequence[]) {
        cs.int2float(_sequence) @=> sequence;
        _sequence.size() => size => _max;
        return this;
    }
    
    fun ST_seq2 init(Stream _sequence[]) {
        _sequence @=> st_sequence;
        _sequence.size() => size => _max;
        st_sequence[index]._latchMode => _latched;
        return this;
    }
    
    fun ST_seq2 latchMode(int arg) {
        arg => _latchMode;
        return this;
    }
    
    fun float next() {
        float result;
        
        if (!_more && _latchMode) {
            true => _more;
            return nan;
        }
                
        if (_latched) {
            st_sequence[index].next() => result;
            if (Math.isnan(result)) {
                false => _latched;
                updateIndex();
                st_sequence[index].next() => result;
            }
            return result;
        } 

        if (st_sequence != null) {
            st_sequence[index].next() => result;
        } else {
            sequence[index] => result;
        }
        updateIndex();
        
        return result;
    }
    
    fun void updateIndex() {
        if (st_min != null) st_min.nextInt() => _min;
        if (st_max != null) st_max.nextInt() => _max;
        
        Math.min(_min,_max) $ int => int tmp;
        Math.max(_min,_max) $ int => _max;
        tmp => _min;
        
        index++;
        
        if (index >= _max || index >= size) {   
            _min => index;
            false => _more;
        }
        
        if (st_sequence != null) {
            st_sequence[index]._latchMode => _latched;
        }
    }
    
    fun ST_seq2 min(int arg) {
        null @=> st_min;
        arg => _min;
        return this;
    }
    
    fun ST_seq2 max(int arg) {
        null @=> st_max;
        arg => _max;
        return this;
    }
    
    fun ST_seq2 min(Stream arg) {
        arg @=> st_min;
        return this;
    }
    
    fun ST_seq2 max(Stream arg) {
        arg @=> st_max;
        return this;
    }   
    
    fun static ST_seq2 make(float _sequence[]) {
        ST_seq2 stream;
        stream.init(_sequence);
        return stream;
    }
    
    fun static ST_seq2 make(int _sequence[]) {
        ST_seq2 stream;
        stream.init(_sequence);
        return stream;
    }
    
    fun static ST_seq2 make(Stream _sequence[]) {
        ST_seq2 stream;
        stream.init(_sequence);
        return stream;
    }
}

(new ST_choice2).init([
(new ST_seq2).init([10,11,12]).latchMode(1),
st.st(100),
st.st(200)
]
) @=> Stream @ s1;
while(1) {
    s1.next();
    samp => now;
}