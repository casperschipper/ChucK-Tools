public class ST_rv extends Stream
{
    "ST_rv" @=> _type;
    
    float low,high;
    
    null @=> Stream @ st_low;
    null @=> Stream @ st_high;
      
    Math.srandom(0);
    
    fun ST_rv init(float _low,float _high) {
        _low => low;
        _high => high;
        return this;
    }
  
    fun static ST_rv make() {
        return new ST_rv;
    }
    
    fun static ST_rv make(float _low,float _high) {
        ST_rv stream;
        stream.init(_low,_high);
        return stream;
    }
    
    fun static ST_rv make(Stream _low,Stream _high) {
        ST_rv stream;
        stream.init(_low,_high);
        return stream;
    }
   
    fun ST_rv init(Stream _low,Stream _high) {
        seed(0);
        _low @=> st_low;
        _high @=> st_high;
        return this;
    }
    
    
    fun ST_rv init(Stream _low,Stream _high,int _seed) {
        seed(_seed);
        _low @=> st_low;
        _high @=> st_high;
        return this;
    }
    
    fun ST_rv init(float _low,float _high,int _seed) {
        seed(_seed);
        _low => low;
        _high => high;
        return this;
    }
    
    fun ST_rv seed(int _seed) {
        _seed => Math.srandom;
        return this;
    }
    
    fun float next() {
        if (st_low != null) st_low.next() => low;
        if (st_high != null) st_high.next() => high;
        return Math.random2f(low,high);
    }
}