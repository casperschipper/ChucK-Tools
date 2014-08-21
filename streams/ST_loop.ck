public class ST_loop extends Stream {    
    int idx;
    float _values[];
    int int_min, int_max;
    null @=> Stream @ _min;
    null @=> Stream @ _max;
    null @=> Stream @ _stvalues[];
    
    fun float next() {
        if (_min != null) Math.floor(_min.next()) $ int => int_min;
        if (_max != null) Math.floor(_max.next()) $ int => int_max;

        if (idx >= int_max) int_min => idx;
        if (idx < int_min) int_min => idx;
        
        if (_stvalues != null) {
            return _stvalues[idx++].next();
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
        
    
    fun ST_loop min(int arg) {
        arg => int_min;
        return this;
    }
    
    fun ST_loop max(int arg) {
        arg => int_max;
        return this;
    }
    
    fun ST_loop make() {
        return new ST_loop;
    }
    
    fun ST_loop make(float values[]) {
        ST_loop stream;
        stream.init(values);
        return stream;
    }
}
   
    