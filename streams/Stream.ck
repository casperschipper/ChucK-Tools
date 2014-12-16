public class Stream 
{    
    -1 => int size;
    0 => int index;
    "Stream" @=> string _type;
    
    fun string type() {
        return _type;
    } 
    
    fun Stream st() { 
        // this can be useful when you want to use make in literal arrays
        return this $ Stream;
    }
    
    fun float next() {
        return 0.;
    }
    
    fun int nextInt() {
        return (Math.floor(next()) $ int);
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
    
    fun void test(dur T,dur testLength) {
        now + testLength => time then;
        while(now < then) {
            chout <= "\t" <= next();
            T => now;
        }
        chout <= "\n\n";
    } 
      
    fun void test() { test(.1::second,day); }   
    fun void test(dur T) { test(T,day); }
    
    fun void testInt(dur T, dur testLength) {
        now + testLength => time then;
        while(now < then) {
            chout <= "\t" <= nextInt();
            T => now;
        }
        chout <= "\n\n";    
    }   
    
    fun void testInt() { testInt(.1*second,day); }
    fun void testInt(dur T) { testInt(T,day); }
}