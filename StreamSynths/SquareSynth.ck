public class SquareSynth extends Chugraph {
    BlitSquare c => outlet;
    
    null @=> Stream @ _value;
    null @=> Stream @ _dura;
    null @=> Stream @ _amp;
    
    0 => int loop;
    
    samp => dur _timeStep;
    
    fun static SquareSynth make(Stream value,Stream dura) {
        SquareSynth synth;
        synth.init(value,dura);
        return synth;
    }
    
    fun SquareSynth init(Stream value,Stream dura) {
        value @=> _value;
        dura @=> _dura;
        spork ~ play();
        return this;
    }
    
    fun SquareSynth init(Stream value,Stream dura,Stream amp) {
        value @=> _value;
        dura @=> _dura;
        amp @=> _amp;
        spork ~ play();
        return this;
    }
    
    fun SquareSynth timeStep(dur timeStep) {
        timeStep => _timeStep;
        return this;
    }
    
    fun void play() {
        1 => loop;
        while(loop) {
            if (_amp != null) {
                _amp.next() => c.gain;
            }
            _value.next() => c.freq;
            _dura.next() * _timeStep => now;
        }
    }
    
    fun void stop() {
        0 => loop;
    }       
}




