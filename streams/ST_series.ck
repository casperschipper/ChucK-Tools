public class ST_series extends Stream 
{
    "ST_series" @=> _type;
    
    float userList[];
    null @=> Stream @ st_userList[];

    ST_seriesIndex indexer;
    
    int last;
    int _holdMode;

    fun void initIndexer() {
        indexer.init(size);
    }
    
    fun ST_series init(float _userList[]) {
        _userList @=> userList;
        _userList.cap() => size;
        null @=> st_userList;
        initIndexer();
        return this;
    }
    
    fun ST_series init(int _userList[]) {
        (cs.int2float(_userList)) @=> userList;
        _userList.cap() => size;
        null @=> st_userList;
        initIndexer();
        return this;
    }
    
    fun ST_series init(Stream _userList[]) {
        _userList @=> st_userList;
        _userList.cap() => size;
        initIndexer();
        return this;
    }
    
    fun ST_series init(float _userList[],int holdMode) {
        holdMode => _holdMode;
        init(_userList);
        return this;
    }
    
    fun ST_series init(int _userList[],int holdMode) {
        holdMode => _holdMode;
        init(_userList);
        return this;
    }
    
    fun ST_series init(Stream _userList[],int holdMode) {
        holdMode => _holdMode;
        init(_userList);
        return this;
    }
        

    fun int more() {
        return indexer.more() && _holdMode;
    }
    
    fun float next() {
        indexer.more();
        if (st_userList != null) {
            if (st_userList[last].more()) {
                return st_userList[last].next();
            }
            indexer.nextInt() => last;
            return (st_userList[last]).next();
        } 
        return userList[indexer.nextInt()];
    }
    
    fun static ST_series make(float _userList[]) {
        return (new ST_series).init(_userList);
    }
    
    fun static ST_series make(int _userList[]) {
        return (new ST_series).init(cs.int2float(_userList));
    }
    
    fun static ST_series make(Stream _userList[]) {
        return (new ST_series).init(_userList);
    }   
}   

class ST_seriesIndex extends Stream {
    "ST_seriesIndex" @=> _type;
    
    int list[1];
    int current;
    
    1 => int running;
    
    fun void init(int amount) {
        amount => size;
        list.size(amount);
        for (int i;i<amount;++i) {
            i => list[i];
        }
    }
    
    fun int more() {
        if (running) {
            return true;
        } else {
            reset();
            return false;
        }
    }
    
    fun void reset() {
        1 => running;
        0 => current;
    }
    
    fun int nextInt() {
        int pos,tmp;
        if (current > (size - 2)) {
            0 => current;
            false => running;
            return list[size-1];
        }
        else {
            Math.random2(current,size-1) => pos;
            list[pos] => tmp;
            list[current] => list[pos];
            tmp => list[current]; 
        }
        current++;
        return tmp;
    }
    
    fun float next() {
        return nextInt() $ float;
    }
} 