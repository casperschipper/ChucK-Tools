public class ST_triggerSend {
    null @=> Stream @ _dura;
    
    0 => int loop;
    
    samp => dur _timeStep;

    ST_trigger.clear();

    
    fun static ST_triggerSend make(Stream dura) {
        ST_triggerSend triggerSend;
        triggerSend.init(dura);
        return triggerSend;
    }
    
    fun ST_triggerSend init(Stream dura) {
        dura @=> _dura;
        spork ~ play();
        return this;
    }
    
    fun ST_triggerSend timeStep(dur timeStep) {
        timeStep => _timeStep;
        return this;
    }
    
    fun void play() {
        1 => loop;
        while(loop) {
        	ST_trigger.trigger();
            _dura.next() * _timeStep => now;
        }
    }
    
    fun void stop() {
        0 => loop;
    }       
}




