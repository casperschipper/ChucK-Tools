class LinsegChub extends Chugraph {
    Step unit => Envelope env => outlet;
    
    1 => unit.next;
    
    fun float target(float arg) {
        arg => env.target;
        return arg;
    }
     
    fun dur duration(dur arg) {
        arg => env.duration;
        return arg;
    }
}



public class LineSynth extends Chugraph {
    LinsegChub l => outlet;
    
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




