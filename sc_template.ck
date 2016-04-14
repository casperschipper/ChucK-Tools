class Main extends st {
    PingSynth synth => Safe safe => dac;
    
    SuperChuck sc;
    sc.instrument("ping");
    sc.timer(st(1.0));
    sc.addPar("freq",st(440));
    sc.addPar("gain",st(1.0));
    
    
    
}

Main main; hour => now;