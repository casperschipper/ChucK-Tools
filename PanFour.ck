public class PanFour
{    
    Gain input, fl,fr,bl,br;
    
    input => fl;
    input => fr;
    input => bl;
    input => br;
    
    if (dac.channels() == 4) {
        fl => dac.chan(0);
        fr => dac.chan(1);
        bl => dac.chan(2);
        br => dac.chan(3);
    }
    
    else {
        fl => Pan2 p1 => dac;
        fr => Pan2 p2 => dac;
        bl => Pan2 p3 => dac;
        br => Pan2 p4 => dac;
        -1 => p1.pan;
        -.33 => p2.pan;
        .33 => p3.pan;
        1 => p4.pan;
    }
    
    
    fun float sqsin( float x )
    { return (Math.sin( 2 * pi * x ) + 1) * .5 ; }
    
    fun void pan( float pan )
    { 
        sqsin(pan) => fl.gain;
        sqsin(pan+0.75) => fr.gain;
        sqsin(pan+0.25) => bl.gain;
        sqsin(pan+0.5) => br.gain;
    }
    
    fun void gain(float arg) {
        input.gain(arg);
    }
    
    fun void connect( UGen ugen )
    {
        ugen => input;
    }
} 