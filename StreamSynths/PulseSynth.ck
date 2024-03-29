public class PulseSynth extends StreamSynth {
    Impulse i => outlet;
    
    null @=> Stream @ _value;
    null @=> Stream @ _dura;
        
    samp => dur _timeStep;
    
    fun static PulseSynth make(Stream value,Stream dura) {
        PulseSynth synth;
        synth.init(value,dura);
        return synth;
    }
    
    fun PulseSynth init(Stream value,Stream dura) {
        value @=> _value;
        dura @=> _dura;
        spork ~ play();
        return this;
    }
    
    fun PulseSynth timeStep(dur timeStep) {
        timeStep => _timeStep;
        return this;
    }
    
    fun void play() {
        1 => loop;
        while(loop) {
            updateDefered();
            _value.next() => i.next;
            _dura.next() * _timeStep => now;
        }
    }
    
    fun void stop() {
        0 => loop;
    }       
}




