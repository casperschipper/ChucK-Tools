public class PwmSynth extends Chubgraph {

    SqrOsc c => outlet;
    
    null @=> Stream @ _value;
    null @=> Stream @ _dura;
    null @=> Stream @ _amp;
    null @=> Stream @ _pwm;
    
    0 => int loop;
    
    samp => dur _timeStep;
    
    fun static PwmSynth make(Stream value,Stream dura) {
        PwmSynth synth;
        synth.init(value,dura);
        return synth;
    }
    
    fun PwmSynth init(Stream value,Stream dura) {
        value @=> _value;
        dura @=> _dura;
        spork ~ play();
        return this;
    }
    
    fun PwmSynth init(Stream value,Stream dura,Stream amp,Stream pwm) {
        value @=> _value;
        dura @=> _dura;
        amp @=> _amp;
        pwm @=> _pwm;
        spork ~ play();
        return this;
    }
    
    fun PwmSynth timeStep(dur timeStep) {
        timeStep => _timeStep;
        return this;
    }
    
    fun void play() {
        1 => loop;
        while(loop) {
            if (_amp != null) {
                _amp.next() => c.gain;
                _pwm.next() => c.width;
            }
            _value.next() => c.freq;
            _dura.next() * _timeStep => now;
        }
    }
    
    fun void stop() {
        0 => loop;
    }       
}




