public class PanBin
{
    Gain fl,fr,bl,br;
    if (dac.channels() == 4) {
        fl => dac.chan(0);
        fr => dac.chan(1);
        bl => dac.chan(3);
        br => dac.chan(2);
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
    
    public void pan ( float pan )
    {
        if (pan < .125)      mup([1,0,0,0]);
        else if (pan < .25)  mup([1,1,0,0]);
        else if (pan < .375) mup([0,1,0,0]);
        else if (pan < .5)   mup([0,1,0,1]);
        else if (pan < .625) mup([0,0,0,1]);
        else if (pan < .75)  mup([0,0,1,1]);
        else if (pan < .875) mup([0,0,1,0]);
        else if (pan < 1.)   mup([1,0,1,0]);
        else if (pan < 1.25) mup([1,1,1,0]);
        else if (pan < 1.5)  mup([0,1,1,1]);
        else if (pan < 1.75) mup([1,0,1,1]);
        else if (pan < 2.)   mup([1,1,0,1]);
    }
    
    public void mup (int mupper[]) {
        mupper[0] => fl.gain;
        mupper[1] => fr.gain;
        mupper[2] => bl.gain;
        mupper[3] => br.gain;
    }
        


    public void connect( UGen ugen )
    {
        ugen => fl;
        ugen => fr;
        ugen => bl;
        ugen => br;
    }
} 