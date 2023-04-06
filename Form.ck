public class Form {
    float currentphase;
    float freq;
    float pw;
    float oneoverfreq;
    int acdc;
    
    init(1.0);
    
    fun void init (float freqin) {
        freqin => freq;
        1.0 / freqin => oneoverfreq;
    }
    
    fun float setpw(float pwvalue) {
        pwvalue => pw;
        return pw;
    }
    
    fun float setfreq(float freqin) {
        init(freqin);
        return freqin;
    }
    
    fun int setdc() {
        return 1 => acdc;
    }
    
    fun int setac() {
        return 0 => acdc;
    }
        
    fun float phase() {
        (now % oneoverfreq::second)/1::second * freq => currentphase;
    }
    
    fun float sin() {
        return Math.sin(2*pi*(now/second)*freq);
    }
        
    fun float cos() {
        return Math.cos(2*pi*(now/second)*freq);
    }
    
    fun float sinenv() {
        return 1.0 + (.5 * sin() );
    }
    
    fun float tri() {
        phase();
        if (currentphase < .5) return -2 * currentphase;
        if (currentphase > .5) return 2 * (currentphase-.5);
    }
        
    fun float sqr() {
        phase();
        if (currentphase < .5) return 1.;
        else return -1.;
    }
    
    fun float pwm() {
        phase();
        if (currentphase < pw) return 1.;
        if (currentphase > pw) return -1.;
    }
}
        
        
        
           