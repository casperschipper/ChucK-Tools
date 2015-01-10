public class PulsePanSynth extends Chubgraph {
    Impulse i => Pan4 p;
        
    null @=> Stream @ _value;
    null @=> Stream @ _dura;
    null @=> Stream @ _pan;
    
    0 => int loop;
    
    samp => dur _timeStep;
    
    fun static PulsePanSynth make(Stream value,Stream dura,Stream pan) {
        PulsePanSynth synth;
        synth.init(value,dura,pan);
        return synth;
    }
    
    fun PulsePanSynth init(Stream value,Stream dura,Stream pan) {
        value @=> _value;
        dura @=> _dura;
        pan @=> _pan;
        spork ~ play();
        return this;
    }
    
    fun PulsePanSynth timeStep(dur timeStep) {
        timeStep => _timeStep;
        return this;
    }
    
    fun void play() {
        1 => loop;
        while(loop) {
            _value.next() => i.next;
            _pan.next() => p.pan;
            _dura.next() * _timeStep => now;
        }
    }
    
    fun void stop() {
        0 => loop;
    }       
}




