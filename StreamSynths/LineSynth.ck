class LineSynth extends Chubgraph {
    Linseg l => outlet;
    
    Stream @ _value;
    Stream @ _dura;
    
    0 => int loop;
    
    samp => dur _timeStep;
    
    fun static LineSynth make(Stream value,Stream dura) {
        LineSynth synth;
        synth.init(value,dura);
        return synth;
    }
    
    fun LineSynth init(Stream value,Stream dura) {
        value @=> _value;
        dura @=> _dura;
        spork ~ play();
        return this;
    }
    
    fun LineSynth timeStep(dur timeStep) {
        timeStep => _timeStep;
        return this;
    }
    
    fun void play() {
        1 => loop;
        while(loop) {
            _value.next() => l.target;
            _dura.next() * _timeStep => l.duration => now;
        }
    }
    
    fun void stop() {
        0 => loop;
    }       
}

LineSynth.make(st.seq([-1,1]),st.rv(100,50)) @=> LineSynth @ synth;

synth => Clip c => dac;


