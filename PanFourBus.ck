public class PanFourBus
{
    Gain fl,fr,bl,br;
    fl => buses.chan[0];
    fr => buses.chan[1];
    bl => buses.chan[2];
    br => buses.chan[3];
       
    
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