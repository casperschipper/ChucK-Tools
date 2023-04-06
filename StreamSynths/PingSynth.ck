public class PingSynth extends Chugraph {
    // a synth that plays a percussively enveloped sinewave.
    Ping ping => outlet;
    null @=> Stream @ st_freq;
    null @=> Stream @ st_dura;
    null @=> Stream @ st_delta;
    null @=> Stream @ st_amp;
    
    1.0 => float _amp => ping.gain;
    
    0 => int loop;
    
    second => dur _timeStep;
    
    fun float gain(float arg) {
        arg => ping.gain;
        return arg;
    }
    
    fun PingSynth init(Stream freq,Stream delta,Stream dura,Stream ampArg) {
        delta @=> st_delta;
        freq @=> st_freq;
        dura @=> st_dura;
        ampArg @=> st_amp;
        
        spork ~ play();
        return this;
    }
    
    fun PingSynth init(Stream freq,Stream delta,Stream dura) {
        delta @=> st_delta;
        freq @=> st_freq;
        dura @=> st_dura;
        
        spork ~ play();
        return this;
    }
    
    fun PingSynth timeStep(dur arg) {
        arg => _timeStep;
        return this;
    }
    
    fun PingSynth make(Stream freq,Stream delta,Stream dura) {
        PingSynth synth;
        return synth.init(freq,delta,dura);
    }
 
    fun void play() {
        1 => loop;
        while(loop) {
            if (st_amp != null) st_amp.next() => _amp;
            ping.trigger(st_freq.next(),st_dura.next()*_timeStep,_amp);
            st_delta.next()*_timeStep => now;
                   
        }
    }
}

/*
public class SquareThing extends Chugraph {
    fun void trigger(float frq,dur dura,float amp) {
        spork ~ ping(frq,dura,amp);
    }
    
    fun void ping(float f,dur dura,float a) {
        BlitSquare c => PercEnv env => outlet;
        a => c.gain;
        dura => env.duration;
        f => c.freq;
        env.trigger();
        dura => now;
    }
}

class SquareSynth extends PingSynth {
}

    
    

cs.sync(.12*second);

PingSynth synth => Safe safe => dac;

synth.init(

st.seq([
st.latch(st.walkList([100,200,300,400,500,600,700,800],st.choice([-1,1])),st.st(1)).st(),
st.latch(
st.walkList([100,200,400,800,1600],st.choice([-1,1])),
st.tchoice([1,2,4,8],st.choice([1,2,4,8]))
)
],true),
st.st(0.12),
st.st(0.3)

);

hour => now;
*/
        