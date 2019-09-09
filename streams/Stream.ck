public class Stream 
{    
    -1 => int size;
    0 => int index;
    "Stream" @=> string _type;
    false => int _latchMode;
    Math.sqrt(-1) => static float nan; // use this for finished finite streams ?
    
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
    
    fun int more() {
        return false; // don't hold a sequence by default.
    }
    
    fun void reset() {
        // do nothing
        //0 => index;
    }
    
    fun float [] nextChunk(int chunkSize) {
        float output[chunkSize];
        for (int i;i<chunkSize;i++) {
            next() => output[i];
        }
        return output;
    }
    
    fun float [] collect(int chunkSize) {
        return nextChunk(chunkSize);
    }
    
    fun float [] cut(int size) {
        return collect( size );
    }
    
    fun int [] nextIntChunk(int chunkSize) {
        int output[chunkSize];
        for (int i;i<chunkSize;i++) {
            nextInt() => output[i];
        }
        return output;
    }
    
    fun int [] collectInt(int chunkSize) {
        return nextIntChunk(chunkSize);
    }
    
    fun void test(dur T,dur testLength) {
        chout <= IO.newline();
        now + testLength => time then;
        3 => int numberOfTabs;
        while(now < then) {
            chout <= next();
            chout <= "\t\t\t";
            if (numberOfTabs-- > 0) {
                chout <= next();
                chout <= "\t\t\t";
            } else {
                chout <= IO.newline();
                3 => numberOfTabs;
            }
            T => now;
        }
        chout <= IO.newline();
    } 
      
    fun void test() { spork ~ test(.1::second,day); }   
    fun void test(dur T) { spork ~ test(T,day); }
    
    fun void testInt(dur T, dur testLength) {
        now + testLength => time then;
        while(now < then) {
            chout <= nextInt();
            chout <= IO.newline();
            T => now;
        }
        chout <= IO.newline();   
    }   
    
    fun void testInt() { testInt(.1*second,day); }
    fun void testInt(dur T) { testInt(T,day); }
}