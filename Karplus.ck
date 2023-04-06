class Karplus extends Chugraph 
{    
    DelayL _del => Gain _fb => OnePole _p => PoleZero _dcblock => _del;
    _dcblock => outlet;
    
    _del.max(3*second);
    _dcblock.blockZero(0.995);
    
    float _freq;
    _p.pole(0.5);
    0.99 => _fb.gain;
    
    freq(220);
       
    fun Karplus freq(float arg) {
        arg => _freq;
        second / arg => _del.delay;
        return this;
    }
    
    fun Karplus fb(float arg) {
        arg => _fb.gain;
        return this;
    }
    
    fun void trigger() {
        spork ~ triggerShred();
    }
    
    fun void triggerShred() {
        Noise _excite;
        _excite => _del;
        second / _freq => now;
        _excite !=> _del;
    }
}

class KarplusTri extends Karplus {
    fun void triggerShred() {
        TriOsc s => _del;
        s.width(cs.rvf(0,.1));
        _freq => s.freq;
        0. => s.phase;
        second / _freq => now;
        s !=> _del;
    }
}

KarplusTri k => Clip c => dac;

c.gain(0.1);

fun float almost1(int number) {
    return (number $ float) / (number + 1);
}

k.fb(almost1(30));

class MyST_mupWalk extends ST_mupWalk 
{
    fun void wrap() {
        if (value < 20) {
            initialValue => value;
        }
        if (value > 3000) {
            initialValue => value;
        }
    }
}

(new ST_mupWalk).init(440

while(1) {
    k.freq(cs.rf(40,80));
    k.trigger();
    .25*second => now;
}
    
         
    
    
    