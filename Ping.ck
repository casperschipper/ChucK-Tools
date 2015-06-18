public class Ping extends Chubgraph {
    fun void trigger(float frq,dur dura,float amp) {
        spork ~ ping(frq,dura,amp);
    }
    
    fun void ping(float f,dur dura,float a) {
        SinOsc c => PercEnv env => outlet;
        a => c.gain;
        dura => env.duration;
        f => c.freq;
        env.trigger();
        dura => now;
    }
}