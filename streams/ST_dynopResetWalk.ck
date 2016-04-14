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

class ST_dynopResetWalk extends ST_dynopWalk {
    Stream @ st_reset;
    
    0 => int nextType;
    
    fun ST_dynopResetWalk reset(Stream arg) {
        arg @=> st_reset;
        return this;
    }
    
    fun float next() {
        if(nextType == 0) {
            _value * st_mup.next() => _value;
            if (st_mup.more()) {
                0 => nextType;
            } else {
                1 => nextType;
            }
        } else if (nextType == 1) {
            _value + st_step.next() => _value;
            if (st_step.more()) {
                1 => nextType;
            } else {
                2 => nextType;
            }
        } else {
            st_reset.next() => _value;
            if (st_reset.more()) {
                2 => nextType;
            } else {
                0 => nextType;
            }
        }
        
        wrap();
        return _value;
    }
}

class Main extends st {

PingSynth synth => dac;



ST_dynopResetWalk test;

test.init(0,latch(ch(100,200),10));
test.mup(latch( ch(0.5,1.0), 3));
test.reset(test);

//test.test();    

synth.init(
test,
st(0.1),
st(0.1),
st(0.1)
);
    
}

Main main; hour => now;



