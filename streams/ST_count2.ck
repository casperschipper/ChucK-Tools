public class ST_count2 extends Stream {
    "ST_count2" @=> _type;
    
    int value;
    int _max;
    
    int _more;
    int _holdMode;
    
    null @=> Stream @ st_max;
    
    fun ST_count2 init(Stream arg,int holdArg) {
        holdMode(holdArg);
        max(arg);
        return this;
    }
    
    fun ST_count2 init(int arg,int holdArg) {
        holdMode(holdArg);
        max(arg);
        return this;
    }
    
    fun ST_count2 holdMode(int arg) {
        true => _more;
        
        if (value >= _max) {
            false => _more;
            if (st_max != null) st_max.nextInt() => _max;
            0 => value;
        }
        
        (arg == true) => _holdMode;
        return this;
    }
    
    fun ST_count2 max(Stream arg) {
        arg @=> st_max;
        return this;
    }
    
    fun ST_count2 max(int arg) {
        arg => _max;
        null @=> st_max;
        return this;
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
    
    fun float next() {
        value => int tmp;
        value + 1 => value;
        if (value >= _max) {
            false => _more;
            if (st_max != null) st_max.nextInt() => _max;
            0 => value;
        }
 
        return tmp $ float;
    }
}
            
    