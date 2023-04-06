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

