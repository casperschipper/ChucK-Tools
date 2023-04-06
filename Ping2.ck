class CheapEnv extends Chugen {
    static float lookup[];
    
    4096 => float phase;
    float rate;
            
    fun float tick(float in) {
        if (phase < 4096) {
            Math.floor(phase) $ int => int a;
            phase + rate => phase;
            return in * lookup[a];
        } else {
            return 0.0;
        }
    }
        
    fun dur duration(dur arg) {
        (4096 $ float) / (arg / samp) => rate;
        return arg;
    }
        
    fun void trigger() {
        0.0 => phase;
    }
}

new float [4096+1] @=> CheapEnv.lookup;
for (int i;i<CheapEnv.lookup.cap();i++) {
    1.0 * Math.pow(0.0001,(i $ float)/4096) => CheapEnv.lookup[i];
}

class Ping2 extends Chugraph {
    1.0 => float _gain;
    
    fun void trigger(float frq,dur dura,float amp) {
        spork ~ ping(frq,dura,amp);
    }
    
    fun float gain(float arg) {
        arg => _gain;
        return arg;
    }
    
    fun void ping(float f,dur dura,float a) {
        SinOsc c => CheapEnv env => outlet;
        0 => c.phase;
        a*_gain => c.gain;
        dura => env.duration;
        f => c.freq;
        env.trigger();
        dura => now;
    }
}



Ping2 ping => Safe safe => dac;
while(1) { 
    ping.trigger(cs.rf(120,127),cs.rd(100::ms,1000*ms),0.1);
    cs.rd(100*ms,1*ms) => now;
}

44100 * samp => now;
        