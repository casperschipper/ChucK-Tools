class LineSynth extends Chubgraph {
    Linseg l => outlet;
    
    null @=> Stream @ _value;
    null @=> Stream @ _dura;
    
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

LineSynth.make(
st.seq([-1,1]),
st.rv(
st.line(st.seq([0,10000]),st.rv(0.01,.1))
,1)) => Clip c1 => dac.left;

LineSynth.make(
st.seq([-1,1]),
st.rv(
st.line(st.seq([0,10000]),st.rv(0.01,.1))
,1)) => Clip c2 => dac.right;

minute => now;


