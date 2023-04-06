class ST_osc extends Stream {    
    dur wl;
    
    null @=> Stream @ st_freq;
    null @=> Stream @ st_width;
    null @=> Stream @ st_phase;
   
    1 => float _width;
        
    float phase;
    
    fun ST_osc init(float fArg) {
        freq(fArg);
        return this;
    }
    
    fun ST_osc width(float arg) {
        arg => _width;
        return this;
    }
    
    fun ST_osc init(Stream arg) {
        arg @=> st_freq;
        return this;
    }
    
    fun float next() {
        calcphase();
        return phase; // this you can override...
    }
    
    fun void calcphase() {
        if (st_phase != null) { st_phase.next() => phase; return; } // external phase control.
        if (st_freq != null) second / st_freq.next() => wl;
        if (st_width != null) st_width.next() => _width;
        (now % wl) / wl => phase;
        (1.0 / _width) *=> phase;
        if (phase > 1) 0 => phase;
    }
    
    fun ST_osc freq(float arg) {
        second / arg => wl;
        null @=> st_freq;
        return this;
    }
    
    fun ST_osc freq(Stream arg) {
        arg @=> st_freq;
        return this;
    }
    
    fun ST_osc width(Stream arg) {
        arg @=> st_width;
        return this;
    }
    
    fun ST_osc width(float arg) {
        null @=> st_width;
        arg => _width;
        return this;
    }
}

class ST_sin extends ST_osc {
    2 * pi => float twopi;
    fun float next() {
        calcphase();
        return Math.sin(phase * twopi);
    }
}

class ST_tri extends ST_osc {
    fun float next() {
        calcphase();
        return Math.fabs( (phase * 2) - 1 ); 
    }
}

class ST_saw extends ST_osc {
    fun float next() {
        calcphase();
        return (phase * 2.0) - 1.0;
    }
}

PulseSynth test => Safe safe => dac;

test.init((new ST_tri).init(
st.t(st.rv(100,1000),st.rv(0,0.3))
),st.st(1));

minute => now;






