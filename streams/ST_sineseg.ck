public class ST_sineseg extends Stream {
    float phase;
    float incr;
        
    Stream st_steps;
    
    float table[4096];
    
    fun void makeTable(int sizeArg) {
        sizeArg => table.size => size;
        for (int i;i<size;i++) {
            Math.sin((i $ float / size) * pi * 2) => table[i];
        }
    }
            
    
    fun ST_sineseg init( Stream arg ) {
        arg @=> st_steps;
        1.01 => phase;
        makeTable(4096);
        return this;
    }
    
    fun int more () {
        if (phase > 1.0) {
            if (st_steps.more()) {
                return 1;
            } else {
                return 0;
            }
        }
        return 1;
    }
        
    
    fun float next() {
        if (phase >= 1.0) {
            1.0 / st_steps.next() => incr;
            0 => phase;
        }   
        phase => float tmp;
        incr +=> phase;
        return ( table[ Math.floor(tmp * size) $ int ] );
    }
}


    