public class FeedbackDelay extends Chubgraph 
{
    inlet => LPF _lf => HPF _hf => DelayC _del;
    _del => Gain _fb => Clip _clip => _del;
    _del => outlet;
    
    null @=> Shred @ shred;
    
    Linseg linseg;
    
    20 => _hf.freq;
    20000 => _lf.freq;
    1 => _lf.Q => _hf.Q;
    0.75 => _fb.gain;
    
    _del.max(5*second);
    _del.delay(1*second);
    
    fun FeedbackDelay delay(dur arg) {
        arg => _del.delay;
        return this;
    }
    
    fun FeedbackDelay maxDelay(dur arg) {
        arg => _del.max;
        return this;
    }
    
    fun FeedbackDelay lf(float arg) {
        arg => _lf.freq;
        return this;
    }
    
    fun FeedbackDelay hf(float arg) {
        arg => _hf.freq;
        return this;
    }
    
    fun FeedbackDelay freq(float arg) {
        second / arg => _del.delay;
        return this;
    }
    
    fun FeedbackDelay fb(float arg) {
        arg => _fb.gain;
        return this;
    }
    
    fun void delayTarget(dur delTarget,dur slopeDur) {
        
        if(shred != null && shred.id()) {
            shred.id() => Machine.remove;
        }
        spork ~ delayTargetShred(delTarget,slopeDur) @=> shred;
    }
    
    fun void delayTargetShred(dur delTarget,dur slopeDur) {
        linseg => blackhole;

        
        linseg.value(_del.delay() / second);
        linseg.target(delTarget / second);
        linseg.duration(slopeDur);
        
        now + slopeDur => time then;
        while(now < then) {
            samp => now;
            linseg.last()*second => _del.delay;
        }
        linseg !=> blackhole;
    }
}
    
    
     