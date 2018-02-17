class Shaper extends Chugen {
    fun float tick (float x) {
        return (1.9*x) - (x * x * x);
    }
}

public class PulseFBSynth2 extends Chubgraph {
    Step i => Gain in => Gain out => Safe safe; 
    PanFour p;
    out => DelayC d => BiQuad f => Shaper s => in;
    d.max(2::second);
    d.delay(second / 220);
    
    p.connect(safe);
    
    -.9 => f.gain;
    
    Stream _value,_dura,_freq,_fb,_pan;
    Stream _schedule; 

    .5 => f.b0;
    .5 => f.b1;

    0 => int loop;
    
    samp => dur _timeStep;
    
    fun static PulseFBSynth2 make(Stream valueArg,Stream duraArg,Stream panArg,Stream freqArg,Stream fbArg) {
        PulseFBSynth2 synth;
        synth.init(valueArg,duraArg,panArg,freqArg,fbArg);
        return synth;
    }
    
    fun PulseFBSynth2 init(Stream valueArg,Stream duraArg) {
        valueArg @=> _value;
        duraArg @=> _dura;
        (new ST_value).init(-0.7) @=> _fb;
        (new ST_value).init(220) @=> _freq;
        return this;
    }
    
    fun PulseFBSynth2 init(Stream valueArg,Stream duraArg,Stream panArg,Stream freqArg,Stream fbArg) {
        valueArg @=> _value;
        duraArg @=> _dura;
        panArg @=> _pan;
        freqArg @=> _freq;
        fbArg @=> _fb;
        spork ~ play();
        return this;
    }
    
    fun PulseFBSynth2 init(Stream valueArg,Stream duraArg,Stream panArg,Stream freqArg,Stream fbArg,Stream scheduleArg) {
        valueArg @=> _value;
        duraArg @=> _dura;
        panArg @=> _pan;
        freqArg @=> _freq;
        fbArg @=> _fb;
        scheduleArg @=> _schedule;
        spork ~ play();
        return this;
    }
    
    
    
    fun PulseFBSynth2 timeStep(dur timeStep) {
        timeStep => _timeStep;
        return this;
    }
    
    fun void play() {
        1 => loop;
        while(loop) {
            _value.next() => i.next;
            _pan.next() => p.pan;
            second / _freq.next() => d.delay;
            _fb.next() => f.gain;
            _schedule.next(); // this is just for scheduling updates to the buffers, you can synchronize updates with the other parameters.
            _dura.next() * _timeStep => now;
        }
    }
    
    fun void stop() {
        0 => loop;
    }     
    
    fun float gain(float arg) {
        arg => safe.gain;
        return arg;
    }    

    fun PulseFBSynth2 freq(Stream arg) {
        arg @=> _freq;
        return this;
    }  
    fun PulseFBSynth2 value(Stream arg) {
        arg @=> _value;
        return this;
    }
    fun PulseFBSynth2 pan(Stream arg) {
        arg @=> _pan;
        return this;
    } 
    fun PulseFBSynth2 dura(Stream arg) {
        arg @=> _dura;
        return this;
    }  
    fun PulseFBSynth2 fb(Stream arg) {
        arg @=> _fb;
        return this;
    }
    fun PulseFBSynth2 schedule(Stream arg) {
        arg @=> _schedule;
        return this;
    }     
}




