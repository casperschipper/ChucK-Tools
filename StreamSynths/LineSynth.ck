public class LineSynth extends Chugraph {
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




