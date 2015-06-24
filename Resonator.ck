public class Resonator
{
    Delay d;
    d => Gain fb => BiQuad f => d;

    .75 => fb.gain;
    1::second => d.max;
    
    0.5 => f.b0;
    0.5 => f.b1;
    
    fun void setFreq(float freq) {
        if (freq < 1.0)
            <<<"frequency to low">>>;
        (1.0 / freq)::second => d.delay; 
        }
    
    fun void feedback(float fb)
    { fb => fb.gain; }
    
    fun void connectOut( UGen ugen )
    { d => ugen; }
    
    fun void connectIn ( UGen ugen )
    { ugen => d; }
}
    
    