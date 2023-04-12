class ST extends st {
    (new NodeSynth).reset();
    NodeSynth synths[10];
    
    fun Stream input() {
        return seq(cs.sine(cs.rv(1,300),[1.0]));
    }
    
    fun void play() {
        for (int i;i<synths.cap();i++) {
            synths[i].init(cs.ch([10,20,44444,300,1000]),0.01,cs.rvf(-1,1),rv(0,9),choice([0.001,0.1,0.2,0.3,0.5,1.0,100.0,10000.0]),ch([10.0]),choice([0.1,0.2,0.3,1.0,2.0,10.0]),impulse(rv(1,100)),input(),t(ch([1.0,2.0,3.0,4.0,5.0,6.0]),rv(1.0,4.0)));
        }
        hour => now;
    }
}

ST st;
spork ~ st.play();
hour => now;