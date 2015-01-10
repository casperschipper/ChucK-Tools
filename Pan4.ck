public class Pan4 extends Chubgraph
{
    Gain fl,fr,bl,br;
    if (dac.channels() == 4) {
        inlet => fl => dac.chan(0);
        inlet => fr => dac.chan(1);
        inlet => bl => dac.chan(2);
        inlet => br => dac.chan(3);
    }
    
    else {
        inlet => fl => Pan2 p1 => dac;
        inlet => fr => Pan2 p2 => dac;
        inlet => bl => Pan2 p3 => dac;
        inlet => br => Pan2 p4 => dac;
        -1 => p1.pan;
        -.33 => p2.pan;
        .33 => p3.pan;
        1 => p4.pan;
    }

    4096 => int size;
    size / 2 => int halfSize;
    float panTable[size];
    for (int i;i<size;i++) {
        cub(sqsin((i $ float) / size )) => panTable[i];
    }   
    
    fun float sqsin( float x ) { 
        return (Math.sin( 2 * pi * x ) + 1) * .5 ; 
    }
    
    fun float cub(float x) {
        return x * x * x;
    }
    
    fun void pan( float pan ) {
        Math.floor((pan * halfSize) + halfSize) $ int => int index;
        panTable[index%size] => fl.gain;
        panTable[(index+3096)%size] => fr.gain;
        panTable[(index+1024)%size] => bl.gain;
        panTable[(index+2048)%size] => br.gain;
    }

    fun void connect( UGen ugen )
    {
        ugen => fl;
        ugen => fr;
        ugen => bl;
        ugen => br;
    }
} 