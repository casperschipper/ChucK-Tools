public class TriOscTendencyMask
{
    TriOsc low => blackhole;
    TriOsc high => blackhole;
    int max;
    
    defaultFreqs();
    
    fun void defaultFreqs() {
        Std.rand2f(0.1,0.35) => low.freq;
        Std.rand2f(0.3,0.5) => high.freq;
    }
    
    fun int value() {
        return (.5 * (Std.rand2f(low.last(),high.last()) + 1) * max) $ int;
    }
    
    fun void setFreqs(float a,float b) {
        a => low.freq;
        b => high.freq;
    }
    
    fun void setMax(int maxArg) {
        maxArg => max;
    }
}


    
    