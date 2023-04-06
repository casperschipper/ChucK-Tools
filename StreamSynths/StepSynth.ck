

public class StepSynth extends StreamSynth {
    Step i => outlet;
    
    null @=> Stream @ _value;
    null @=> Stream @ _dura;
        
    samp => dur _timeStep;
    
    fun static StepSynth make(Stream value,Stream dura) {
        StepSynth synth;
        synth.init(value,dura);
        return synth;
    }
    
    fun StepSynth init(Stream value,Stream dura) {
        value @=> _value;
        dura @=> _dura;
        spork ~ play();
        return this;
    }
    
    fun StepSynth timeStep(dur timeStep) {
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
        _value.reset();
        _dura.reset();
    }       
}




