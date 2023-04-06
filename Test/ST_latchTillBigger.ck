/* latch until condition */

class ST_latchTillBigger extends Stream {
    Stream @ st_source;
    float testValue;
    int _more;
    
    fun void init(Stream sourceArg,float test) {
        sourceArg @=> this.st_source;
        test => this.test;
    }
    
    fun int more() {
        return _more;
    }
    
    fun float next() {
        sourceArg.next() => float x;
        if (x >= testValue) {
            false => _more;
            st_source.reset();
        }
        return x; 
    }
}

ST_latchTillBigger cas;
cas.init( st.count(33), 32.0 );

st.seq( cas, st(99) ).test();

hour => now;

        
        
        

