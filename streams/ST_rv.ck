public class ST_rv extends Stream
{
    "ST_rv" @=> _type;
    
    float low,high;
    
    null @=> Stream @ st_low;
    null @=> Stream @ st_high;
          
    fun ST_rv init(float _low,float _high) {
        _low => low;
        _high => high;
        return this;
    }
    
    fun ST_rv init(float _low,Stream _high) {
        _low => low;
        _high @=> st_high;
        return this;
    }
    
    fun ST_rv init(Stream _low,float _high) {
        _low @=> st_low;
        _high => high;
        return this;
    }
  
    fun static ST_rv make() {
        return new ST_rv;
    }
    
    fun static ST_rv make(float _low,float _high) {
        return (new ST_rv).init(_low,_high);
    }
    fun static ST_rv make(float _low,Stream _high) {
        return (new ST_rv).init(_low,_high);
    } 
    fun static ST_rv make(Stream _low,float _high) {
        return (new ST_rv).init(_low,_high);
    }
    fun static ST_rv make(Stream _low,Stream _high) {
        return (new ST_rv).init(_low,_high);
    }
   
    fun ST_rv init(Stream _low,Stream _high) {
        seed(0);
        _low @=> st_low;
        _high @=> st_high;
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