public class ST_loop extends Stream {    
    int idx;
    float _values[];
    int int_min, int_max;
    null @=> Stream @ st_min;
    null @=> Stream @ st_max;
    null @=> Stream @ st_values[];
    
    fun float next() {
        if (st_min != null) Math.floor(st_min.next()) $ int => int_min;
        if (st_max != null) Math.floor(st_max.next()) $ int => int_max;

        if (idx >= int_max) int_min => idx;
        if (idx < int_min) int_min => idx;
        
        if (st_values != null) {
            return st_values[idx++].next();
        }
        else {
            return _values[idx++];
        }
    }
    
    fun ST_loop values(float valuesArg[]) {
        valuesArg @=> _values;
        0 => int_min;
        _values.cap() => int_max;
        return this;
    }
    
    fun ST_loop values(int valuesArg[]) {
        return values(cs.int2float(valuesArg));
    }
    
    fun ST_loop values(Stream valuesArg[]) {
        valuesArg @=> _stvalues;
        valuesArg.cap() => int_max;
    }

    fun ST_loop min(Stream arg) {
        arg @=> st_min;
    }

    fun ST_loop max(Stream arg) {
        arg @=> st_max;
    }
        
    
    fun ST_loop min(int arg) {
        arg => int_min;
        null @=> st_min;
        return this;
    }
    
    fun ST_loop max(int arg) {
        arg => int_max;
        null @=> st_max;
        return this;
    }
    
    fun static ST_loop make() {
        return new ST_loop;
    }
    
    fun static ST_loop make(float values[]) {
        ST_loop stream;
        stream.values(values);
        return stream;
    }
}
   
    