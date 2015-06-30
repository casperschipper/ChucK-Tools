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
    static Stream globals[];
    
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
    
    fun static ST_index index(int seq[],Stream index) {
        return ST_index.make(seq,index);
    }
    
    fun static ST_indexLin indexLin(float seq[],Stream indexer) {
        return (new ST_indexLin).init(seq,indexer);
    }
    fun static ST_indexLin indexLin(int seq[],Stream indexer) {
        return (new ST_indexLin).init(seq,indexer);
    }
    
    fun static ST_seq seq(float seq[]) {
        return ST_seq.make(seq);
    } 
    
    fun static ST_seq seq(float a,float b) {
        return ST_seq.make([a,b]);
    }
    
    fun static ST_series series(float seq[]) {
        ST_series stream;
        stream.init(seq);
        return stream;
    }
    
    fun static ST_series series(Stream seq[]) {
        ST_series stream;
        stream.init(seq);
        return stream;
    }
    
    fun static ST_series series(int seq[]) {
        return series(cs.int2float(seq));
    }
    
    fun static ST_series series(float seq[],int holdmode) {
        ST_series stream;
        stream.init(seq,holdmode);
        return stream;
    }
    
    fun static ST_series series(int seq[],int holdmode) {
        ST_series stream;
        stream.init(cs.int2float(seq),holdmode);
        return stream;
    }
    
    fun static ST_series series(Stream seq[],int holdmode) {
        ST_series stream;
        stream.init(seq,holdmode);
        return stream;
    }
    
    fun static ST_seq seq(Stream seq[]) {
        return ST_seq.make(seq);
    }
    
    fun static ST_seq seq(int seq[]) {
        return ST_seq.make(seq);
    }
    
    fun static ST_seq seq(Stream seq[],int holdMode) {
        return ST_seq.make(seq).holdMode(holdMode);
    }
    
    fun static ST_seq seq(float seq[],int holdMode) {
        return ST_seq.make(seq).holdMode(holdMode);
    }
    
    fun static ST_seq seq(int seq[],int holdMode) {
        return ST_seq.make(seq).holdMode(holdMode);
    }
    fun static ST_seq seq(Stream a,Stream b) {
        return ST_seq.make([a,b]).holdMode(false);
    }
        
    
    fun static ST_rv rv(float minArg,float maxArg) {
        return ST_rv.make(minArg,maxArg);
    }
    fun static ST_rv rv(Stream minArg,Stream maxArg) {
        return ST_rv.make(minArg,maxArg);
    }
    fun static ST_rv rv(float minArg,Stream maxArg) {
        return ST_rv.make(minArg,maxArg);
    }
    fun static ST_rv rv(Stream minArg,float maxArg) {
        return ST_rv.make(minArg,maxArg);
    }
    
    fun static ST_latch latch(Stream valueArg,Stream repeatArg) {
        return (new ST_latch).init(valueArg,repeatArg);
    }
    fun static ST_latch latch(float valueArg,float repeatArg) {
        return (new ST_latch).init(st(valueArg),st(repeatArg));
    }
    fun static ST_latch latch(Stream valueArg,int repeatArg) {
        return (new ST_latch).init(valueArg,st(repeatArg));
    }
    fun static ST_latch latch(int valueArg,Stream repeatArg) {
        return (new ST_latch).init(st(valueArg),repeatArg);
    }

    fun static ST_timedLatch tLatch(Stream valueArg,Stream timerArg) {
        return (new ST_timedLatch).init(valueArg,timerArg);
    }  
    
    fun static ST_timed timed(Stream str,Stream timing) {
        return ST_timed.make(str,timing);
    }
    
    fun static ST_timed t(Stream str,Stream timing) {
        return timed(str,timing);
    }
    
    fun static ST_timed t(Stream str,float timing) {
        return timed(str,st(timing));
    }
    
    fun static ST_timed timedSeq(Stream seqArg[],Stream timing) {
        return t(seq(seqArg),timing);
    }
    fun static ST_timed timedSeq(float seqArg[],Stream timing) {
        return t(seq(seqArg),timing);
    }
    fun static ST_timed timedSeq(float seqArg[],float timing) {
        return t(seq(seqArg),timing);
    }
    fun static ST_timed tSeq(Stream seq[],Stream timing) {
        return timedSeq(seq,timing);
    }
    fun static ST_timed tSeq(float seq[],Stream timing) {
        return timedSeq(seq,timing);
    }
    fun static ST_timed tSeq(Stream seq[],float timing) {
        return timedSeq(seq,st(timing));
    }
    
    
    fun static ST_timed rvSeq(float minArg,float maxArg,Stream timing) {
        return ST_timed.make(rv(minArg,maxArg),timing);
    }
    
    fun static ST_repeat hold(Stream value,Stream repetition) {
        return ST_repeat.make(value,repetition);
    }
    
    fun static ST_count count(int maxArg) {
        if (maxArg < 1) {
            1 => maxArg;
        }
        return ST_count.make(maxArg);
    }
    
    fun static ST_count count(Stream max) {
        return (new ST_count).init(max);
    }
    
    fun static ST_count2 count2(int maxArg) {
        return (new ST_count2).init(maxArg,true);
    }
    
    fun static ST_count2 count2(Stream maxArg) {
        return (new ST_count2).init(maxArg,true);
    }
    
    fun static ST_count2 count2(Stream maxArg,int holdArg) {
        return (new ST_count2).init(maxArg,holdArg);
    }
    
    fun static ST_count2 count2(int maxArg,int holdArg) {
        return (new ST_count2).init(maxArg,holdArg);
    }
    
    fun static ST_timed tcount(int maxArg,Stream timing) {
        return t(count(maxArg),timing);
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
    
    // shorthands for choice, without [], can be handy.
    fun static ST_choice choice(int a,int b) {
        return ST_choice.make([a,b]);
    }
    fun static ST_choice choice(float a,float b) {
        return ST_choice.make([a,b]);
    }
    fun static ST_choice choice(Stream a,Stream b) {
        return ST_choice.make([a,b]);
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
        walk.step(step);
        return walk;
    }
    
    fun static ST_boundedWalk boundedWalk(Stream minArg,Stream maxArg) {
        return boundedWalk(minArg,maxArg,rv(-0.01,0.01));
    }
    
    fun static ST_boundedWalk boundedWalk(float minArg,float maxArg,Stream step) {
        ST_boundedWalk walk;
        walk.min(minArg);
        walk.max(maxArg);
        walk.step(step);
        return walk;
    }
   
    fun static ST_boundedWalk boundedWalk(float minArg,float maxArg) {
        return boundedWalk(minArg,maxArg,rv(-0.01,0.01));
    }
    
    fun static ST_boundedMupWalk boundedMupWalk(Stream minArg,Stream maxArg,Stream stepArg) {
        ST_boundedMupWalk walk;
        walk.min(minArg);
        walk.max(maxArg);
        walk.step(stepArg);
        return walk;
    }
    
    fun static ST_boundedMupWalk boundedMupWalk(float minArg,float maxArg,Stream stepArg) {
        return boundedMupWalk(st(minArg),st(maxArg),stepArg);
    }
    
    fun static ST_boundedMupResetWalk boundedMupResetWalk(float minArg,float maxArg,Stream stepArg,Stream resetArg) {
        ST_boundedMupResetWalk walk;
        walk.step(stepArg);
        walk.min(minArg);
        walk.max(maxArg);
        walk.reset(resetArg);
        return walk;
    }
         
    fun static ST_walkList walkList(Stream values[],Stream step) {
        ST_walkList walk;
        walk.list(values);
        walk.step(step);
        return walk;
    }
    
    fun static ST_bouncyWalk bouncyWalk(float minArg,float maxArg,Stream stepArg) {
        ST_bouncyWalk walk;
        walk.min(minArg);
        walk.max(maxArg);
        walk.step(stepArg);
        return walk;
    }
    
    fun static ST_bouncyWalk bouncyWalk(int minArg,int maxArg,Stream stepArg) {
        ST_bouncyWalk walk;
        walk.min(minArg);
        walk.max(maxArg);
        walk.step(stepArg);
        return walk;
    }
    
    fun static ST_walkList walkList(float list[]) {
        ST_walkList walk;
        walk.init(list,choice(-1,1));
        return walk;
    }
    
    fun static ST_walkList walkList(float list[],Stream stepper) {
        ST_walkList walk;
        walk.init(list,stepper);
        return walk;
    }

    
    fun static ST_walkList walkList(int values[],Stream step) {
        ST_walkList walk;
        walk.list(cs.int2float(values));
        walk.step(step);
        return walk;
    }

    fun static ST_smartWalkList smartWalkList(float values[],Stream step,Stream direction) {
        return (new ST_smartWalkList).init(values,step,direction);
    }

    fun static ST_smartWalkList smartWalkList(int values[],Stream step,Stream direction) {
        return (new ST_smartWalkList).init(values,step,direction);
    }
    
    fun static ST_div div (Stream a,Stream b) {
        return (new ST_div).init(a,b) $ ST_div;
    }
    fun static ST_div div (Stream a,float b) {
        return (new ST_div).init(a,b) $ ST_div;
    }
    fun static ST_div div (Stream a,int b) {
        return (new ST_div).init(a,b) $ ST_div;
    }
    fun static ST_div div (float a,Stream b) {
        return (new ST_div).init(a,b) $ ST_div;
    }
    fun static ST_div div (int a,Stream b) {
        return (new ST_div).init(a,b) $ ST_div;
    }
    fun static ST_sum sum(Stream a,Stream b) {
        return (new ST_sum).init(a,b) $ ST_sum;
    }
    fun static ST_sum sum(float a,Stream b) {
        return (new ST_sum).init(a,b) $ ST_sum;
    }
    fun static ST_sum sum(int a,Stream b) {
        return (new ST_sum).init(a,b) $ ST_sum;
    }
    fun static ST_sub sub(Stream a,Stream b) {
        return (new ST_sub).init(a,b) $ ST_sub;
    }
    fun static ST_mup mup (Stream a,Stream b) {
        return (new ST_mup).init(a,b) $ ST_mup;
    }
    fun static ST_mup mup (Stream a,Stream b,Stream c) {
        return (new ST_mup).init( 
                   (new ST_mup).init(a,b) , c 
               ) $ ST_mup;
    }
    fun static ST_mup mup (int a,Stream b) {
        return (new ST_mup).init(a,b) $ ST_mup;
    }
    fun static ST_mup mup (float a,Stream b) {
        return (new ST_mup).init(a,b) $ ST_mup;
    }
    fun static ST_mup mup (Stream a,int b) {
        return (new ST_mup).init(a,b) $ ST_mup;
    }
    fun static ST_mup mup (Stream a,float b) {
        return (new ST_mup).init(a,b) $ ST_mup;
    }
    fun static ST_max max (float a,Stream b) {
        return (new ST_max).init(a,b) $ ST_max;
    }
    fun static ST_max max (Stream a,int b) {
        return (new ST_max).init(a,b) $ ST_max;
    }
    fun static ST_max max (Stream a,Stream b) {
        return (new ST_max).init(a,b) $ ST_max;
    }
    fun static ST_max max (Stream a,float b) {
        return (new ST_max).init(a,b) $ ST_max;
    }
    fun static ST_min min (Stream a,Stream b) {
        return (new ST_min).init(a,b) $ ST_min;
    }
    fun static ST_min min (Stream a,float b) {
        return (new ST_min).init(a,b) $ ST_min;
    }
    
    fun static ST_q q(Stream a,Stream b) {
        return (new ST_q).init(a,b) $ ST_q;
    }
    fun static ST_q q(Stream a,int b) {
        return (new ST_q).init(a,b) $ ST_q;
    }
    fun static ST_q q(Stream a,float b) {
        return (new ST_q).init(a,b) $ ST_q;
    }
    
    fun static ST_walkList lemming(Stream list[],Stream holdTimes) {
        ST_walkList walk;
        walk.init(list,hold(seq([-1,1]),holdTimes));
        return walk;
    }
    
    fun static ST_walkList lemming(float list[],Stream holdTimes) {
        ST_walkList walk;
        walk.init(list,hold(seq([-1,1]),holdTimes));
        return walk;
    }
    

    fun static ST_bus bus(Stream stream,string name) {
        return (new ST_bus).init(stream,name);
    }
    
    fun static ST_bus bus(string name) {
        return (new ST_bus).init(name);
    }
    
    fun static ST_timed tchoice(float list[],Stream timer) {
        return t(choice(list),timer);
    }   
    fun static ST_timed tchoice(Stream list[],Stream timer) {
        return t(choice(list),timer);
    } 
    fun static ST_timed tchoice(Stream list[],float timer) {
        return t(choice(list),timer);
    }
    fun static ST_timed tchoice(int list[],Stream timer) {
        return t(choice(list),timer);
    }
    
    fun static ST_loop loop (Stream src,Stream repeats,Stream length) {
        return (new ST_loop).init(src,repeats,length);
    }  

    fun static ST_wchoice wchoice(float valueWeights[][]) {
        return (new ST_wchoice).init(valueWeights);
    }
    
    fun static ST_wchoice wchoice(int valueWeights[][]) {
        return (new ST_wchoice).init(valueWeights);
    }
    
    fun static ST_wchoice weights(float valueWeights[][]) {
        return wchoice(valueWeights);
    }
    
    fun static ST_wchoice weights(int valueWeights[][]) {
        return (new ST_wchoice).init(valueWeights);
    }
    
    fun static ST_weightStream weightStream(Stream values[],int weights[]) {
        return (new ST_weightStream).init(values,weights);
    }
    
    fun static ST_weightStream weightStream(Stream values[],float weights[]) {
        return (new ST_weightStream).init(values,weights);
    }
    
    fun static ST_weightStream weightStream(float values[],Stream weights[]) {
        return (new ST_weightStream).init(values,weights);
    }
    
    fun static ST_trigger trigger(Stream arg) {
        return (new ST_trigger).init(arg);
    }
    
    fun static ST_mtof mtof(Stream arg) {
        return (new ST_mtof).init(arg);
    }
    
    fun static ST_floor floor(Stream arg) {
        return (new ST_floor).init(arg);
    }
    
    fun static ST_indexLin scan(float arrayArg[],Stream sizeArg,Stream offsetArg) {
        return (new ST_indexLin).init(arrayArg,sum(count2(sizeArg),offsetArg));
    }
    
    fun static ST_sine sine(float freqArg) {
        return (new ST_sine).init(freqArg);
    }
    
    fun static ST_sine sine(int freqArg) {
        return (new ST_sine).init(freqArg $ float);
    }
        
}

[st.st(1)] @=> st.globals;