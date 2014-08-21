public class Ping extends Chubgraph {
    SinOsc c => PercEnv env;
    
    120::ms => dur _dura;
    220 => float _freq;
    0.1 => c.gain;
    

    
    fun void trigger(float frq,dur dura) {
        dura => _dura;
        frq => _freq;
        spork ~ ping();
    }
    
    fun void trigger(float frq,dur dura,float amp) {
        amp => c.gain;
        trigger(frq,dura);
    }
    
    fun void trigger() {
        spork ~ ping();
    }
    
    fun void ping() {
        env => outlet;
        _dura => env.duration;
        _freq => c.freq;
        env.trigger();
        _dura => now;
        env !=> outlet;
    }
}