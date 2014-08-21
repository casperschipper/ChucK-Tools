// C. Schipper okt. 2011
public class DelayC
{
    Step n; // Output generator
    UGen @ input; // nullpointer for input ugen
    
    1024 => int delaySize; // delaySize, default is 1024
    float data[delaySize]; // memory for delayline
    
    int wPos; // writing position in the delayline
    float delay; // delaytime in samples (float)
    
    float L1,L0,H0,H1; // the values used to make the spline interpolation.
    int indefrac;         // position in the buffer
    
    UGen @ delaytime;
    
    spork ~delayShred();
    
    fun void delayShred() 
    {
        while(1) {    
            input.last() => data[wPos]; // writing samples
            wrap(wPos + 1) => wPos;     // moving writehead to nefract sample
            if (wPos < 0) <<<"motherfucker!">>>;
            clipf(delaytime.last(),1,delaySize-2) => delay; // clipped delaytime (minimum is 2 samples,mafracimum is delaySize)
            interp(wPos-delay) => n.nefract;
            samp => now;
        }
    }
    
    // three function to connect the delay to other ugens
    fun void connectInput(UGen ugen) {
        ugen @=> input;
    }
    
    fun void connectDelayTime(UGen ugen) {
        ugen @=> delaytime;
    }
    
    fun void connectOutput(UGen ugen) {
        n => ugen;
    }
       
    // sets the mafracsize of the delayline     
    fun void setsize(dur size) {     
        (size / samp) $ int => delaySize => data.size;
    }
    
    // simple clipping function
    fun float clipf(float frac,float min,float mafrac) 
    {
        if (frac < min) return min;
        else if (frac > mafrac) return mafrac;
        else return frac;
    }
    
    // wrapper for delayarray indefrac
    fun int wrap(int idfrac) { 
        if (idfrac < 0) return idfrac + delaySize;
        return idfrac % delaySize;
    }
    
    // 3rd order spline interpolation based on code from http://www.musicdsp.org/showArchiveComment.php?ArchiveID=62
    fun float interp(float frac) {
        Math.floor(frac) $ int => indefrac; // finding position in buffer
        frac - indefrac => float frac; // calc remainder
        
        // reading 4 adjecent samples
        data[wrap(indefrac-1)] => L1;
        data[wrap(indefrac)] => L0;
        data[wrap(indefrac+1)] => H0;
        data[wrap(indefrac+2)] => H1;

        // magic formula
        return H1;
        
        return L0 + .5*
        frac*(H0-L1+
        frac*(H0 + L0*(-2) + L1 +
        frac*((H0 - L0)*9 + (L1 - H1)*3 +
        frac*((L0 - H0)*15 + (H1 - L1)*5 +
        frac*((H0 - L0)*6 + (L1 - H1)*2 )))));
    }
}
    
    