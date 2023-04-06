/*
A synth that generates grains, as long as there are more samples provided.
The grains are separate, so can result in overlap
*/

class GrainStepSynth extends StreamSynth {
    Gain mix => outlet;
    
    null @=> Stream @ value; // value synth
    null @=> Stream @ delta; // time delay between grains
    
    0 => int loop;
       
    fun static StepSynth make(Stream value,Stream delta) {
        StepSynth synth;
        synth.init(value,delta);
        return synth;
    }
    
    fun StepSynth init(Stream value,Stream delta) {
        value @=> this.value;
        delta @=> this.delta;
        spork ~ play();
        return this;
    }
    
    fun void grain() {
        Step i => outlet;
        while(_value.more()) {
            updateDefered();
            if (_value.more()) {
                _value.next() => i.next;
            } else {
                0 => alive;
            }
            samp => now;
        }
    }
        
    
    fun void play() {
        1 => loop;
        while(loop) {
            updateDefered();
            _value.next() => i.next;
            _delta.next() *  => now;
        }
    }
    
    fun void stop() {
        0 => loop;
    }       
}

class M extends st {
    GrainStepSynth s => Safe safe => dac;
    
    s.init( seq( cs.fillf(32,-1,1), true ), st(1.0) );
}
    




