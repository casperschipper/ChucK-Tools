/*

lot's of nice and juicy shortcuts, for example:

class Foo extends st {
    index(
        [rv(0,10),st(10)],
        hold(
           count(2),
           seq([rv(1,10),st(1)])
        )
    ).test();

minute => now;

TODO:
make a stream that interperets a Nan as ending it.
This way you could construct easily finite streams with weird logic.


*/



public class st {
    static Stream globals[];
    
    fun static float [] collect (Stream arg,int number) {
        return arg.collect( number );
    }
    
    fun static Stream st(float value) {
        ST_value stream;
        stream.init(value);
        return stream $ Stream;
    }
    
    fun static Stream st(Stream arg) {
        return arg;
    }
    
    fun static float take(Stream arg) {
        return arg.next();
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
    
    fun static ST_seq seq(float arg) {
        return ST_seq.make([arg]);
    }
    
    fun static ST_seq seq(int arg) {
        return ST_seq.make([arg]);
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
    
    fun static ST_latch latch(Stream valueArg, float repeatArg) {
        return (new ST_latch).init(valueArg,st(repeatArg));
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
    
    fun static ST_choice ch(int a) {
        return ST_choice.make([a]);
    }
    
    fun static ST_choice ch(float a) {
        return ST_choice.make([a]);
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
    
    fun static Stream bouncyListWalk(Stream listArg[],Stream stepperArg) {
        return index( listArg, bouncyWalk(0,listArg.cap(),stepperArg) );
    }
    
    fun static Stream bouncyListWalk(float listArg[],Stream stepperArg) {
        return index( listArg, bouncyWalk(0,listArg.cap(),stepperArg) );
    }
    
    fun static Stream bouncyListWalk(Stream list[])  {
        return index( list, bouncyWalk( st(0), st(list.cap()), st(1) ));
    }
    
    fun static Stream bouncyListWalk(float list[]) {
        return index( list, bouncyWalk(st(0),st(list.cap()), st(1) ));
    }
    
    fun static Stream boundedListWalk(Stream min,Stream max,float list[], Stream stepper) {
        return index( list, boundedWalk(min,max,stepper) );
    }
    
    fun static Stream boundedListWalk(Stream min,Stream max,Stream list[], Stream stepper) {
        return index( list, boundedWalk(min,max,stepper) );
    }
    
    fun static Stream boundedListWalk(float list[],Stream stepper) {
        return boundedListWalk(st(0),st(list.cap()),list,stepper);
    }
    
    fun static Stream boundedListWalk(float list[]) {
        return boundedListWalk(st(0),st(list.cap()),list,ch(-1,1));
    }
    
    fun static Stream boundedListWalk(Stream list[]) {
        return boundedListWalk(st(0),st(list.cap()),list,ch(-1,1));
    }
    
    fun static Stream boundedListWalk(Stream list[],Stream stepArg) {
        return boundedListWalk(st(0),st(list.cap()),list,stepArg);
    }
    
    fun static Stream listWalkLin(Stream list[],Stream stepArg) {
        return indexLin( list, boundedWalk(0,list.cap(),stepArg));
    }
    
    fun static Stream listWalkLin(float list[],Stream stepArg) {
        return indexLin( list, boundedWalk(0,list.cap(),stepArg));
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
    
    fun static ST_sum sum(float a,float b) {
        return (new ST_sum).init(a,b) $ ST_sum;
    }
    
    fun static ST_div div(float a,float b) {
        return (new ST_div).init(a,b) $ ST_div;
    }
    fun static ST_mup mup(float a,float b) {
        return (new ST_mup).init(a,b) $ ST_mup;
    }
    fun static ST_sub sub(float a,float b) {
        return (new ST_sub).init(a,b) $ ST_sub;
    }
    
    fun static ST_pow pow(float a,float b) {
        return (new ST_pow).init(a,b) $ ST_pow;
    }
    
    fun static ST_pow pow(Stream a,Stream b) {
        return (new ST_pow).init(a,b) $ ST_pow;
    }
    
    fun static ST_pow pow(Stream a, float b) {
        return (new ST_pow).init(a,b) $ ST_pow;
    }
    
    fun static ST_pow pow(float a,Stream b) {
        return (new ST_pow).init(a,b) $ ST_pow;
    }
    
    fun static Stream [] cdr(Stream arg[]) {
        Stream output[arg.cap()-1];
        for (0 => int i;i < output.cap();i++) {
            arg[i+1] @=> output[i];
        }
        return output;
    }
        
    
    fun static ST_sum sum(Stream arg[]) {
        arg.cap () => int n;
        
        if (n == 0) {
            return sum(st(0),0);
        } else if (n == 1) {
            return sum(arg[0],0);
        } else if (n == 2) {
            return sum(arg[0],arg[1]);
        } else {
            return sum(arg[0],sum(cdr(arg)));
        }
    }
    
    fun static ST_div div(Stream arg[]) {
        arg.cap () => int n;
        
        if (n == 0) {
            return div(st(0),1);
        } else if (n == 1) {
            return div(arg[0],1);
        } else if (n == 2) {
            return div(arg[0],arg[1]);
        } else {
            return div(arg[0],div(cdr(arg)));
        }
    }
    
    fun static ST_mup mup(Stream arg[]) {
        arg.cap () => int n;
        
        if (n == 0) {
            return mup(st(0),1);
        } else if (n == 1) {
            return mup(arg[0],1);
        } else if (n == 2) {
            return mup(arg[0],arg[1]);
        } else {
            return mup(arg[0],mup(cdr(arg)));
        }
    }
    
    fun static ST_sub sub(Stream arg[]) {
        arg.cap () => int n;
        
        if (n == 0) {
            return sub(st(0),1);
        } else if (n == 1) {
            return sub(arg[0],1);
        } else if (n == 2) {
            return sub(arg[0],arg[1]);
        } else {
            return sub(arg[0],sub(cdr(arg)));
        }
    }
    
        
        
   
    fun static ST_sub sub(Stream a,Stream b) {
        return (new ST_sub).init(a,b) $ ST_sub;
    }
    fun static ST_sub sub(float a,Stream b) {
        return (new ST_sub).init(a,b) $ ST_sub;
    }
    fun static ST_sub sub(Stream a,float b) {
        return (new ST_sub).init(a,b) $ ST_sub;
    }
    fun static ST_mup mup (Stream a,Stream b) {
        return (new ST_mup).init(a,b) $ ST_mup;
    }
    fun static ST_mup mup (Stream a,Stream b,Stream c) {
        return mup( mup(a,b) , c);
    }
    fun static ST_mup mup (Stream a,Stream b,int c) {
        return mup( mup(a,b) , c);
    }
    fun static ST_mup mup(Stream a,Stream b,float c) {
        return mup( mup(a,b) , c);
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
    
    fun static ST_sineseg sineseg( Stream arg ) {
        return (new ST_sineseg).init( arg );
    }
    
    fun static ST_sine sine(int freqArg) {
        return (new ST_sine).init(freqArg $ float);
    }
    
    fun static ST_sine sine(Stream streamArg) {
        return (new ST_sine).init(streamArg);
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
        return line(seq(0,1),seq(wavelength,0));
    }
    
    fun static ST_line phasor(Stream wavelength) {
        return line(seq(0,1),seq(wavelength,st(0)));
    }
    
    fun static ST_hzPhasor hzPhasor(Stream arg) {
        return (new ST_hzPhasor).init(arg);
    }
    
    fun static ST_tableCap tableCap(float tab[]) {
        return (new ST_tableCap).init(tab);
    }
    
    fun static ST_tableCap tableCap(int tab[]) {
        return (new ST_tableCap).init(tab);
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
                   t( ch(table), 
                      ch(table))));
    }
    
    fun static ST_timed fractRandTimer(float arg) {
        cs.grow(arg,2,15) @=> float table[];
        return t( ch(table) , 
        t( ch(table), 
        t( ch(table), ch(table)) ));
    }
    
    fun static ST_timed fractRandTimer(float table[]) {
        return t( ch(table) , 
                 t( ch(table) , 
                   t( ch(table) , 
                      ch(table))));
    }
    
    fun static ST_timed fractRandTimer(Stream arg) {
        return t( arg , t( arg , t( arg , arg )));
    }
                      
    
    fun static ST_timed fractRandTimer(float arg1, int arg2) {
        cs.grow(arg1,2,arg2) @=> float table[];
        return t( ch(table) , 
        t( ch(table), 
        t( ch(table), ch(table)) ));
    }
    
    // make a tuner that uses two tendency masks, one for octave, one for pitch within octave
    // then make a better value generator for tendency mask.
    
    fun static ST_index waveOsc( float table[], Stream freqArg ) {
        table.cap() => int size;
        mup( phasor(freqArg) , size ) @=> Stream @ idx;
        return index( table, idx );
    }
    
    /// linear
    fun static ST_indexLin waveOscL( float table[], Stream freqArg ) {
        table.cap() => int size;
        mup( phasor(freqArg) , size ) @=> Stream @ idx;
        return indexLin( table, idx );
    }
    
    fun static ST_replaceZero replaceZero( Stream in ) {
        return (new ST_replaceZero).init(in);
    }

    
    // more efficient ?
    fun static ST_wave wave(float tableArg[],Stream freqArg) {
        return (new ST_wave).init(tableArg,freqArg);
    }
    // reads a table with a certain frequency
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
    
    /* writes to table */
    fun static void writerShred(ST_write arg,Stream timerArg) {
        while(1) {
            arg.next();
            timerArg.next() * second => now;
        }
    }
    
    fun static ST_write write( float table[], Stream valueArg, Stream indexArg) {
        return (new ST_write).init(table,valueArg,indexArg);
    }
   

    fun static ST_write writeScheduled( Stream valueArg, Stream indexArg, float tableArg[], Stream timerArg ) {
        ST_write stream;
        stream.value(valueArg);
        stream.indexer(indexArg);
        stream.table(tableArg);
        spork ~ writerShred( stream, timerArg);
        return stream;
    }
    
    fun static ST_write writeScheduled( Stream valueArg, Stream indexArg, float tableArg[] ) {
        ST_write stream;
        stream.value(valueArg);
        stream.indexer(indexArg);
        stream.table(tableArg);
        spork ~ writerShred( stream, st(1) );
        return stream;
    }
    
    fun static ST_write writeScheduled( Stream valueArg, float tableArg[], Stream timerArg ) {
        ST_write stream;
        stream.value(valueArg);
        stream.indexer(count( tableArg.cap() ));
        stream.table(tableArg);
        spork ~ writerShred( stream, timerArg );
        return stream;
    }
    
    fun static ST_readWrite readWrite( float tableArg[], Stream readIndexArg,Stream valueArg, Stream writeIndexArg, int overwriteArg) {
        return (new ST_readWrite).init( tableArg, readIndexArg, valueArg , writeIndexArg, overwriteArg);
    }
    
    fun static ST_readWrite readWrite( float tableArg[], Stream readIndexArg,Stream valueArg, Stream writeIndexArg) {
        // write and read synchronized.
        return (new ST_readWrite).init( tableArg, readIndexArg, valueArg , writeIndexArg, 0);
    }
    
    fun static ST_readWrite readWrite(float tableArg[],  Stream readIndexArg, Stream valueArg) {
        // write sequentially.
        return (new ST_readWrite).init( tableArg, readIndexArg, valueArg, count( tableArg.cap() ),0);
    }
    
    fun static ST_onePole onepole(Stream arg,Stream fArg) {
        return (new ST_onePole).init(arg,fArg);
    }
    
    /* prints the output to the log */
    fun static ST_monitor monitor( Stream arg ) {
        return (new ST_monitor).init(arg);
    }
    
    /* stream gets repeated weightone in weighttwo times */
    fun static Stream skip (Stream arg,int weightone,int weighttwo) {
        return hold( arg , weights([[1,weightone],[2,weighttwo]]) );
    }
    
    fun static ST_normStream normStream (Stream arg[]) {
        return (new ST_normStream).init(arg);
    }
    
    fun static void test (Stream arg) {
        return arg.test();
    }
    
    fun static Schedule schedule (Stream procArg,Stream timeArg) {
        return (new Schedule).init(procArg,timeArg);
    }
        
}



[st.st(1)] @=> st.globals;