public class SuperSaw 
{
    Gain g;
    SawOsc s[];
    
    SawOsc tmp[7] @=> s;
    
    .01 => float detune;
    440 => float cfrq;
    s.size() => int total;
    
    init();
    
    fun void init () {
        for (int i;i<s.size();i++) {
            s[i] => g;
            Std.rand2f(0,1) => s[i].phase;
        <<<"sawosc zoveel ",i," gedaan">>>;
        }
        <<<"done">>>;
    }
    
    fun void size ( int sze ) {
        SawOsc temp[sze] @=> s;
        init();
    }
    
    fun void freq ( float frq ) {
        frq => cfrq;
        for (int i;i<s.size();i++) {
            calcFreq(i) => s[i].freq;
            (1.0 / total) => s[i].gain;
        }
    }
        
    fun float calcFreq ( int nr ) {
        nr - (total / 2) => int index; 
        return cfrq * (1 + ((index $ float) / (total / 2) * detune));
    }
    
    fun void connect (UGen ugen) {
        g => ugen;
    }
}
        
    