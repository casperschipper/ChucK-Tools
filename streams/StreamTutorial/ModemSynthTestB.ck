class ModemSynth {
    SinOsc oscArray[1];
    Pan2 p[1];
    
    int amount;
    float freqs[];
    
    20 => float lowFreq;
    3000 => float highFreq;
    
    0 => int play;
    
    Stream amps[1];
    Stream freqWidth[1];
    
    samp => dur T;
    
    fun ModemSynth init(Stream streamArg[],Stream arg2[]) {
        return streams(streamArg,arg2);
    }
    
    fun ModemSynth streams(Stream arg[],Stream arg2[]) {
        stop();
        
        arg @=> amps;
        arg.cap() => amount;
        arg2 @=> freqWidth;
        

        SinOsc array[amount];
        Pan2 pArray[amount];
        array @=> oscArray;
        pArray @=> p;
        
        for (int i;i<amount;i++) {
            //cs.rvf(0,0.05) => oscArray[i].width;
            cs.rvf() => p[i].pan; 
            oscArray[i] => p[i] => dac;
            0.1 => p[i].gain;
        }
                
        cs.warp(lowFreq,highFreq,amount,2) @=> freqs;
        
        for (int i;i<amount;i++) {
            freqs[i] => oscArray[i].freq;
        }
        
        spork ~ shred();
        
        return this;
    }
     
    fun void shred() {
        true => play;
        while(play) {
            T => now;
            for (int i;i<amount;++i) {
                ( amps[i].next()* ( freqs[i]*freqWidth[i].next() ) ) + freqs[i] => oscArray[i].freq;
            } 
        }
        for (int i;i<amount;i++) {
            oscArray[i] !=> p[i];
            p[i] !=> dac;
        }
    }
    
    fun void stop() {        
        false => play;
    }
}
    
ModemSynth synth;



[st.timed(st.choice([0,1]),st.line(st.choice([0.0001,.1]),st.rv(0,3))).st(),
st.timed(st.choice([0,1]),st.line(st.choice([0.001,.1]),st.rv(0,3))),
st.timed(st.choice([0,1]),st.line(st.choice([0.001,.1]),st.rv(0,3))),
st.timed(st.choice([0,1]),st.line(st.choice([0.001,.1]),st.rv(0,3))),
st.timed(st.choice([0,1]),st.line(st.choice([0.0001,.10]),st.rv(0,3))),
st.timed(st.choice([0,1]),st.line(st.choice([0.001,.10]),st.rv(0,3))),
st.timed(st.choice([0,1]),st.line(st.choice([0.001,.10]),st.rv(0,3))),
st.timed(st.choice([0,1]),st.line(st.choice([0.001,.10]),st.rv(0,3))),
st.timed(st.choice([0,1]),st.line(st.choice([0.0001,.1]),st.rv(0,3))).st(),
st.timed(st.choice([0,1]),st.line(st.choice([0.001,.1]),st.rv(0,3))),
st.timed(st.choice([0,1]),st.line(st.choice([0.001,.1]),st.rv(0,3))),
st.timed(st.choice([0,1]),st.line(st.choice([0.001,.1]),st.rv(0,3))),
st.timed(st.choice([0,1]),st.line(st.choice([0.0001,.10]),st.rv(0,3))),
st.timed(st.choice([0,1]),st.line(st.choice([0.001,.10]),st.rv(0,3))),
st.timed(st.choice([0,1]),st.line(st.choice([0.001,.10]),st.rv(0,3))),
st.timed(st.choice([0,1]),st.line(st.choice([0.001,.10]),st.rv(0,3)))] @=> Stream @ streams[];

[st.div( st.timed(st.rv(1,10),st.rv(0,1)), st.timed(st.rv(1,10),st.rv(0,1)) ).st(),
st.div( st.timed(st.rv(1,10),st.rv(0,1)), st.timed(st.rv(1,10),st.rv(0,1)) ),
st.div( st.timed(st.rv(1,10),st.rv(0,1)), st.timed(st.rv(1,10),st.rv(0,1)) ),
st.div( st.timed(st.rv(1,10),st.rv(0,1)), st.timed(st.rv(1,10),st.rv(0,1)) ),
st.div( st.timed(st.rv(1,10),st.rv(0,1)), st.timed(st.rv(1,10),st.rv(0,1)) ),
st.div( st.timed(st.rv(1,10),st.rv(0,1)), st.timed(st.rv(1,10),st.rv(0,1)) ),
st.div( st.timed(st.rv(1,10),st.rv(0,1)), st.timed(st.rv(1,10),st.rv(0,1)) ),
st.div( st.timed(st.rv(1,10),st.rv(0,1)), st.timed(st.rv(1,10),st.rv(0,1)) ),
st.div( st.timed(st.rv(1,10),st.rv(0,1)), st.timed(st.rv(1,10),st.rv(0,1)) ).st(),
st.div( st.timed(st.rv(1,10),st.rv(0,1)), st.timed(st.rv(1,10),st.rv(0,1)) ),
st.div( st.timed(st.rv(1,10),st.rv(0,1)), st.timed(st.rv(1,10),st.rv(0,1)) ),
st.div( st.timed(st.rv(1,10),st.rv(0,1)), st.timed(st.rv(1,10),st.rv(0,1)) ),
st.div( st.timed(st.rv(1,10),st.rv(0,1)), st.timed(st.rv(1,10),st.rv(0,1)) ),
st.div( st.timed(st.rv(1,10),st.rv(0,1)), st.timed(st.rv(1,10),st.rv(0,1)) ),
st.div( st.timed(st.rv(1,10),st.rv(0,1)), st.timed(st.rv(1,10),st.rv(0,1)) ),
st.div( st.timed(st.rv(1,10),st.rv(0,1)), st.timed(st.rv(1,10),st.rv(0,1)) )
]
 @=> Stream @ arg2[];


synth.init(streams,arg2);

//synth.init(streams);

minute => now;

            
            
        
    
    