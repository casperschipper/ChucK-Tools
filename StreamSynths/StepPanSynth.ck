public class StepPanSynth extends Chubgraph {
    Step i => Safe safe; PanFour p;
    p.connect(safe);
        
    null @=> Stream @ _value;
    null @=> Stream @ _dura;
    null @=> Stream @ _pan;
    
    0 => int loop;
    
    samp => dur _timeStep;
    
    fun static StepPanSynth make(Stream value,Stream dura,Stream pan) {
        StepPanSynth synth;
        synth.init(value,dura,pan);
        return synth;
    }
    
    fun StepPanSynth init(Stream value,Stream dura,Stream pan) {
        value @=> _value;
        dura @=> _dura;
        pan @=> _pan;
        spork ~ play();
        return this;
    }
    
    fun StepPanSynth timeStep(dur timeStep) {
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




