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
    
    fun static ST_linseg linseg(Stream startArg,Stream endArg,Stream stepsArg,int holdArg) {
        return (new ST_linseg)
        .start(startArg)
        .end(endArg)
        .steps(stepsArg)
        .holdMode(holdArg);
    }
    
    fun static ST_linseg linseg(Stream startArg,Stream endArg,float stepsArg,int holdArg) {
        return (new ST_linseg)
        .start(startArg)
        .end(endArg)
        .steps(stepsArg)
        .holdMode(holdArg);
    }
    
    fun static ST_linseg linseg(Stream startArg,Stream endArg,Stream stepsArg) {
        return (new ST_linseg)
        .start(startArg)
        .end(endArg)
        .steps(stepsArg)
        .holdMode(1);
    }
    
    fun static ST_linseg linseg(Stream startArg,Stream endArg,Stream stepsArg,int holdArg) {
        return (new ST_linseg)
        .start(startArg)
        .end(endArg)
        .steps(stepsArg)
        .holdMode(holdArg);
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
    
    fun static ST_index index(int seqArg[],Stream idxArg,int holdArg) {
        return index(seqArg,idxArg).holdMode(holdArg);
    }
    
    fun static ST_index index(float seqArg[],Stream idxArg,int holdArg) {
        return index(seqArg,idxArg).holdMode(holdArg);
    }
    
    fun static ST_index index(Stream seqArg[],Stream idxArg,int holdArg) {
        return index(seqArg,idxArg).holdMode(holdArg);
    }
    
    fun static ST_indexLin indexLin(float seq[],Stream indexer) {
        return (new ST_indexLin).init(seq,indexer);
    }
    fun static ST_indexLin indexLin(int seq[],Stream indexer) {
        return (new ST_indexLin).init(seq,indexer);
    }
    
    fun static ST_indexLin indexLin(Stream seq[],Stream indexer) {
        return (new ST_indexLin).init(seq,indexer);
    }
    
    fun static ST_indexLin indexLin(int seq[],Stream indexer,int holdArg) {
        return indexLin(seq,indexer).holdMode(holdArg);
    }
    
    fun static ST_indexLin indexLin(float seq[],Stream indexer,int holdArg) {
        return indexLin(seq,indexer).holdMode(holdArg);
    }
    
    fun static ST_indexLin indexLin(Stream seq[],Stream indexer,int holdArg) {
        return indexLin(seq,indexer).holdMode(holdArg);
    }
    
    fun static ST_seq seq(float seq[]) {
        return ST_seq.make(seq);
    } 
    
    fun static ST_seq seq(float a,float b) {
        return ST_seq.make([a,b]);
    }
    
    fun static ST_seq seq(Stream a,Stream b) {
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
    
    fun static ST_seq seq(float seq[],Stream low,Stream high) {
        return (new ST_seq).init(seq).min(low).max(high);
    }
    fun static ST_seq seq(int seq[],Stream low,Stream high) {
        return (new ST_seq).init(seq).min(low).max(high);
    }
    fun static ST_seq seq(Stream seq[],Stream low,Stream high) {
        return (new ST_seq).init(seq).min(low).max(high);
    }

        
    
    fun static ST_rv rv(float minArg,float maxArg) {
        return (new ST_rv).init(minArg,maxArg) $ ST_rv;
    }
    fun static ST_rv rv(Stream minArg,Stream maxArg) {
        return (new ST_rv).init(minArg,maxArg) $ ST_rv;
    }
    fun static ST_rv rv(float minArg,Stream maxArg) {
        return (new ST_rv).init(minArg,maxArg) $ ST_rv;
    }
    fun static ST_rv rv(Stream minArg,float maxArg) {
        return (new ST_rv).init(minArg,maxArg) $ ST_rv;
    }
    
    fun static ST_mtof rf(Stream minArg,Stream maxArg) {
        return mtof(rv(minArg,maxArg));
    }
    fun static ST_mtof rf(float minArg,Stream maxArg) {
        return mtof(rv(minArg,maxArg));
    }
    fun static ST_mtof rf(Stream minArg,float maxArg) {
        return mtof(rv(minArg,maxArg));
    }
    fun static ST_mtof rf(float minArg,float maxArg) {
        return mtof(rv(minArg,maxArg));
    }
    
    fun static ST_exprv exprv(float minArg,float maxArg,float expArg) {
        return (new ST_exprv).low(minArg).high(maxArg).exp(expArg);
    }
    fun static ST_exprv exprv(Stream minArg,Stream maxArg,float expArg) {
        return (new ST_exprv).low(minArg).high(maxArg).exp(expArg);
    }
    fun static ST_exprv exprv(Stream minArg,float maxArg,float expArg) {
        return (new ST_exprv).low(minArg).high(maxArg).exp(expArg);
    }
    fun static ST_exprv exprv(float minArg,float maxArg,float expArg) {
        return (new ST_exprv).low(minArg).high(maxArg).exp(expArg);
    }
    fun static ST_exprv exprv(float minArg,float maxArg,Stream expArg) {
        return (new ST_exprv).low(minArg).high(maxArg).exp(expArg);
    }
    fun static ST_exprv exprv(float minArg,Stream maxArg,float expArg) {
        return (new ST_exprv).low(minArg).high(maxArg).exp(expArg);
    }
    fun static ST_exprv exprv(float minArg,Stream maxArg,Stream expArg) {
        return (new ST_exprv).low(minArg).high(maxArg).exp(expArg);
    }
    fun static ST_exprv exprv(Stream minArg,Stream maxArg,Stream expArg) {
        return (new ST_exprv).low(minArg).high(maxArg).exp(expArg);
    }
    
    
    fun static ST_div inv(Stream in) {
        return div(1.0,in);
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
    
    fun static ST_timed timed(Stream str,Stream timing,int holdArg) {
        return (new ST_timed).init(str,timing,holdArg);
    }
        
    
    fun static ST_timed t(Stream str,Stream timing) {
        return timed(str,timing);
    }
    
    fun static ST_timed t(Stream str,Stream timing,int holdArg) {
        return timed(str,timing,holdArg);
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
    
    fun static ST_repeat hold(Stream value,Stream repetition,int holdArg) {
        return ST_repeat.make(value,repetition).holdMode(holdArg);
    }
    
    fun static ST_repeat hold(Stream value,int rep,int holdArg) {
        return ST_repeat.make(value,st(rep)).holdMode(holdArg);
    }
    
    fun static ST_repeat hold(Stream value,int rep) {
        return ST_repeat.make(value,st(rep));
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
    fun static ST_choice choice(float a,Stream b) {
        return ST_choice.make([st(a),b]);
    }
    fun static ST_choice choice(Stream a,float b) {
        return ST_choice.make([a,st(b)]);
    }
    
    fun static ST_choice ch(float a,float b) {
        return choice(a,b);
    }
    
    fun static ST_choice ch(Stream a,Stream b) {
        return choice(a,b);
    }
    
    fun static ST_choice ch(Stream a,float b) {
        return choice(a,b);
    }
    
    fun static ST_choice ch(float a,Stream b) {
        return choice(a,b);
    }
    
    fun static ST_choice ch(float a[]) {
        return choice(a);
    }
    
    fun static ST_choice ch(Stream a[]) {
        return choice(a);
    }
    
    fun static ST_choice ch(int a[]) {
        return choice(a);
    }
    
    fun static ST_maskedChoice maskedChoice(int arg[],Stream minArg,Stream maxArg) {
        return 
        (new ST_maskedChoice)
        .init(arg)
        .min(minArg)
        .max(maxArg);
    }
 
    fun static ST_maskedChoice maskedChoice(float arg[],Stream minArg,Stream maxArg) {
        return (new ST_maskedChoice)
        .init(arg)
        .min(minArg)
        .max(maxArg);
    }   
    
    fun static ST_maskedChoice maskedChoice(Stream arg[],Stream minArg,Stream maxArg) {
        return (new ST_maskedChoice).init(arg).min(minArg).max(maxArg);
    }   
        
    
    fun static ST_line line(Stream value,Stream timing) {
        ST_line stream;
        stream.init(value,timing);
        return stream;
    }
    
    fun static ST_line line(Stream value,Stream timing,int holdArg) {
        ST_line stream;
        stream.init(value,timing).holdMode(holdArg);
        return stream;
    }
    
    fun static ST_mupWalk mupWalk(float value,Stream step) {
        ST_mupWalk walk;
        walk.init(value,step);
        return walk;
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
    
    fun static ST_bumpyWalk bumpyWalk(Stream minArg,Stream maxArg,Stream stepArg) {
        ST_bumpyWalk walk;
        walk.min(minArg);
        walk.max(maxArg);
        walk.step(stepArg);
        return walk;
    }
    fun static ST_bumpyWalk bumpyWalk(float minArg,float maxArg,Stream stepArg) {
        ST_bumpyWalk walk;
        walk.min(minArg);
        walk.max(maxArg);
        walk.step(stepArg);
        return walk;
    }
    fun static ST_bumpyWalk bumpyWalk(float minArg,Stream maxArg,Stream stepArg) {
        ST_bumpyWalk walk;
        walk.min(minArg);
        walk.max(maxArg);
        walk.step(stepArg);
        return walk;
    }
    fun static ST_bumpyWalk bumpyWalk(Stream minArg,float maxArg,Stream stepArg) {
        ST_bumpyWalk walk;
        walk.min(minArg);
        walk.max(maxArg);
        walk.step(stepArg);
        return walk;
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
    
    fun static ST_boundedMupResetWalk boundedMupResetWalk(Stream minArg,Stream maxArg,Stream stepArg,Stream resetArg) {
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
    
    fun static ST_walkList walkList(Stream values[]) {
        return walkList(values,ch(-1,1));
    }
    
    fun static ST_walkList walkList(int values[]) {
        ST_walkList walk;
        walk.list(values);
        walk.step(ch(-1,1));
        return walk;
    }
    
    fun static ST_walkList walkList(int values[],Stream step) {
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
    
    fun static ST_bouncyWalk bouncyWalk(Stream minArg,Stream maxArg,Stream stepArg) {
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
    
    fun static ST_smartWalkList smartWalkList(Stream values[],Stream step,Stream direction) {
        return (new ST_smartWalkList).init(values,step,direction);
    }
    
    fun static Stream bouncyListWalk(Stream minArg,Stream maxArg,float list[],Stream step) {
        return index( list , bouncyWalk(minArg,maxArg,step) );
    }
    
    fun static Stream bouncyListWalk(Stream minArg,Stream maxArg,Stream list[],Stream step) {
        return index( list , bouncyWalk(minArg,maxArg,step) );
    }
    
    fun static Stream bouncyListWalk(int minArg,int maxArg,Stream list[],Stream step) {
        return index( list , bouncyWalk(st(minArg),st(maxArg),step) );
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
    fun static ST_sum sum(Stream a,Stream b) {
        return (new ST_sum).init(a,b) $ ST_sum;
    }
    fun static ST_sum sum(float a,Stream b) {
        return (new ST_sum).init(a,b) $ ST_sum;
    }
    fun static ST_sum sum(Stream a,float b) {
        return (new ST_sum).init(a,b) $ ST_sum;
    } 
   
    fun static ST_sub sub(Stream a,Stream b) {
        return (new ST_sub).init(a,b) $ ST_sub;
    }
    fun static ST_mup mup (Stream a,Stream b) {
        return (new ST_mup).init(a,b) $ ST_mup;
    }
    fun static ST_mup mup (Stream a,Stream b,Stream c) {
        return mup( mup( a, b ), c);
    }
    fun static ST_mup mup (Stream a,Stream b,int c) {
        return mup( mup(a,b),c);
    }
    fun static ST_mup mup(Stream a,Stream b,float c) {
        return mup( mup(a,b,),c);
    }
    fun static ST_mup mup (Stream a,Stream b,Stream c) {
        return (new ST_mup).init( 
                   (new ST_mup).init(a,b) , c 
               ) $ ST_mup;
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
    
    fun static ST_modulo modulo(Stream a,Stream b) {
        return (new ST_modulo).init(a,b) $ ST_modulo;
    }
    fun static ST_modulo modulo(float a,Stream b) {
        return (new ST_modulo).init(a,b) $ ST_modulo;
    }
    fun static ST_modulo modulo(Stream a,float b) {
        return (new ST_modulo).init(a,b) $ ST_modulo;
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
    
    fun static ST_walk walk(float start,Stream step) {
        ST_walk stream;
        stream.init(start,step);
        return stream;
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
    
    fun static ST_weightStream weightStream(Stream values[],Stream weights[]) {
        return (new ST_weightStream).init(values,weights);
    }
    
    fun static ST_trigger trigger(Stream arg) {
        return (new ST_trigger).init(arg);
    }
    
    fun static ST_mtof mtof(Stream arg) {
        return (new ST_mtof).init(arg);
    }
    
    fun static ST_ftom ftom(Stream arg) {
        return (new ST_ftom).init(arg);
    }
    
    fun static ST_mtor mtor(Stream arg) {
        return (new ST_mtor).init(arg);
    }
    
    fun static ST_mtosamps mtosamps(Stream arg) {
        return (new ST_mtosamps).init(arg);
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
    
    fun static ST_greater greater(Stream a,Stream b) {
        return (new ST_greater).init(a,b) $ ST_greater;
    }
    
    fun static ST_bitAnd bitAnd(Stream a,Stream b) {
        return (new ST_bitAnd).init(a,b) $ ST_bitAnd;
    }
    
    fun static ST_bitAnd bitAnd(Stream a,int b) {
        return (new ST_bitAnd).init(a,b) $ ST_bitAnd;
    }
    
    fun static ST_bitOr bitOr(Stream a,Stream b) {
        return (new ST_bitOr).init(a,b) $ ST_bitOr;
    }
    
    fun static ST_bitOr bitOr(Stream a,int b) {
        return (new ST_bitOr).init(a,b) $ ST_bitOr;
    }
    
    fun static ST_bitXor bitXor(Stream a,Stream b) {
        return (new ST_bitXor).init(a,b) $ ST_bitXor;
    }
    
    fun static ST_bitXor bitXor(Stream a,int b) {
        return (new ST_bitXor).init(a,b) $ ST_bitXor;
    }
    
    fun static ST_bitShiftL bitShiftL(Stream a, int b) {
        return (new ST_bitShiftL).init(a,b) $ ST_bitShiftL;
    }   
    fun static ST_bitShiftL bitShiftL(Stream a, Stream b) {
        return (new ST_bitShiftL).init(a,b) $ ST_bitShiftL;
    }
    fun static ST_bitShiftR bitShiftR(Stream a, int b) {
        return (new ST_bitShiftR).init(a,b) $ ST_bitShiftR;
    }
    fun static ST_bitShiftR bitShiftR(Stream a, Stream b) {
        return (new ST_bitShiftR).init(a,b) $ ST_bitShiftR;
    }
    
    fun static ST_equal equal(Stream a,Stream b) {
        return (new ST_equal).init(a,b) $ ST_equal;
    }
    
    fun static ST_equal equal(Stream a,int b) {
        return (new ST_equal).init(a,b) $ ST_equal;
    }
        
    fun static ST_equal bitMask(Stream a,int b) {
        return equal(bitAnd(a,b),b) ;
    }
    
    fun static ST_equal bitMask(Stream a,Stream b) {
        return equal(bitAnd(a,b),b) ;
    }
    
    
    fun static ST_line phasor(float wavelength) {
        return line(seq(-1,1),seq(wavelength,0));
    }
    
    fun static ST_line phasor(Stream wavelength) {
        return line(seq(-1,1),seq(wavelength,st(0)));
    }
    
    fun static ST_divider divider(float dividend,float divisor) {
        return (new ST_divider).dividend(dividend).divisor(divisor);
    }
    
    fun static ST_divider divider(Stream dividend,float divisor) {
        return (new ST_divider).dividend(dividend).divisor(divisor);
    }
    
    fun static ST_divider divider(Stream dividend,Stream divisor) {
        return (new ST_divider).dividend(dividend).divisor(divisor);
    }
    
    fun static ST_divider divider(float dividend,Stream divisor) {
        return (new ST_divider).dividend(dividend).divisor(divisor);
    }  
    
    fun static ST_sum scale(Stream input,float range,float offset) {
        return sum( mup(input,range), offset );
    }
    
    fun static ST_sum scale(Stream input,Stream range,float offset) {
        return sum( mup(input,range), offset );
    }
    
    fun static ST_sum scale(Stream input,Stream range,Stream offset) {
        return sum( mup(input,range), offset );
    }
    fun static ST_sum scale(Stream input,float range,Stream offset) {
        return sum( mup(input,range), offset );
    }
    
    // optimized scaling
    fun static ST_scale2 scaler(Stream input,float outMin,float outMax) {
        return (new ST_scale2).init(input,outMin,outMax);
    }
    
    fun static ST_scale2 scaler(Stream input,float inMin,float inMax,Stream outMin,Stream outMax) {
        return (new ST_scale2).init(input,inMin,inMax,outMin,outMax);
    }
    
    fun static ST_scale2 scaler(Stream input,float inMin,float inMax,float outMin,float outMax) {
        return (new ST_scale2).init(input,inMin,inMax,st(outMin),st(outMax));
    }
    
    fun static ST_scale2 scaler(Stream input,float outMin,float outMax) {
        return (new ST_scale2).init(input,outMin,outMax);
    }
    
    // scales (not optimized(.
    fun static ST_scale linlin(Stream input,float minIn,float maxIn,Stream minOut,Stream maxOut) {
        return (new ST_scale).init(input,st(minIn),st(maxIn),minOut,maxOut,st(1.0));
    }
    
    fun static ST_scale linlin(Stream input,Stream minIn,Stream maxIn,Stream minOut,Stream maxOut) {
        return (new ST_scale).init(input,minIn,maxIn,minOut,maxOut,st(1.0));
    }
    
    fun static ST_scale linexp(Stream input,float minIn,float maxIn,Stream minOut,Stream maxOut,Stream expArg) {
        return (new ST_scale).init(input,st(minIn),st(maxIn),minOut,maxOut,expArg);
    }
    
    fun static ST_scale linexp(Stream input,Stream minIn,Stream maxIn,Stream minOut,Stream maxOut,float expArg) {
        return (new ST_scale).init(input,minIn,maxIn,minOut,maxOut,st(expArg));
    }
    
    fun static ST_scale linexp(Stream input,Stream minIn,Stream maxIn,Stream minOut,Stream maxOut,Stream expArg) {
        return (new ST_scale).init(input,minIn,maxIn,minOut,maxOut,expArg);
    }
    
    fun static ST_scale linexp(Stream input,float minIn,float maxIn,float minOut,float maxOut,float expArg) {
        return (new ST_scale).init(input,st(minIn),st(maxIn),st(minOut),st(maxOut),st(expArg));
    }
        
    fun static ST_ugen ugen(UGen arg) {
        return (new ST_ugen).init(arg);
    }
    
    fun static ST_clip clip(Stream inputArg,Stream minArg,Stream maxArg) {
        return (new ST_clip).input(inputArg).min(minArg).max(maxArg);
    }
    fun static ST_clip clip(Stream inputArg,float minArg,float maxArg) {
        return (new ST_clip).input(inputArg).min(minArg).max(maxArg);
    }
    fun static ST_clip clip(Stream inputArg,Stream minArg,float maxArg) {
        return (new ST_clip).input(inputArg).min(minArg).max(maxArg);
    }
    fun static ST_clip clip(Stream inputArg,float minArg,Stream maxArg) {
        return (new ST_clip).input(inputArg).min(minArg).max(maxArg);
    }
    
    fun static ST_tanh tanh(Stream inputArg) {
        return (new ST_tanh).input(inputArg);
    }

    
    fun static ST_clip clip(Stream inputArg) {
        return (new ST_clip).input(inputArg).min(-1).max(1);
    }
    
    fun static ST_funkStream funkStream(Funk funkArg,Stream xArg) {
        return (new ST_funkStream).funk(funkArg).x(xArg);
    }
    
    fun static ST_timed fractRandTimer() {
        cs.grow(0.0001,2,15) @=> float table[];
        return t( ch(table) , 
        t( ch(table), 
        t( ch(table), ch(table)) ));
    }
    
    fun static ST_timed fractRandTimer(float arg) {
        cs.grow(arg,2,15) @=> float table[];
        return t( ch(table) , 
        t( ch(table), 
        t( ch(table), ch(table)) ));
    }
    
    fun static ST_index waveOsc( float table[], Stream freqArg ) {
        table.cap() => int size;
        line( seq(0,size-1),seq(div(1.0,freqArg),st(0)) ) @=> Stream @ idx;
        return index( table, idx );
    }
    
    fun static ST_indexLin waveOscL( float table[], Stream freqArg ) {
        table.cap() => int size;
        line( seq(0,size-1),seq(div(1.0,freqArg),st(0)) ) @=> Stream @ idx;
        return indexLin( table, idx );
    }
    
    // more efficient ?
    fun static ST_wave wave(float tableArg[],Stream freqArg) {
        return (new ST_wave).init(tableArg,freqArg);
    }
    
    fun static ST_wave wave(float tableArg[],float freqArg) {
        return (new ST_wave).init(tableArg,st(freqArg));
    }
    
    
    // resets a walk to source arg, every reps
    fun static ST_reset reset( ST_walk walkArg , Stream sourceArg, Stream repsArg ) {
        return (new ST_reset).init(walkArg,sourceArg,repsArg);
    }
    
    // resets a walk to source every time 'timer' has passed
    fun static ST_timedReset timedReset( ST_walk walkArg , Stream sourceArg, Stream timerArg ) {
        return (new ST_timedReset).init(walkArg,sourceArg,timerArg);
    }
}

[st.st(1)] @=> st.globals;