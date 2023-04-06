public class ST_ugen extends Stream {
    "ST_ugen" @=> _type;
    UGen @ ugen;
    
    fun ST_ugen init(UGen arg) {
        arg @=> ugen;
        ugen => blackhole;
        return this;
    }
    
    fun float next() {
        return ugen.last();
    }
}
        