class ST_stateMachine extends Stream {
    null @=> Stream @ states[];
    
    fun ST_stateMachine init(Stream arg[]) {
        arg @=> states;
        return this;
    }
    
    fun float next() {
        states[index].nextInt() => int tmp;
        tmp % states.cap() => index;
        return index $ float;
    }
}
        
ST_stateMachine stream;
stream.init([
st.choice(1,2),
st.seq([0,1,0,3,4]),
st.choice([4,1]),
st.seq([3,4,3,4,4,4,3]),
st.choice([0,3])
]);

PingSynth synth => Safe safe => dac;


cs.sync(0.2::second);

synth.init(
st.index([110,55,440,220,333],stream),
st.st(0.2),
st.st(0.5)
);




hour => now;