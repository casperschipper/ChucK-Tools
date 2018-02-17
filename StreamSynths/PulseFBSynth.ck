public class PulseFBSynth extends Chubgraph {
    Step i => Gain in => Gain out => Safe safe; 
    PanFour p;
    out => DelayC d => BiQuad f => in;
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
    
    fun static PulseFBSynth make(Stream valueArg,Stream duraArg,Stream panArg,Stream freqArg,Stream fbArg) {
        PulseFBSynth synth;
        synth.init(valueArg,duraArg,panArg,freqArg,fbArg);
        return synth;
    }
    
    fun PulseFBSynth init(Stream valueArg,Stream duraArg) {
        valueArg @=> _value;
        duraArg @=> _dura;
        (new ST_value).init(-0.7) @=> _fb;
        (new ST_value).init(220) @=> _freq;
        return this;
    }
    
    fun PulseFBSynth init(Stream valueArg,Stream duraArg,Stream panArg,Stream freqArg,Stream fbArg) {
        valueArg @=> _value;
        duraArg @=> _dura;
        panArg @=> _pan;
        freqArg @=> _freq;
        fbArg @=> _fb;
        spork ~ play();
        return this;
    }
    
    fun PulseFBSynth init(Stream valueArg,Stream duraArg,Stream panArg,Stream freqArg,Stream fbArg,Stream scheduleArg) {
        valueArg @=> _value;
        duraArg @=> _dura;
        panArg @=> _pan;
        freqArg @=> _freq;
        fbArg @=> _fb;
        scheduleArg @=> _schedule;
        spork ~ play();
        return this;
    }
    
    
    
    fun PulseFBSynth timeStep(dur timeStep) {
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

    fun PulseFBSynth freq(Stream arg) {
        arg @=> _freq;
        return this;
    }  
    fun PulseFBSynth value(Stream arg) {
        arg @=> _value;
        return this;
    }
    fun PulseFBSynth pan(Stream arg) {
        arg @=> _pan;
        return this;
    } 
    fun PulseFBSynth dura(Stream arg) {
        arg @=> _dura;
        return this;
    }  
    fun PulseFBSynth fb(Stream arg) {
        arg @=> _fb;
        return this;
    }
    fun PulseFBSynth schedule(Stream arg) {
        arg @=> _schedule;
        return this;
    }     
}




