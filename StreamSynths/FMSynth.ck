class FMSynth extends Chubgraph {
    SinOsc c => outlet;
    SinOsc m => c;
    
    2 => c.sync;
    
    null @=> Stream @ _value;
    null @=> Stream @ _dura;
    null @=> Stream @ _index;
    null @=> Stream @ _ratio;
    
    0 => int loop;
    
    samp => dur _timeStep;
    
    fun static FMSynth make(Stream value,Stream dura,Stream index,Stream ratio) {
        FMSynth synth;
        synth.init(value,dura,index,ratio);
        return synth;
    }
    
    fun FMSynth init(Stream value,Stream dura,Stream index,Stream ratio) {
        value @=> _value;
        dura @=> _dura;
        index @=> _index;
        ratio @=> _ratio;
        spork ~ play();
        return this;
    }
    
    fun FMSynth timeStep(dur timeStep) {
        timeStep => _timeStep;
        return this;
    }
    
    fun void play() {
        1 => loop;
        float modFreq;
        float carrier;
        while(loop) {
            _value.next() => carrier => c.freq;
            carrier * _ratio.next() => modFreq => m.freq;
            modFreq * _index.next() => m.gain;
            _dura.next() * _timeStep => now;
        }
    }
    
    fun void stop() {
        0 => loop;
    }       
}

FMSynth synth => Clip c => dac;

synth.init(st.st(440),st.st(1000),st.st(1.0),st.st(4));

minute => now;




