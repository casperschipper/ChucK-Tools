public class ST_customLoop extends Stream {
    Stream st_input;
    Stream st_size;
    Stream st_index;

    0 => int state;
    
    float mem[1024];
    int writeIndex;
    
    fun void init(Stream inArg,Stream sizeArg,Stream indexArg) {
        inArg @=> this.st_input;
        sizeArg @=> this.st_size;
        indexArg @=> this.st_index;
        
        0 => state;
    }
    
    fun void input(Stream inArg) {
        inArg @=> this.st_input;
    }
    
    fun void length(Stream sizeArg) {
        sizeArg @=> this.st_size;
    }
    
    fun void indexer(Stream indexArg) {
        indexArg @=> this.st_index;
    }
    
    fun float next() {
        int idx;
        if (state == 0) {
            st_size.nextInt() => size;
            if (size > mem.cap()) {
                mem.size(size);
            }
            1 => state;
        }
        if (state == 1) {
            if (writeIndex > size) {
                2 => state;
                0 => writeIndex;
            } else {
                st_input.next() => mem[writeIndex++] => float tmp;
                return tmp;
            }
        
        }
        if (state == 2) {
            if (st_index.more()) {
                st_index.nextInt() => idx;
                cs.safeTableIndex(idx,size) => idx;
                return mem[idx];
            }
            else {
                0 => state;
                return next();
            }
        }
    }
}


        