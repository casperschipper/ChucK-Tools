public class st {
    fun static Stream st(float value) {
        ST_value stream;
        stream.init(value);
        return stream $ Stream;
    }
    
    fun static ST_index index(float seq[],Stream index) {
        return ST_index.make(seq,index);
    }
    
    fun static ST_seq seq(float seq[]) {
        return ST_seq.make(seq);
    } 
    
    fun static ST_seq seq(Stream seq[]) {
        return ST_seq.make(seq);
    }
    
    fun static ST_seq seq(int seq[]) {
        return ST_seq.make(cs.int2float(seq));
    }
    
    fun static ST_rv rv(float min,float max) {
        return ST_rv.make(min,max);
    }
    
    fun static ST_timed timed(Stream str,Stream timing) {
        return ST_timed.make(str,timing);
    }
    
    fun static ST_timed timedSeq(Stream seq[],Stream timing) {
        return ST_timed.make(ST_seq.make(seq),timing);
    }
    
    fun static ST_timed timedSeq(float seq[],Stream timing) {
        return ST_timed.make(ST_seq.make(seq),timing);
    }
    
    fun static ST_timed rvSeq(float min,float max,Stream timing) {
        return ST_timed.make(rv(min,max),timing);
    }
}