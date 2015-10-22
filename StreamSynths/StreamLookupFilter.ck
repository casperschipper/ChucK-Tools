// Stream controlled non linear feedback filter, using a table
//  

class Lookup extends Chugen {
    float _table[];
    int _halfsize;
    int _mask;
    
    fun void init(float seq[]) {
        seq @=> _table;
        seq.cap()-1 => int _size;
        _size / 2 => _halfsize;
        (Math.nextpow2(size)>>1) - 1 => _mask;
    }
    
    fun float tick(float in) {
        Math.floor((cs.clipf(in,-1,1) + 1) * _halfsize) $ int => int idx;
        return _table[idx&_mask];
    }
}

class LookupFilter extends Chubgraph {
    inlet => Gain input => Lookup lookup => DelayL del => HPF dc => Clip c => outlet;
    dc => input;
    
    Tanh h;
    
    
    //input.op(1); // should be 3 (multiplication), but I tend to use 1, more easy to get oscillation
    //dc.op(-1);
    
    inlet => lookup;
    
    5*second=>del.max;
    
    // set dc cutting filter pars:
    10 => dc.freq;
    0.9 => dc.Q;
    
    fun float [] setTable(float arg[]) {
        lookup.init(arg);
        return arg;
    }
    
    fun float freq(float arg) {
        second / arg => del.delay;
        return arg;
    }
        
    
    fun int inputOp(int op) {
        input.op(op);
        return op;
    }
    
    
    fun float fb(float arg) {
        arg => dc.gain;
        return arg;
    }
}


class StreamLookupFilter extends Chubgraph {
    inlet => LookupFilter f => Clip c => outlet;
    
    Stream @ st_freq;
    Stream @ st_fb;
    Stream @ st_timer;
    
    0 => int loop;
    
    samp => dur _timeStep;
    
    fun StreamLookupFilter init(Stream freqArg,Stream fbCtrl,Stream timerArg) {
        freqArg @=> st_freq;
        fbCtrl @=> st_fb;
        timerArg @=> st_timer;
        spork ~ play();
        return this;
    }
    
    fun float [] setTable(float arg[]) {
        f.setTable(arg);
        return arg;
    }
    
    fun int inputOp(int op) {
        f.inputOp(op);
        return op;
    }
    
    fun void play() {
        1 => loop;
        while(loop) {
            st_freq.next() => f.freq;
            st_fb.next() => f.fb;
            st_timer.next() * _timeStep=> now;
        }
    }
    
    fun StreamLookupFilter timeStep(dur arg) {
        arg => _timeStep;
        return this;
    }
    
    fun void stop() {
        0 => loop;
    }
}

Noise n => StreamLookupFilter s => dac;

s.setTable(OSC.table1);

s.init(
st.seq([440,220,880]),
st.st(0.9),
st.st(1000)
);

hour => now;