class M extends st {
    line ( rv(1,80) , fractRandTimer(ch([0.001,0.01,0.2]))) @=> Stream a;
    
    seq ( 
    latch (  seq ( [ latch( line(seq(ch([1,2,30,300]),ch([1,2,30,200])),fractRandTimer(ch([0.001,0.01,0.05,0.1,0.4]))), rv(1,20)), st(100), st(200), st(100), st(300)],true ) , st ( 10 ) ),
    latch ( rv(a $ Stream,a), ch([303,50,7000])) ) @=> Stream g;
    
    sineseg( g ) @=> Stream f;
    
    
    
    StepSynth synth => Safe safe => dac;
    safe.gain(1);
    
    synth.init(f,st(1));
}

M m;
hour => now;