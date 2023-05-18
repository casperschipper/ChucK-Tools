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
    
    /*
    fun static ST_linseg linseg(Stream startArg,Stream endArg,Stream stepsArg,int holdArg) {
        return (new ST_linseg)
        .start(startArg)
        .end(endArg)
        .steps(stepsArg)
        .holdMode(holdArg);
    }
    */
/* TODO TODO TODO
    fun static ST_index index(Stream seq[],int idx) {
        if (idx > seq.cap() || idx < 0) {
            0 => idx;
        }
        return ST_index.make(seq,idx);
    }
    
    fun static Stream index(float seq[],int idx) {
        return ST_index index(
    }*/
    
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
    
    fun static ST_modIndex modIndex(float t1[], float t2[],Stream in) {
        return (new ST_modIndex).init(in,t1,t2);
    }
    
    fun static ST_mupModIndex mupModIndex(float t1[], float t2[],Stream in) {
        return (new ST_mupModIndex).init(in,t1,t2);
    }
    
    fun static ST_modIndex modIndex(Stream in,float t1[], float t2[]) {
        return (new ST_modIndex).init(in,t1,t2);
    }
    
    fun static ST_mupModIndex mupModIndex(Stream in,float t1[], float t2[]) {
        return (new ST_mupModIndex).init(in,t1,t2);
    }
    
    fun static ST_seq seq(float seq[]) {
        return ST_seq.make(seq);
    } 
    
    fun static ST_seq seq(float a,float b) {
        return ST_seq.make([a,b]);
    }
    
    /*
    fun static ST_seq seq(Stream a,Stream b) {
        return ST_seq.make([a,b]);
    }*/
    
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
    fun static ST_seq seq(Stream arg) {
        return (new ST_seq).init([arg]);
    }
    
    /*fun static ST_seq seq(float arg) {
        return (new ST_seq).init([arg]);
    }*/
    
    fun static ST_compose compose(Stream inArg,Stream segArg) {
        return (new ST_compose).init(inArg,segArg);
    }

    fun static ST_rv rv(float minArg,float maxArg) {
        ST_rv rv;
        rv.init(minArg,maxArg);
        return rv;
    }
    fun static ST_rv rv(Stream minArg,Stream maxArg) {
        ST_rv rv;
        rv.init(minArg,maxArg);
        return rv;
    }
    fun static ST_rv rv(float minArg,Stream maxArg) {
       ST_rv rv;
        rv.init(minArg,maxArg);
        return rv;
    }
    fun static ST_rv rv(Stream minArg,float maxArg) {
        ST_rv rv;
        rv.init(minArg,maxArg);
        return rv;
    }
    
    fun static ST_floor rvi(Stream minArg,Stream maxArg) {
        return floor(rv(minArg,sum(maxArg,1)));
    }
    
    fun static ST_floor rvi(float minArg,Stream maxArg) {
        return floor(rv(minArg,sum(maxArg,1)));
    }
    
    fun static ST_floor rvi(Stream minArg,float maxArg) {
        return floor(rv(minArg,maxArg+1.0));
    }
    
    fun static ST_floor rvi(float minArg,float maxArg) {
        return floor(rv(minArg,maxArg+1.0));
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
    
    fun static ST_diff diff(Stream in) {
        return (new ST_diff).init(in);
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
    
    fun static ST_choice ch(Stream a) {
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
    
    fun static ST_line line(Stream value,float timing) {
        ST_line stream;
        stream.init(value,st(timing));
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
    
    fun static ST_boundedMupWalk boundedMupWalk(Stream minArg,Stream maxArg,Stream stepArg,float start) {
        ST_boundedMupWalk walk;
        walk.min(minArg);
        walk.max(maxArg);
        walk.step(stepArg);
        start => walk._value;
        return walk;
    }
    
    fun static ST_boundedMupWalk boundedMupWalk(float minArg,float maxArg,Stream stepArg, float start) {
        return boundedMupWalk(st(minArg),st(maxArg),stepArg,start);
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
    
    /*
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
    */
    
    fun static ST_index walkList(int values[], Stream step) {
        return index(values,boundedWalk(0,values.cap()-1,step));
    }
    
    fun static ST_index walkList(float values[], Stream step) {
        return index(values,boundedWalk(0,values.cap()-1,step));
    }
    
    fun static ST_index walkList(float values[]) {
        return index(values,boundedWalk(0,values.cap()-1,ch(-1,1)));
    }
    
    fun static ST_index walkList(int values[]) {
        return index(values,boundedWalk(0,values.cap()-1,ch(-1,1)));
    }
    
    fun static ST_index walkList(Stream values[]) {
        return index(values,boundedWalk(0,values.cap()-1,ch(-1.1)));
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
    
    fun static ST_latchWalk latchWalk(Stream sourceArg, Stream stepArg) {
        ST_latchWalk stream;
        stream.init(sourceArg,stepArg);
        return stream;
    }
    
    fun static ST_guardedWalk guardedWalk(float startArg,Guard guardsArg[]) {
        return (new ST_guardedWalk).init(startArg,guardsArg);
    }
    
    fun static ST_apply apply(Stream inArg,Guard guards[]) {
        return (new ST_apply).init(inArg,guards);
    }
    
    fun static ST_apply apply(Stream inArg, Guard guard) {
        return apply(inArg,[guard]);
    }
    
    fun static Guard guard(ST_operator funktorArg) {
        return (new Guard).init(funktorArg);
    }
    
    fun static Guard guardTest(ST_operator testArg,ST_operator funktorArg) {
        return (new GuardTest).init(testArg,funktorArg);
    }
    
    fun static Guard guardTestValue(ST_operator testArg,Stream valueArg) {
        return (new GuardTestValue).init(testArg,valueArg);
    }
    
    fun static Guard guardControl(Stream controlArg,ST_operator funktorArg) {
        return (new GuardControl).init(controlArg,funktorArg);
    }
    
    fun static Guard otherwise(ST_operator valueArg) {
        return (new Guard).init(valueArg);
    }
    
    fun static ST_collatz collatz(Stream inputArg) {
        return (new ST_collatz).init(inputArg);
    }
    
    fun static ST_div div (Stream a,Stream b) {
        return ST_div st_div; st_div.init(a,b); return st_div;
    }
    fun static ST_div div (Stream a,float b) {
        return ST_div st_div; st_div.init(a,b); return st_div;
    }
    fun static ST_div div (Stream a,int b) {
        return ST_div st_div; st_div.init(a,b); return st_div;
    }
    fun static ST_div div (float a,Stream b) {
        return ST_div st_div; st_div.init(a,b); return st_div;
    }
    fun static ST_sum sum(Stream a,Stream b) {
        return ST_sum st_sum; st_sum.init(a,b); return st_sum;
    }
    fun static ST_sum sum(float a,Stream b) {
        return ST_sum st_sum; st_sum.init(a,b); return st_sum;
    }
    fun static ST_sum sum(Stream a,float b) {
        return ST_sum st_sum; st_sum.init(a,b); return st_sum;
    } 
    
    fun static ST_sum sum(float a,float b) {
        return ST_sum st_sum; st_sum.init(a,b); return st_sum;
    }
    /* ST_smaller */
    fun static ST_smaller smaller(Stream a,Stream b) {
        return ST_smaller st_smaller; st_smaller.init(a,b); return st_smaller;
    }
    fun static ST_smaller smaller(float a,Stream b) {
        return ST_smaller st_smaller; st_smaller.init(a,b); return st_smaller;
    }
    fun static ST_smaller smaller(Stream a,float b) {
        return ST_smaller st_smaller; st_smaller.init(a,b); return st_smaller;
    } 
    
    fun static ST_smaller smaller(float a,float b) {
        return ST_smaller st_smaller; st_smaller.init(a,b); return st_smaller;
    }
    
    /* ST_bigger */
    fun static ST_bigger bigger(Stream a,Stream b) {
        return ST_bigger st_bigger; st_bigger.init(a,b); return st_bigger;
    }
    fun static ST_bigger bigger(float a,Stream b) {
        return ST_bigger st_bigger; st_bigger.init(a,b); return st_bigger;
    }
    fun static ST_bigger bigger(Stream a,float b) {
        return ST_bigger st_bigger; st_bigger.init(a,b); return st_bigger;
    } 
    
    fun static ST_bigger bigger(float a,float b) {
        return ST_bigger st_bigger; st_bigger.init(a,b); return st_bigger;
    }

    
    fun static ST_div div(float a,float b) {
        return ST_div st_div; st_div.init(a,b); return st_div;
    }
    fun static ST_mup mup(float a,float b) {
        ST_mup st_mup; st_mup.init(a,b);return st_mup;
    }
    fun static ST_sub sub(float a,float b) {
        ST_sub x; x.init(a,b); return x;
    }
    
    fun static ST_pow pow(float a,float b) {
        ST_pow x; x.init(a,b); return x;
    }
    
    fun static ST_pow pow(Stream a,Stream b) {
        ST_pow x; x.init(a,b); return x;
    }
    
    fun static ST_pow pow(Stream a, float b) {
        ST_pow x; x.init(a,b); return x;
    }
    
    fun static ST_pow pow(float a,Stream b) {
        ST_pow x; x.init(a,b); return x;
    }
    
    fun static ST_bind bind(Stream a, Stream b) {
        ST_bind x; x.init(a,b); return x;
    }
    
    fun static Stream [] cdr(Stream arg[]) {
        Stream output[arg.cap()-1];
        for (0 => int i;i < output.cap();i++) {
            arg[i+1] @=> output[i];
        }
        return output;
    }
        
    
    fun static ST_sum sum(Stream arg[]) {
        // handling summing arrays:
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
    
    // curried operators (for use in guards)
    fun static ST_sub sub(Stream arg) {
        ST_sub x; x.init(arg); return x;
    }   
    fun static ST_sum sum(Stream arg) {
        ST_sum x; x.init(arg); return x;
    } 
    fun static ST_div div(Stream arg) {
        ST_div x; x.init(arg);return x;   
    }
    fun static ST_mup mup(Stream arg) {
        ST_mup x; x.init(arg); return x;  
    }
    fun static ST_bigger bigger(Stream arg) {
        ST_bigger x; x.init(arg); return x;   
    }
    fun static ST_smaller smaller(Stream arg) {
        ST_smaller x; x.init(arg); return x;
    }
    fun static ST_modulo modulo(Stream arg) {
        ST_modulo x; x.init(arg); return x;
    }
    // FLOAT ARGS
    fun static ST_sub sub(float arg) {
        ST_sub x; x.init(arg); return x;
    }   
    fun static ST_sum sum(float arg) {
        ST_sum x; x.init(arg); return x;
    } 
    fun static ST_div div(float arg) {
        ST_div x; x.init(arg);return x;   
    }
    fun static ST_mup mup(float arg) {
        ST_mup x; x.init(arg); return x;  
    }
    fun static ST_bigger bigger(float arg) {
        ST_bigger x; x.init(arg); return x;   
    }
    fun static ST_smaller smaller(float arg) {
        ST_smaller x; x.init(arg); return x;
    }
    fun static ST_modulo modulo(float arg) {
        ST_modulo x; x.init(arg); return x;
    }
   
    fun static ST_sub sub(Stream a,Stream b) {
        ST_sub x; x.init(a,b); return x;
    }
    fun static ST_sub sub(float a,Stream b) {
        ST_sub x; x.init(a,b); return x;
    }
    fun static ST_sub sub(Stream a,float b) {
        ST_sub x; x.init(a,b); return x;
    }
    fun static ST_mup mup (Stream a,Stream b) {
        ST_mup st_mup; st_mup.init(a,b);return st_mup;
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
    
    /*
    fun static ST_mup mup (Stream a,Stream b,Stream c) {
        return (new ST_mup).init( 
                   (new ST_mup).init(a,b) , c 
               ) $ ST_mup;
    }
    */
    
    fun static ST_mup mup (float a,Stream b) {
        ST_mup st_mup; st_mup.init(a,b);return st_mup;
    }
    fun static ST_mup mup (Stream a,int b) {
        ST_mup st_mup; st_mup.init(a,b);return st_mup;
    }
    fun static ST_mup mup (Stream a,float b) {
        ST_mup st_mup; st_mup.init(a,b);return st_mup;
    }
    fun static ST_max max (float a,Stream b) {
        ST_max x; x.init(a,b); return x;
    }
    fun static ST_max max (Stream a,int b) {
        ST_max x; x.init(a,b); return x;
    }
    fun static ST_max max (Stream a,Stream b) {
        ST_max x; x.init(a,b); return x;
    }
    fun static ST_max max (Stream a,float b) {
        ST_max x; x.init(a,b); return x;
    }
    fun static ST_min min (Stream a,Stream b) {
        ST_min x; x.init(a,b); return x;
    }
    fun static ST_min min (Stream a,float b) {
        ST_min x; x.init(a,b); return x;
    }
    
    fun static ST_modulo modulo(Stream a,Stream b) {
        ST_modulo x; x.init(a,b); return x;
    }
    fun static ST_modulo modulo(float a,Stream b) {
        ST_modulo x; x.init(a,b); return x;
    }
    fun static ST_modulo modulo(Stream a,float b) {
        ST_modulo x; x.init(a,b); return x;
    }
    
    fun static ST_q q(Stream a,Stream b) {
       ST_q x; x.init(a,b); return x;
    }
    fun static ST_q q(Stream a,int b) {
       ST_q x; x.init(a,b); return x;
    }
    fun static ST_q q(Stream a,float b) {
       ST_q x; x.init(a,b); return x;
    }
    
    // overwrite !!!
    fun static ST_overwrite overwrite(float b) {
        // always returns b, because sometimes needed in guardControl
        // this means walk is reset to value upon reaching test = true.
        ST_overwrite x;
        x.init(b);
        return x; 
    }
    
    fun static ST_overwrite overwrite(Stream b) {
        ST_overwrite x;
        x.init(b);
        return x; 
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
    
    fun static ST_customLoop customLoop (Stream input, Stream length, Stream indexArg) {
        ST_customLoop str;
        str.input(input);
        str.length(length);
        str.indexer(indexArg);
        return str;
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
    
    fun static Stream sometimes(float x, float y, int n) {
        ST_sometimes str;
        str.init( x, y, n);
        return str;
    }
    
    fun static Stream sometimes(float x,float y, Stream n) {
        ST_sometimes str;
        str.init( x, y, n);
        return str;
    }
    
    fun static Stream sometimes(Stream x, Stream y, int n) {
        return index( [ x, y ] , sometimes(0,1,n) ) $ Stream;
    }
    
    fun static Stream sometimes(Stream x,Stream y, Stream n) {
        return index( [ x, y ], sometimes(0,1,n)) $ Stream;
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
    
    fun static ST_trig trig (Stream inArg, Stream trigArg ) {
        return (new ST_trig).init( inArg, trigArg );
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
    
    fun static ST_mtosec mtosec(Stream arg) {
        return (new ST_mtosec).init(arg);
    }
    
    fun static ST_floor floor(Stream arg) {
        return (new ST_floor).init(arg);
    }
         
    
    fun static ST_indexLin scan(float arrayArg[],Stream sizeArg,Stream offsetArg) {
        return (new ST_indexLin).init(
            arrayArg
            , sum( count2(sizeArg) , offsetArg ));
    }
    
    fun static ST_indexLin lookup(float arrayArg[],Stream indexer) {
        return (new ST_indexLin).init(arrayArg, scaler(indexer, -1.0,1.0,0,arrayArg.cap()-1 ));
    }
    
    fun static ST_index lookupStream (Stream arrayArg[],Stream indexer) {
        return (new ST_index).init (arrayArg, scaler(indexer,-1.0,1.0,0,arrayArg.cap()-1));
    }
    
    fun static ST_sine sine(float freqArg) {
        return (new ST_sine).init(freqArg);
    }
    
    fun static ST_stateMachine statemachine(Stream args[]) {
        return (new ST_stateMachine).init(args);
    }
    
    fun static ST_sin sin(Stream phase) {
        return (new ST_sin).init(phase);
    }
    
    fun static ST_sineseg sineseg(float number) {
        return (new ST_sineseg).init( st(number) );
    }
    
    fun static ST_sineseg sineseg( Stream arg ) {
        return (new ST_sineseg).init( arg );
    }
    
    fun static ST_sineseg hzSineseg(float freqArg) {
        return sineseg( 44100.0 / freqArg );
    }
    
    fun static ST_sineseg hzSineseg(Stream arg) {
        return sineseg( div ( 44100, arg ) );
    }
    
    fun static ST_sine sine(int freqArg) {
        return (new ST_sine).init(freqArg $ float);
    }
    
    fun static ST_sine sine(Stream streamArg) {
        return (new ST_sine).init(streamArg);
    }
    
    fun static ST_greater greater(Stream a,Stream b) {
        return ST_greater x; x.init(a,b);return x;
    }
    
    fun static ST_bitAnd bitAnd(Stream a,Stream b) {
        ST_bitAnd x; x.init(a,b); return x;
    }
    
    fun static ST_bitAnd bitAnd(Stream a,int b) {
        ST_bitAnd x; x.init(a,b); return x;
    }
    
    fun static ST_bitOr bitOr(Stream a,Stream b) {
        ST_bitOr x; x.init(a,b); return x;
    }
    
    fun static ST_bitOr bitOr(Stream a,int b) {
        ST_bitOr x; x.init(a,b); return x;
    }
    
    fun static ST_bitXor bitXor(Stream a,Stream b) {
        ST_bitXor x; x.init(a,b); return x;
    }
    
    fun static ST_bitXor bitXor(Stream a,int b) {
        ST_bitXor x; x.init(a,b); return x;
    }
    
    fun static ST_bitShiftL bitShiftL(Stream a, int b) {
        ST_bitShiftL x; x.init(a,b); return x;
    }   
    fun static ST_bitShiftL bitShiftL(Stream a, Stream b) {
        ST_bitShiftL x; x.init(a,b); return x;
    }
    fun static ST_bitShiftR bitShiftR(Stream a, int b) {
        ST_bitShiftR x; x.init(a,b); return x;    
    }
    fun static ST_bitShiftR bitShiftR(Stream a, Stream b) {
        ST_bitShiftR x; x.init(a,b); return x;    
    }
    
    fun static ST_equal equal(Stream a,Stream b) {
        ST_equal x; x.init(a,b); return x;
    }
    
    fun static ST_equal equal(Stream a,int b) {
        ST_equal x; x.init(a,b); return x;
    }
        
    fun static ST_equal bitMask(Stream a,int b) {
        return equal(bitAnd(a,b),b) ;
    }
    
    fun static ST_equal bitMask(Stream a,Stream b) {
        return equal(bitAnd(a,b),b) ;
    }
    
    
    fun static ST_line phasor(float wavelength) {
        return line(seq(0,1),seq(wavelength,0.0002267573696));
    }
    
    fun static ST_line phasor(Stream wavelength) {
        return line(seq(0,1),seq(wavelength,st(0.002267573696)));
    }
    
    fun static ST_hzPhasor hzPhasor(Stream arg) {
        return (new ST_hzPhasor).init(arg);
    }
    
    fun static ST_rampGen rampGen(Stream trig, Stream number) {
        (ST_rampGen gen).init( trig, number );
        return gen;
    }
    
    fun static ST_seq impulse(Stream interval) {
        return seq( latch(st(1),st(1)) 
                  , latch(st(0),interval) 
                  );
    }
    
    fun static ST_seq impulse(Stream interval,Stream source) {
        return seq ( source 
                   , latch ( st(0), interval) 
                   );
    }
    
    fun static ST_tableCap tableCap(float tab[]) {
        return (new ST_tableCap).init(tab);
    }
    
    fun static ST_tableCap tableCap(int tab[]) {
        return (new ST_tableCap).init(tab);
    }
    
    fun static ST_store wr (string name,Stream value) {
        return (new ST_store).init(name,value);
    }
    
    fun static ST_recall rd (string name) {
        return (new ST_recall).init(name);
    } 
    
    fun static ST_define define(string name,float value) {
        return (new ST_define).init(name,value);
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
    
    fun static ST_sum scaleAC(Stream input,Stream range,Stream offset) {
        return sum( mup( div(sum(input, 1.0),2.0) ,range) , offset );
    }
    
    // optimized scaling
    /*
    fun static ST_scale2 scaler(Stream input,float outMin,float outMax) {
        return (new ST_scale2).init(input,outMin,outMax);
    }
    */
    
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
    /*    
    fun static ST_scale linlin(Stream input,float minIn,float maxIn,float minOut,float maxOut) {
        return (new ST_scale).init(input,st(minIn),st(maxIn),st(minOut),st(maxOut),st(1.0));
    } 
    */
    
    fun static ST_sum map(Stream input,float minIn,float maxIn,float minOut,float maxOut) {
        // ((in - minIn) * ( maxIn-minIn ) * maxOut - minOut) + minOut
        return  sum( 
                 mup( 
                  div(
                   sub( input , minIn ) ,
                    maxIn - minIn ) , maxOut - minOut), minOut);
    }
        
    fun static ST_ugen ugen(UGen arg) {
        return (new ST_ugen).init(arg);
    }
    
    fun static ST_biquad biquad(Stream inArg, string typeArg, float freqArg, float QArg, float gainArg) {
        ST_biquad biquad; 
        biquad.init(inArg,typeArg,freqArg,QArg,gainArg);
        return biquad;
    }
    
    fun static ST_biquad biquad(Stream inArg, int typeArg, float freqArg, float QArg, float gainArg) {
        ST_biquad biquad; 
        biquad.init(inArg,typeArg,freqArg,QArg,gainArg);
        return biquad;
    }
    
    fun static ST_biquad biquad(Stream inArg,int typeArg, Stream freqArg, float QArg, float gainArg) {
        ST_biquad biquad;
        biquad.setInput(inArg);
        biquad.setType(typeArg);
        biquad.setFreq(freqArg);
        biquad.setQ(QArg);
        biquad.setPeakGain(gainArg);
        return biquad;
    }
    
    fun static ST_biquad biquad(Stream inArg,int typeArg, Stream freqArg, Stream QArg, float gainArg) {
        ST_biquad biquad;
        biquad.setInput(inArg);
        biquad.setType(typeArg);
        biquad.setFreq(freqArg);
        biquad.setQ(QArg);
        biquad.setPeakGain(gainArg);
        return biquad;
    }
    
    fun static ST_biquad biquad(Stream inArg,int typeArg, Stream freqArg, Stream QArg, Stream gainArg) {
        ST_biquad biquad;
        biquad.setInput(inArg);
        biquad.setType(typeArg);
        biquad.setFreq(freqArg);
        biquad.setQ(QArg);
        biquad.setPeakGain(gainArg);
        return biquad;
    }
    
    fun static ST_biquad lowpass(Stream inArg, Stream freqArg, Stream QArg, Stream gainArg) {
        ST_biquad biquad;
        biquad.setInput(inArg);
        biquad.setType("lp");
        biquad.setFreq(freqArg);
        biquad.setQ(QArg);
        biquad.setPeakGain(gainArg);
        return biquad;
    }
    
    
    fun static ST_slide slide(Stream inArg, Stream upArg, Stream downArg) {
        return (new ST_slide).init(inArg,upArg,downArg);
    }
    
    fun static ST_slide slide(Stream inArg, int upArg, int downArg) {
        return slide(inArg,st(upArg),st(downArg));
    }
    
    fun static ST_slide slide(Stream inArg, int upArg, Stream downArg) {
        return slide(inArg,st(upArg),downArg);
    }
    
    fun static ST_slide slide(Stream inArg, Stream upArg, int downArg) {
        return slide(inArg,upArg,st(downArg));
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
    
    fun static ST_repeat fractHold(Stream in,Stream arg) {
        return hold ( in, hold ( arg, arg ) );
    }
    
    fun static ST_repeat fractHold4(Stream in,Stream arg) {
        return hold ( in, (hold (arg, hold (arg, arg) ) ) );
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
    
    fun static ST_zeroCount zeroCount(Stream input,Stream stFrame) {
        return (new ST_zeroCount).init(input,stFrame);
    }
    
    fun static ST_zeroCount zeroCount(Stream input, int framesize) {
        return (new ST_zeroCount).init(input,framesize);
    }
    
    fun static ST_zeroCount zeroCount(Stream input) {
        return (new ST_zeroCount).init(input, 4410);
    }
    
    fun static ST_mup freqCount(Stream input, int framesize) {
        // using zerocount to estimate frequency
        // smaller framesize = faster response, less accurate
        second / samp => float samplerate;
        <<<samplerate / framesize>>> => float mupper;
        return mup(mupper,zeroCount(input,framesize));
    }
    
    fun static ST_mup freqCount (Stream input) {
        return freqCount(input,4410);
    }
    
    fun static ST_mup freqCount(Stream input, Stream frameSize) {
        second / samp => float samplerate;
        div(samplerate,frameSize) @=> Stream mupper;
        return mup(mupper,zeroCount(input,frameSize));
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
    
    fun static ST_trigReset trigReset( ST_walk walkArg, Stream sourceArg, Stream trigArg ) {
        return (new ST_trigReset).init(walkArg, sourceArg, trigArg );
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
    
    fun static ST_writeHead writeHead(float tableArg[], Stream recordOn, Stream valueArg) {
        ST_writeHead wh;
        wh.init( tableArg, count2( tableArg.cap() ), valueArg);
        wh.recordOn(recordOn);
        return wh;
    }
    
    fun static ST_writeover writeover(float tableArg[], Stream input, Stream index, Stream mix) {
        // this mixes the input signal over the existing value, so as to allow you to mix the values.
        // Mix is the amount of input added, 1.0 is all new signal, 0.0 is all old.
        return (new ST_writeover).init(tableArg,input,index,mix,st(0.0));
    }
    
    fun static ST_writeover writeover(float tableArg[], Stream input, Stream index, Stream mix, Stream offset) {
        return (new ST_writeover).init(tableArg,input,index,mix,offset);
    }
    
    fun static ST_append append(float tabArg[],Stream valueArg) {
        return (new ST_append).init(tabArg,valueArg);
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
    
    fun static void test (Stream streamArg,float timeArg) {
        return streamArg.test(timeArg*second);
    }
    
    fun static Schedule schedule (Stream procArg,Stream timeArg) {
        return (new Schedule).init(procArg,timeArg);
    }
    
    
    fun static Schedule sampSchedule (Stream procArg, Stream timeArg) {
        Schedule schedule;
        samp => schedule._timeStep;
        return schedule.init(procArg,timeArg);
    }
    
    
    
    fun static ST_couple couple (Stream arg1, Stream arg2) {
        // sync a procedure with a stream, a is the stream, b is the procedure.
        // arg1.next() is returned
        return (new ST_couple).init(arg1,arg2);
    }
    
    fun static ST_midiCtrl midiCtrl(int deviceArg,int channelArg,int controllerArg) {
        return (new ST_midiCtrl).init(deviceArg,channelArg,controllerArg);
    }
    
    fun static ST_midiCtrl midiCtrl(int channelArg,int controllerArg) {
        return (new ST_midiCtrl).init(3,channelArg,controllerArg);
    }
    
    fun static ST_midiCtrl midiCtrl(int controllerArg) {
        return (new ST_midiCtrl).init(3,1,controllerArg);
    }
    
    fun static MidiStream midiStream(Stream timerArg, Stream pitchArg, Stream durArg, Stream veloArg) {
        MidiStream stream;
        stream.init(timerArg,pitchArg,durArg,veloArg);
        return stream;
    }
    
    /*
    fun static ST_line bend(Stream input,Stream bendUp,Stream bendDown,float range,float ramp) {
        sum ( 
           mup(-1,bigger(0,bendDown)) , 
           mup(1,bigger(0,bendUp))
           ) @=> Stream indexy;
        ST_line bendy;
        return bendy.init( index([-range,0,range],sum(indexy,1)) ,ramp);
    }
    */
    
    
    /*
    fun static ST_line bendWithKeys(string x,string y);
    */
       
    
    /*
    fun static SingleKeySynth singleKeySynth( StreamSynth synthArg, int keyNumber ) {
        return (new SingleKeySynth).init( synthArg, keyNumber);
    }
    */
    
    fun static ST_key keyboard( int hidNum ) {
        return (new ST_key).init(hidNum);
    }
    
    fun static ST_singleKey singleKey( int hidNum, string key ) {
        return (new ST_singleKey).init(hidNum,key);
    }
    
    
    fun static ST_sum scaledMidiCtrl(int controllerArg,float min,float max) {
        Math.fabs(max-min) => float range;
        Math.min(min,max) => min;
        return sum( 
                mup(  
                 midiCtrl( controllerArg ), 
                 range), 
                min);
    }
    
    fun static ST_sum scaleMidi(Stream midiIn, float min, float max) {
        Math.fabs(max-min) => float r;
        Math.min(min,max) => float m;
        return sum( mup ( midiIn, r ), m );
    }
    
    fun static ST_sum scaleAC(Stream acIn, float min, float max) {
        Math.fabs(max-min) / 2 => float r;
        Math.min(min,max) => float m;
        return sum( mup ( sum (acIn, 1) , r ) , m);
    }
    
    fun static ST_oscin oscin(int port, string name) {
        return (new ST_oscin).init(port,name);
    }
    
    fun static ST_delay delay(Stream inArg,int maxArg,Stream delArg) {
        return (new ST_delay).init(inArg,maxArg,delArg);
    }
    
    fun static ST_delayi delayi(Stream inArg, int maxArg, Stream delArg) {
        ST_delayi stream;
        stream.input(inArg);
        stream.maxRead(maxArg);
        stream.delay(delArg);
        return stream;
    }
    
    fun static ST_adc audioIn(Stream channel) {
        return (new ST_adc).init(channel);
    }
    
    fun static ST_dacin dacin(Stream channel) {
        return (new ST_dacin).init(channel);
    }
    
    fun static ST_dacin dacin(int channel) {
        return (new ST_dacin).init(channel);
    }
    
    fun static ST_adc audioIn(int channel) {
        return (new ST_adc).init(channel);
    }
    
    fun static ST_adc audioIn() {
        return audioIn(0);
    }
    
    fun static ST_avg avg(Stream in, int n) {
        return (new ST_avg).init(in,n);
    }
    
    fun static ST_avg avg(Stream in) {
        return (new ST_avg).init(in,8);
    }
    
    fun static Stream beat(Stream bpm,int divisor) {
        return div( div( 60.0, bpm ), divisor ) $ Stream;
    }
    
    
    fun static Stream beat(Stream bpm,Stream divisor) {
        return div( div( 60.0, bpm), divisor) $ Stream;
    }
    
    fun static Stream beat(float bpm,float divisor) {
        return st( 60.0 / bpm / divisor );
    }
    
    fun static float beati (float bpm,float divisor) {
        return 60.0 / bpm / divisor;
    }
    
    fun static ST_leakDC leakDC(Stream inArg,Stream coefArg) {
        ST_leakDC leak;
        leak.init(inArg,coefArg);
        return leak;
    }
    
    fun static NodeSynth node(int size,float amp, float pan,Stream outArg,Stream durArg,Stream topArg,Stream timerArg, Stream recordArg, Stream inputArg,Stream fundArg) {
        return (new NodeSynth).init(size,amp,pan,outArg,durArg,topArg,timerArg,recordArg,inputArg,fundArg);
    }
    
    fun static void resetNode () {
        (new NodeSynth).reset();
        return;
    }
    
            
}

[st.st(1)] @=> st.globals;
