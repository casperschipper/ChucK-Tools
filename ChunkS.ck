fun void voice(int n) {
    StepSynth synth => Safe safe => NRev rev => Pan2 p => dac;
    
    rev.mix(0.1);
    
    synth.gain(1);
  
    p.pan((n/16.0) - 1.0);
    
    16 => int aantal;
    
    cs.grow(200,2,13) @=> float numbers[];
    st.choice(numbers).nextChunk(aantal) @=> float nummies[];
    
    synth.init(
    st.seq(cs.fillf(aantal,-1,1)),
    st.seq(
    st.latch(st.st(1),aantal),
    st.seq(nummies)
    )
    );
    
    hour => now;
}

for (int i;i<32;i++) {
    spork ~ voice(i);
}

hour => now;
    
    