class ST extends st {
    (new NodeSynth).reset();
    NodeSynth synths[10];
    
    for (int i;i<synths.cap();i++) {
        synths[i].init(cs.rv(10,1000),0.1,cs.rvf(-1,1),rv(0,9),rv(0.0,10.0),ch([1000.0]),rv(1,2));
        
    }
    hour => now;
}

ST st;