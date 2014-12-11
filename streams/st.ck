/*

lot's of nice and juicy shortcuts, for example:

st.index(
	[st.rv(0,10),st.st(10)],
	st.hold(
		st.count(2),
		st.seq([st.rv(1,10),st.st(1)])
	)
).test();

minute => now;
*/

public class st {
    fun static Stream st(float value) {
        ST_value stream;
        stream.init(value);
        return stream $ Stream;
    }
    
    fun static ST_index index(float seq[],Stream index) {
        return ST_index.make(seq,index);
    }
    
    fun static ST_index index(Stream seq[],Stream index) {
        return ST_index.make(seq,index);
    }
    
    fun static ST_seq seq(float seq[]) {
        return ST_seq.make(seq);
    } 
    
    fun static ST_seq seq(Stream seq[]) {
        return ST_seq.make(seq);
    }
    
    fun static ST_seq seq(int seq[]) {
        return ST_seq.make(seq);
    }
    
    fun static ST_rv rv(float min,float max) {
        return ST_rv.make(min,max);
    }
    fun static ST_rv rv(Stream min,Stream max) {
        return ST_rv.make(min,max);
    }
    fun static ST_rv rv(float min,Stream max) {
        return ST_rv.make(min,max);
    }
    fun static ST_rv rv(Stream min,float max) {
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
    
    fun static ST_repeat hold(Stream value,Stream repetition) {
        return ST_repeat.make(value,repetition);
    }
    
    fun static ST_count count(int max) {
        return ST_count.make(max);
    }
    
    fun static ST_choice choice(float array[]) {
        return ST_choice.make(array);
    }
    
    fun static ST_choice choice(Stream array[]) {
        return ST_choice.make(array);
    }
    
    fun static ST_choice choice(int array[]) {
        return ST_choice.make(array);
    }
    
    fun static ST_line line(Stream value,Stream timing) {
        ST_line stream;
        stream.init(value,timing);
        return stream;
    }
    
    fun static ST_boundedWalk boundedWalk(Stream minArg,Stream maxArg,Stream step) {
        ST_boundedWalk walk;
        walk.min(minArg);
        walk.max(maxArg);
        walk.setStep(step);
        return walk;
    }
    
    fun static ST_boundedWalk boundedWalk(Stream minArg,Stream maxArg) {
        return boundedWalk(minArg,maxArg,rv(-0.01,0.01));
    }
    
    fun static ST_boundedWalk boundedWalk(float minArg,float maxArg,Stream step) {
        ST_boundedWalk walk;
        walk.min(minArg);
        walk.max(maxArg);
        walk.setStep(step);
        return walk;
    }
    
    fun static ST_boundedWalk boundedWalk(float minArg,float maxArg) {
        return boundedWalk(minArg,maxArg,rv(-0.01,0.01));
    }
}