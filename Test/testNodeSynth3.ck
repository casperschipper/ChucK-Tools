class ST extends st {
    (new NodeSynth).reset();
    NodeSynth synths[10];
    
    for (int i;i<synths.cap();i++) {
        synths[i].init(cs.choose([10,100,2000,4000,8,4,3,2,20,30]),0.1,cs.rvf(-1,1),rv(0,9),choice([0.1,0.001,0.2,3.0,5.0,8.0]),ch([10.0,0.1,3.0,100.0,200.0]),rv(1,10));
        
    }
    hour => now;
}

ST st;