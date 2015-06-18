class PingSynth extends Chubgraph {
    // a synth that plays a percussively enveloped sinewave.
    Ping ping => outlet;
    null @=> Stream @ _freq;
    null @=> Stream @ _dura;
    null @=> Stream @ _delta;
    
    0 => int loop;
    
    second => dur _timeStep;
    
    fun PingSynth init(Stream freq,Stream delta,Stream dura) {
        delta @=> _delta;
        freq @=> _freq;
        dura @=> _dura;
        spork ~ play();
        return this;
    }
    
    fun PingSynth make(Stream freq,Stream delta,Stream dura) {
        PingSynth synth;
        return synth.init(freq,delta,dura);
    }
 
    fun void play() {
        1 => loop;
        while(loop) {
            _delta.next()*_timeStep => now;
            ping.trigger(_freq.next(),_dura.next()*_timeStep,1.0);
        }
    }
}


public class SquareThing extends Chubgraph {
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
        