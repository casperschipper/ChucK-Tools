public class ST_exprv extends Stream {
    "ST_exprv" @=> _type;
    // exprv doesn't use the latch logic !
    // None of the input can latch the control.
    
    float _low,_high,_exp;
    
    Stream @ st_low;
    Stream @ st_high;
    Stream @ st_exp;
    
    fun ST_exprv low(float arg) {
        arg => _low;
        null @=> st_low;
        return this;
    }
    
    fun ST_exprv high(float arg) {
        arg => _high;
        null @=> st_high;
        return this;
    }
    
    fun ST_exprv exp(float arg) {
        arg => _exp;
        null @=> st_exp;
        return this;
    }
    
    fun ST_exprv low(Stream arg) {
        arg @=> st_low;
        return this;
    }
    
    fun ST_exprv high(Stream arg) {
        arg @=> st_high;
        return this;
    }
    
    fun ST_exprv exp(Stream arg) {
        arg @=> st_exp;
        return this;
    }
    
    fun float next() {
        if (st_low != null) { st_low.next() => _low; }
        if (st_high != null) { st_high.next() => _high; }
        if (st_exp != null) { st_exp.next() => _exp; }

        return cs.exprv(_low,_high,_exp);
    }
} 

