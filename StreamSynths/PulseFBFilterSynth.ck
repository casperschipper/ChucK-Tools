public class PulseFBFilterSynth extends Chugraph {
    Step i => Gain in => Gain out => Safe safe; 
    PanFour p;
    out => DelayC d => BiQuad f => LPF lpf => Tanh h => in;
    
    lpf.Q(1.0);
    lpf.freq(10000);
    lpf.gain(1.1);
    
    
    d.max(2::second);
    d.delay(second / 220);
    
    p.connect(safe);
    
    -.9 => f.gain;
    
    Stream _value,_dura,_freq,_fb,_pan,_filterFreq,_Q;
    Stream _schedule; 

    .5 => f.b0;
    .5 => f.b1;

    0 => int loop;
    
    samp => dur _timeStep;
    
    fun static PulseFBFilterSynth make(Stream valueArg,Stream duraArg,Stream panArg,Stream freqArg,Stream fbArg,Stream filterFreqArg,Stream filterQArg) {
        PulseFBFilterSynth synth;
        synth.init(valueArg,duraArg,panArg,freqArg,fbArg,filterFreqArg,FilterQArg);
        return synth;
    }
    
    fun PulseFBFilterSynth init(Stream valueArg,Stream duraArg) {
        valueArg @=> _value;
        duraArg @=> _dura;
        (new ST_value).init(-0.7) @=> _fb;
        (new ST_value).init(220) @=> _freq;
        return this;
    }
    
    fun PulseFBFilterSynth init(Stream valueArg,Stream duraArg,Stream panArg,Stream freqArg,Stream fbArg,Stream filterFreqArg,Stream filterQArg) {
        valueArg @=> _value;
        duraArg @=> _dura;
        panArg @=> _pan;
        freqArg @=> _freq;
        fbArg @=> _fb;
        filterFreqArg @=> _filterFreq;
        filterQArg @=> _Q;
        spork ~ play();
        return this;
    }
    
    fun PulseFBFilterSynth init(Stream valueArg,Stream duraArg,Stream panArg,Stream freqArg,Stream fbArg,Stream filterFreqArg,Stream filterQArg,Stream scheduleArg) {
        valueArg @=> _value;
        duraArg @=> _dura;
        panArg @=> _pan;
        freqArg @=> _freq;
        fbArg @=> _fb;
        filterFreqArg @=> _filterFreq;
        filterQArg @=> _Q;
        scheduleArg @=> _schedule;
        spork ~ play();
        return this;
    }
    
    
    
    fun PulseFBFilterSynth timeStep(dur timeStep) {
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
            _filterFreq.next() => lpf.freq;
            _filterQ.next() => lpf.Q;
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

    fun PulseFBFilterSynth freq(Stream arg) {
        arg @=> _freq;
        return this;
    }  
    fun PulseFBFilterSynth value(Stream arg) {
        arg @=> _value;
        return this;
    }
    fun PulseFBFilterSynth pan(Stream arg) {
        arg @=> _pan;
        return this;
    } 
    fun PulseFBFilterSynth dura(Stream arg) {
        arg @=> _dura;
        return this;
    }  
    fun PulseFBFilterSynth fb(Stream arg) {
        arg @=> _fb;
        return this;
    }
    fun PulseFBFilterSynth filterFreq(Stream arg) {
        arg @=> _filterFreq;
        return this;
    }
    fun PulseFBFilterSynth filterQ(Stream arg) {
        arg @=> _Q;
        return this;
    }

    fun PulseFBFilterSynth schedule(Stream arg) {
        arg @=> _schedule;
        return this;
    }     
}




