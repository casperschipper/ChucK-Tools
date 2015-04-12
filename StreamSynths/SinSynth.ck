public class SinSynth extends Chubgraph {
    SinOsc c => outlet;
    
    null @=> Stream @ _value;
    null @=> Stream @ _dura;
    null @=> Stream @ _amp;
    
    0 => int loop;
    
    samp => dur _timeStep;
    
    fun static SinSynth make(Stream value,Stream dura) {
        SinSynth synth;
        synth.init(value,dura);
        return synth;
    }
    
    fun SinSynth init(Stream value,Stream dura) {
        value @=> _value;
        dura @=> _dura;
        spork ~ play();
        return this;
    }
    
    fun SinSynth init(Stream value,Stream dura,Stream amp) {
        value @=> _value;
        dura @=> _dura;
        amp @=> _amp;
        spork ~ play();
        return this;
    }
    
    fun SinSynth timeStep(dur timeStep) {
        timeStep => _timeStep;
        return this;
    }
    
    fun void play() {
        1 => loop;
        while(loop) {
            if (_amp != null) {
                _amp.next() => c.gain;
            }
            _value.next() => c.freq;
            _dura.next() * _timeStep => now;
        }
    }
    
    fun void stop() {
        0 => loop;
    }       
}




