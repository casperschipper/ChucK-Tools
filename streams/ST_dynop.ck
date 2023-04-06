/*
class ST_dynop extends Stream {
    Stream st_a;
    Stream st_b;
    Stream st_sel;
    
    float _v1;
    float _v2;
    
    1 => int oldSelect;
    
    fun ST_dynop init(Stream aArg,Stream bArg,Stream selArg) {
        aArg @=> st_a;
        bArg @=> st_b;
        st_a.next() => _v1;
        st_b.next() => _v2;
        selArg @=> st_sel;
        return this;
    }
    
    fun float next() {
        st_sel.nextInt() => int select;
        
        float result;
        
        if (select == 0) {
            0.0 => result;
        } else if (select == 1) {
            _v1 + _v2 => result; 
        } else if (select == 2) {
            _v1 - _v2 => result;
        } else if (select == 3) {
            _v1 * _v2 => result;
        } else if (select == 4) {
            _v1 / _v2 => result;
        }
        
        if (st_a.more()) => st_a.next() => _v1;
        if (st_b.more()) => st_a.next() => _v2;
        
        return result;
    }
}
*/

class ST_dynopWalk extends ST_walk {    
    Stream st_mup;
    
    false => int nextIsMup;
    
    fun ST_dynopWalk mup(Stream arg) {
        arg @=> st_mup;
        return this;
    }
    
    fun float next() {
        if(nextIsMup) {
            _value * st_mup.next() => _value;
            if (st_mup.more()) {
                true => nextIsMup;
            } else {
                false => nextIsMup;
            }
        } else {
            _value + st_step.next() => _value;
            if (st_step.more()) {
                false => nextIsMup;
            } else {
                true => nextIsMup;
            }
        }
            
        wrap();
        return _value;
    }
    
    fun void wrap() {
        if (_value < 20) {
            1000 => value;
            return;
        } else if (_value > 2000) {
            1000 => value;
        }
    }
        
}

class Main extends st {
    PingSynth synth => Tanh safe => Pan2 p => dac;
    safe.gain(0.01);
    p.pan(cs.rvf());
    
    ST_dynopWalk test;
    test.value(1000);
    test.mup(ch([3.0/2.0,2.0/3.0]));
    test.step(latch(walkList([100,-100]),ch([3,6])));
    
    loop(test,ch([5,8,3]),ch([4,5,6])) @=> Stream freq;
    
    0.12*cs.rv(2,7) => float T;
    
    synth.init(freq,st(T),st(T*1.5),line(seq(1,0),rv(1,60)));
}

Main main[10];

hour => now;

    
        
    
        
       