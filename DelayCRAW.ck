// C. Schipper okt. 2011
class DelayC
{
    Step n; // Output generator
        
    UGen @ input; // nullpointer for input ugen
    
    1024 => int delaySize; // delaySize
    float data[delaySize]; // memory for delayline
    
    int wPos; // writing position in the delayline
    float delay; // delaytime in samples (float)
    
    float L1,L0,H0,H1; // the values used to make the spline interpolation.
    float frac;
    int index;         // position in the buffer
    
    UGen @ delaytime;
    
    spork ~delayShred();
    
    fun void delayShred() 
    {
        while(1) {    
            input.last() => data[wPos]; // writing samples
            clipf(delaytime.last(),2,delaySize-2) => delay; // clipped delaytime (minimum is 2 samples,maximum is delaySize-2)
            interp(wPos-delay) => n.next;
            (wPos + 1) % delaySize => wPos;     // moving writehead to next sample
            samp => now;
        }
    }
    
    // function to make buffer circular
    fun int wrap(int x) {
        if (x < 0) return x + delaySize;
        return x % delaySize;
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
    
    // sets the maxsize of the delayline     
    fun void setsize(dur size) {     
        (size / samp) $ int => delaySize => data.size;
    }
    
    // simple clipping function
    fun float clipf(float x,float min,float max) 
    {
        if (x < min) return min;
        else if (x > max) return max;
        return x;
    }
    
    // 3rd order spline interpolation based on code from http://www.musicdsp.org/showArchiveComment.php?ArchiveID=62
    fun float interp(float x) {
        Math.floor(x) $ int => index; // finding position in buffer
        x - index => frac; // calc remainder

        // reading 4 adjecent samples
        data[wrap(index-2)] => L1;
        data[wrap(index-1)] => L0;
        data[wrap(index)] => H0;
        data[wrap(index+1)] => H1;
        
        // magic formula
        return L0 + .5*
        frac*(H0-L1+
        frac*(H0 + L0*(-2) + L1 +
        frac*((H0 - L0)*9 + (L1 - H1)*3 +
        frac*((L0 - H0)*15 + (H1 - L1)*5 +
        frac*((H0 - L0)*6 + (L1 - H1)*2 )))));        
    }
}
   
//test code    
DelayC delay;
    
delay.setsize(44100::samp);
    
SinOsc lfo => Gain mod => blackhole; lfo.gain(20000); lfo.freq(.29);
Step offset => mod; 22050 => offset.next;
    
Noise testnoise => BPF f => blackhole;
440 => f.freq;1 => f.Q;
    
delay.connectInput(f);
delay.connectOutput(dac);
delay.connectDelayTime(mod);

hour => now;
    
    

    