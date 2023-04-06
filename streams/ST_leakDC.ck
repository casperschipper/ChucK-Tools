public class ST_leakDC extends Stream 
{
    "ST_leakDC" @=> _type;
    Stream st_coef; // 0.995 is a pretty descent default
    Stream st_input;
    
    0.0 => float out; 
    0.0 => float previousX;
    
    fun ST_leakDC init(Stream i,Stream c) {
        input(i);
        coef(c);
        return this;
    }
    
    fun ST_leakDC coef(Stream arg) {
        arg @=> st_coef;
        return this;
    }
    
    fun ST_leakDC input(Stream arg) {
        arg @=> st_input;
        return this;
    }
    
    fun float next() {
        st_input.next() => float xIn;
        cs.clipf(st_coef.next(),0.0,1.0) => float currentCoef;
        xIn - previousX + (currentCoef * out) => out;
        xIn => previousX;
        return out;
    }
    
}