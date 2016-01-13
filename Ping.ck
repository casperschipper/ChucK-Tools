public class Ping extends Chubgraph {
    float _gain;
    
    fun void trigger(float frq,dur dura,float amp) {
        spork ~ ping(frq,dura,amp);
    }
    
    fun float gain(float arg) {
        arg => _gain;
        return arg;
    }
    
    fun void ping(float f,dur dura,float a) {
        SinOsc c => PercEnv env => outlet;
        0 => c.phase;
        a*_gain => c.gain;
        dura => env.duration;
        f => c.freq;
        env.trigger();
        dura => now;
    }
}