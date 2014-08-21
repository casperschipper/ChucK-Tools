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
    
    fun Stream st() { 
        // this can be useful when you want to use make in literal arrays
        return this $ Stream;
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
        test(.1::second);
    }
    
    fun float test(dur T) {
        while(1) {
            <<<next()>>>;
            T => now;
        }
    }
    
    fun float testInt() {
        while(1) {
            <<<nextInt()>>>;
            .1::second => now;
        }
    }
}