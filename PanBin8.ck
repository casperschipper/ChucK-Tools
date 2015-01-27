public class PanBin8 extends Chubgraph
{
    Gain fl,fr,bl,br,F,R,L,B;
    if (dac.channels() == 8) {
        inlet => fl => dac.chan(0);
        inlet => fr => dac.chan(1);
        inlet => bl => dac.chan(2);
        inlet => br => dac.chan(3);
        inlet => F => dac.chan(4);
        inlet => R => dac.chan(5);
        inlet => L => dac.chan(6);
        inlet => B => dac.chan(7);
    }
    
    else {
        inlet => fl => Pan2 p1 => dac;
        inlet => fr => Pan2 p2 => dac;
        inlet => bl => Pan2 p3 => dac;
        inlet => br => Pan2 p4 => dac;
        inlet => F => Pan2 p5 => dac;
        inlet => R => Pan2 p6 => dac;
        inlet => L => Pan2 p7 => dac;
        inlet => B => Pan2 p8 => dac;
        -1 => p1.pan;
        -.8 => p2.pan;
        -.4 => p3.pan;
        -.2 => p4.pan;
        .2 => p5.pan;
        .4 => p6.pan;
        .8 => p7.pan;
        1 => p8.pan;
    }
    
    fun void pan ( float pan )
    {                          //  l r L R f relib
        if (pan < .125)       mup([1,0,0,0,0,0,0,0]);
        else if (pan < .250)  mup([0,0,0,0,1,0,0,0]);
        else if (pan < .375)  mup([0,1,0,0,0,0,0,0]);
        else if (pan < .500)  mup([0,0,0,0,0,1,0,0]);
        else if (pan < .625)  mup([0,0,0,1,0,0,0,0]);
        else if (pan < .750)  mup([0,0,0,0,0,0,0,1]);
        else if (pan < .875)  mup([0,0,1,0,0,0,0,0]);
        else if (pan < 1.00)  mup([0,0,0,0,0,0,1,0]);
        
        else if (pan < 1.125)  mup([1,0,0,0,1,0,0,0]);
        else if (pan < 1.250)  mup([0,1,0,0,1,0,0,0]);
        else if (pan < 1.375)  mup([0,1,0,0,0,1,0,0]);        
        else if (pan < 1.500)  mup([0,0,0,1,0,0,0,0]);
        else if (pan < 1.625)  mup([0,0,0,1,0,0,0,1]);
        else if (pan < 1.750)  mup([0,0,1,0,0,0,0,1]);
        else if (pan < 1.875)  mup([0,0,1,0,0,0,1,0]);
        else if (pan < 2.000)  mup([1,0,0,0,0,0,1,0]);
        else mup([1,1,1,1,1,1,1,1]);
    }
    
    fun void mup (int mupper[]) {
        mupper[0] => fl.gain;
        mupper[1] => fr.gain;
        mupper[2] => bl.gain;
        mupper[3] => br.gain;
        mupper[4] => F.gain;
        mupper[5] => R.gain;
        mupper[6] => L.gain;
        mupper[7] => B.gain;

    }
        


    fun void connect( UGen ugen )
    {
        ugen => fl;
        ugen => fr;
        ugen => bl;
        ugen => br;
        ugen => F;
        ugen => R;
        ugen => L;
        ugen => B;
    }
} 