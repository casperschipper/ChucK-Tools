class ST extends st {
    (new NodeSynth).reset();
    NodeSynth synths[10];
    
    fun Stream input() {
       return (new ST_adc).init(0);
    }
    
    fun void play() {
        for (int i;i<synths.cap();i++) {
            synths[i].init(cs.ch([44100,8800,2200,100,200]),0.01,cs.scalef(i,0,synths.cap(),-1.0,1.0),rv(0,9),choice([0.001]),ch([10.0,1.0]),choice([0.1,0.5,3.0,2.0,4.0,8.0]),impulse(rv(1,10)),input(),t(ch([1.0]),rv(1.0,4.0)));
        }
        hour => now;
    }
}

ST st;
spork ~ st.play();
hour => now;