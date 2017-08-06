public class WriteSchedule {    
    null @=> Stream @ _value;
    null @=> Stream @ _dura;
    
    0 => int loop;
    
    second => dur _timeStep;
    
    fun static WriteSchedule make(Stream value,Stream dura) {
        WriteSchedule synth;
        synth.init(value,dura);
        return synth;
    }
    
    fun WriteSchedule init(Stream value,Stream dura) {
        value @=> _value;
        dura @=> _dura;
        spork ~ play();
        return this;
    }
    
    fun WriteSchedule timeStep(dur timeStep) {
        timeStep => _timeStep;
        return this;
    }
    
    fun void play() {
        1 => loop;
        while(loop) {
            _value.next(); // run but don't do anything with result.
            _dura.next() * _timeStep => now; // make timestep.
        }
    }
    
    fun void stop() {
        0 => loop;
    }       
}




