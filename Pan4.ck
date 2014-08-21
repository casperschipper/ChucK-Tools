public class Pan4 extends Chubgraph 
{
    int mode;
    int panint;
    float panTable[512];
    
    for (int i; i<512 ; i++) {
        sqsin(i/512.0) => panTable[i];
    }
    
    if (dac.channels() == 4) {
        Gain outs[4];
        for (int i;i<4;i++) { inlet => outs[i] => dac.chan[i]; }
        1 => mode;
    } else {
        inlet => Pan2 p => dac;
        0 => mode;
    }
    
    fun float sqsin ( float x ) {
        return (Math.sin ( 2. * pi * x ) + 1. ) * .5 ; 
    }
    
    fun void pan ( float panArg ) {
        if (mode) {
            (panArg * 511) $ int => panint;
            panTable[panint] => outs[0].gain;
            panTable[(panint+384) % 512] => outs[1].gain;
            panTable[(panint+256) % 512] => outs[2].gain;
            panTable[(panint+128) % 512] => outs[3].gain;
        } else { 
            (panArg * 2.) - 1. => p.pan;
        }
    }
}
        
        
    
    
    
    