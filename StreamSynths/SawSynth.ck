public class SawSynth extends Chubgraph {
    SawOsc c => outlet;
    
    null @=> Stream @ _value;
    null @=> Stream @ _dura;
    
    0 => int loop;
    
    samp => dur _timeStep;
    
    fun static SawSynth make(Stream value,Stream dura) {
        SawSynth synth;
        synth.init(value,dura);
        return synth;
    }
    
    fun SawSynth init(Stream value,Stream dura) {
        value @=> _value;
        dura @=> _dura;
        spork ~ play();
        return this;
    }
    
    fun SawSynth timeStep(dur timeStep) {
        timeStep => _timeStep;
        return this;
    }
    
    fun void play() {
        1 => loop;
        while(loop) {
            0 => c.phase;
            _value.next() => c.freq;
            _dura.next() * _timeStep => now;
        }
    }
    
    fun void stop() {
        0 => loop;
    }       
}




