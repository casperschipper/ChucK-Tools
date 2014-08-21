public class Stream 
{    
    -1 => int size;
    0 => int index;
    "Stream_base" @=> string _type;
    
    fun string type() {
        return _type;
    } 
    
    fun void init() {
        // nothing
    }
    
    fun void init( float _initArray[] ) {
        //
    }
    
    fun float next() {
        return 0.;
    }
    
    fun int nextInt() {
        return (Math.round(next()) $ int);
    }
    
    fun int running() {
        return ((index < size) || (size == -1));
    }
    
    fun void reset() {
        0 => index;
    }
    
    fun float [] nextChunk(int chunkSize) {
        float output[chunkSize];
        for (int i;i<chunkSize;i++) {
            next() => output[i];
        }
        return output;
    }
    
    fun int [] nextIntChunk(int chunkSize) {
        int output[chunkSize];
        for (int i;i<chunkSize;i++) {
            nextInt() => output[i];
        }
        return output;
    }
    
    fun float test() {
        while(1) {
            chout <= next() <= IO.newline();
            .1::second => now;
        }
    }
    
    fun float testInt() {
        while(1) {
            chout <= nextInt() <= IO.newline();
            .1::second => now;
        }
    }
}