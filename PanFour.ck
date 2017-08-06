public class PanFour
{
    Gain fl,fr,bl,br;

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
        
    
    private float sqsin( float x )
    { return (Math.sin( 2 * pi * x ) + 1) * .5 ; }
    
    public void pan( float pan )
    { 
        sqsin(pan) => fl.gain;
        sqsin(pan+0.75) => fr.gain;
        sqsin(pan+0.25) => bl.gain;
        sqsin(pan+0.5) => br.gain;
    }

    public void connect( UGen ugen )
    {
        ugen => fl;
        ugen => fr;
        ugen => bl;
        ugen => br;
    }
} 

if (dac.channels() == 4) {
    <<<"4 channels available">>>;
}