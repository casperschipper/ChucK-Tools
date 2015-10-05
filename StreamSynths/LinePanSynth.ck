public class LinePanSynth extends Chubgraph {
    Step unit => Envelope i => Pan4 p;
    1 => unit.next;
    null @=> Stream @ _value;
    null @=> Stream @ _dura;
    null @=> Stream @ _pan;
    
    0 => int loop;
    
    samp => dur _timeStep;
    
    fun static LinePanSynth make(Stream value,Stream dura,Stream pan) {
        LinePanSynth synth;
        synth.init(value,dura,pan);
        return synth;
    }
    
    fun LinePanSynth init(Stream value,Stream dura,Stream pan) {
        value @=> _value;
        dura @=> _dura;
        pan @=> _pan;
        spork ~ play();
        return this;
    }
    
    fun LinePanSynth timeStep(dur timeStep) {
        timeStep => _timeStep;
        return this;
    }
    
    fun void play() {
        1 => loop;
        while(loop) {
            _value.next() => i.target;
            _pan.next() => p.pan;
            _dura.next() * _timeStep => i.duration => now;
        }
    }
    
    fun void stop() {
        0 => loop;
    }       
}




