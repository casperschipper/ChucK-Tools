class ST_seedRv extends ST_rv
{
    "ST_seedRv" @=> _type;
    
    null @=> Stream @ st_seed;
    12345 => int currentSeed;
    
    fun ST_seedRv seed(Stream arg) {
        arg @=> st_seed;
        return this;
    }
    
    fun float operator(float a,float b) {
        if (st_seed != null) {
            st_seed.nextInt() => currentSeed;
            if (currentSeed != 0) {
                currentSeed => Math.srandom;
            }
        }
        return Math.random2f(a,b);
    }
}

StepSynth synth => Safe safe => dac;

synth.init(
((new ST_seedRv).init(-1,1) $ ST_seedRv).seed(st.weights([[0,100000],[3,10]])),
st.st(1)
);

hour => now;