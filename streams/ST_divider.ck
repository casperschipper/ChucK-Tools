public class ST_divider extends Stream 
{
    "ST_divider" @=> _type;
    
    0 => float _dividend;
    0 => float _divisor;
    
    int _n;
    
    null @=> Stream @ st_dividend;
    null @=> Stream @ st_divisor;
    
    0 => int _nDivisor;
    0 => int _nDividend;
    
    fun float next() {
        if (_n == 0) {
            if (st_dividend != null) st_dividend.next() => _dividend;
            if (st_divisor != null) st_divisor.next() => _divisor;
            Math.floor(_divisor) $ int => _n;
        } 
        _dividend / _divisor => float tmp;
        _n--;
        return tmp;
    }
    
    fun ST_divider dividend(float arg) {
        arg => _dividend;
        null @=> st_dividend;
        return this;
    }
    
    fun ST_divider dividend(Stream arg) {
        arg @=> st_dividend;
        return this;
    }
    
    fun ST_divider divisor(float arg) {
        arg => _divisor;
        null @=> st_divisor;
        return this;
    }
    
    fun ST_divider divisor(Stream arg) {
        arg @=> st_divisor;
        return this;
    }
}
        
        
        