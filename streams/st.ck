/*

lot's of nice and juicy shortcuts, for example:

class Foo extends st {
    index(
        [rv(0,10),s(10)],
        hold(
           count(2),
           seq([rv(1,10),st(1)])
        )
    ).test();

minute => now;



*/
<<<"v 21/12/2023">>>;

public class st {
    static Stream globals[];
        
    fun static float [] collect (Stream arg,int number) {
        return arg.collect( number );
    }
    
    fun static Stream s(float value) {
        ST_value stream;
        stream.init(value);
        return stream $ Stream;
    }
    
    fun static Stream s(Stream arg) {
        return arg;
    }
    
    fun static float take(Stream arg) {
        return arg.next();
    }
    
    fun static ST_linseg linseg(Stream startArg,Stream endArg,Stream stepsArg,int holdArg) {
        ST_linseg str;
        str.start(startArg);
        str.end(endArg);
        str.steps(stepsArg);
        str.holdMode(holdArg);
        return str;
    }
    
    fun static ST_linseg linseg(Stream startArg,Stream endArg,float stepsArg,int holdArg) {
        ST_linseg str;
        str.start(startArg);
        str.end(endArg);
        str.steps(stepsArg);
        str.holdMode(holdArg);
        return str;
    }
    
    fun static ST_linseg linseg(Stream startArg,Stream endArg,Stream stepsArg) {
        ST_linseg str;
        str.start(startArg);
        str.end(endArg);
        str.steps(stepsArg);
        str.holdMode(1);
        return str;
    }
    
    /*
    fun static ST_linseg linseg(Stream startArg,Stream endArg,Stream stepsArg,int holdArg) {
        //return (new ST_linseg)
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
        ST_indexLin s;
        s.init(seq,indexer);
        return s;
    }
    fun static ST_indexLin indexLin(int seq[],Stream indexer) {
        ST_indexLin s;
        s.init(seq,indexer);
        return s;
    }
    
    fun static ST_indexLin indexLin(Stream seq[],Stream indexer) {
        ST_indexLin s;
        s.init(seq,indexer);
        return s;
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
        ST_modIndex m;
        m.init(in,t1,t2);
        return m;
    }
    
    fun static ST_mupModIndex mupModIndex(float t1[], float t2[],Stream in) {
        ST_mupModIndex m;
        m.init(in,t2,t2);
        return m;
    }
    
    fun static ST_modIndex modIndex(Stream in,float t1[], float t2[]) {
        ST_modIndex m;
        m.init(in,t2,t2);
        return m;
    }
    
    fun static ST_mupModIndex mupModIndex(Stream in,float t1[], float t2[]) {
        ST_mupModIndex m;
        m.init(in,t2,t2);
        return m;
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
        ST_seq s;
        s.init(seq);
        s.min(low);
        s.max(high);
        return s;
    }
    fun static ST_seq seq(int seq[],Stream low,Stream high) {
        ST_seq s;
        s.init(seq);
        s.min(low);
        s.max(high);
        return s;
    }
    fun static ST_seq seq(Stream seq[],Stream low,Stream high) {
        ST_seq s;
        s.init(seq);
        s.min(low);
        s.max(high);
        return s;
    }
    fun static ST_seq seq(Stream arg) {
        ST_seq s;
        s.init([arg]);
        return s;
    }
    
    /*fun static ST_seq seq(float arg) {
        return (new ST_seq).init([arg]);
    }*/
    
    fun static ST_compose compose(Stream inArg,Stream segArg) {
        ST_compose s;
        s.init(inArg, segArg);
        return s;
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
        ST_exprv str;
        str.low(minArg);
        str.high(maxArg);
        str.exp(expArg);
        return str;
    }
    fun static ST_exprv exprv(Stream minArg,Stream maxArg,float expArg) {
        ST_exprv str;
        str.low(minArg);
        str.high(maxArg);
        str.exp(expArg);
        return str;    
    }
    fun static ST_exprv exprv(Stream minArg,float maxArg,float expArg) {
        ST_exprv str;
        str.low(minArg);
        str.high(maxArg);
        str.exp(expArg);
        return str;  
    }
    fun static ST_exprv exprv(float minArg,float maxArg,Stream expArg) {
        ST_exprv str;
        str.low(minArg);
        str.high(maxArg);
        str.exp(expArg);
        return str; 
    }
    fun static ST_exprv exprv(float minArg,Stream maxArg,float expArg) {
        ST_exprv str;
        str.low(minArg);
        str.high(maxArg);
        str.exp(expArg);
        return str;
    }
    fun static ST_exprv exprv(float minArg,Stream maxArg,Stream expArg) {
        ST_exprv str;
        str.low(minArg);
        str.high(maxArg);
        str.exp(expArg);
        return str;    
    }
    fun static ST_exprv exprv(Stream minArg,Stream maxArg,Stream expArg) {
        ST_exprv str;
        str.low(minArg);
        str.high(maxArg);
        str.exp(expArg);
        return str;    
    }
        
      
    
    fun static ST_div inv(Stream in) {
        return div(1.0,in);
    }
    
    fun static ST_diff diff(Stream in) {
        ST_diff str;
        str.init(in);
        return str; 
    }
  
    fun static ST_latch latch(Stream valueArg,Stream repeatArg) {
        ST_latch s;
        s.init(valueArg,repeatArg);
        return s;
    }
    fun static ST_latch latch(float valueArg,float repeatArg) {
        ST_latch str;
        str.init(s(valueArg),s(repeatArg));
        return str;
    }
    fun static ST_latch latch(Stream valueArg,int repeatArg) {
        ST_latch str;
        str.init(valueArg,s(repeatArg));
        return str;
    }
    fun static ST_latch latch(int valueArg,Stream repeatArg) {
        ST_latch str;
        str.init(s(valueArg),repeatArg);
        return str;
    }
    
    fun static ST_latch latch(Stream valueArg, float repeatArg) {
        ST_latch str;
        str.init(valueArg,s(repeatArg));
        return str;
    }

    fun static ST_timedLatch tLatch(Stream valueArg,Stream timerArg) {
        ST_timedLatch str;
        str.init(valueArg,timerArg);
        return str;
    }  
    
    fun static ST_timed timed(Stream str,Stream timing) {
        return ST_timed.make(str,timing);
    }
    
    fun static ST_timed timed(Stream str,Stream timing,int holdArg) {
        ST_timed str;
        str.init(str,timing,holdArg);
        return str;
    }
        
    
    fun static ST_timed t(Stream str,Stream timing) {
        return timed(str,timing);
    }
    
    fun static ST_timed t(Stream str,Stream timing,int holdArg) {
        return timed(str,timing,holdArg);
    }
    
    fun static ST_timed t(Stream str,float timing) {
        return timed(str,s(timing));
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
        return timedSeq(seq,s(timing));
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
        return ST_repeat.make(value,s(rep)).holdMode(holdArg);
    }
    
    fun static ST_repeat hold(Stream value,int rep) {
        return ST_repeat.make(value,s(rep));
    }
    
    fun static ST_repeatPlay holdPlay(Stream value,Stream rep) {
        return ST_repeatPlay.make(value,rep);
    }
    
    fun static ST_count count(int maxArg) {
        if (maxArg < 1) {
            1 => maxArg;
        }
        return ST_count.make(maxArg);
    }
    
    fun static ST_count count(Stream max) {
        ST_count str;
        str.init(max);
        return str;
    }
    
    fun static ST_count2 count2(int maxArg) {
        ST_count2 str;
        str.init(maxArg,true);
        return str;
    }
    
    fun static ST_count2 count2(Stream maxArg) {
        ST_count2 str;
        str.init(maxArg,true);
        return str;
    }
    
    fun static ST_count2 count2(Stream maxArg,int holdArg) {
        ST_count2 str;
        str.init(maxArg,holdArg);
        return str;
    }
    
    fun static ST_count2 count2(int maxArg,int holdArg) {
         ST_count2 str;
         str.init(maxArg,holdArg);
         return str;
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
        return ST_choice.make([s(a),b]);
    }
    fun static ST_choice choice(Stream a,float b) {
        return ST_choice.make([a,s(b)]);
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
        ST_maskedChoice str;
        str.init(arg);
        str.min(minArg);
        str.max(maxArg);
        return str;
    }
 
    fun static ST_maskedChoice maskedChoice(float arg[],Stream minArg,Stream maxArg) {
        ST_maskedChoice str;
        str.init(arg);
        str.min(minArg);
        str.max(maxArg);
        return str;
    }   
    
    fun static ST_maskedChoice maskedChoice(Stream arg[],Stream minArg,Stream maxArg) {
        ST_maskedChoice str;
        str.init(arg);
        str.min(minArg);
        str.max(maxArg);
        return str;
    }   
        
    
    fun static ST_line line(Stream value,Stream timing) {
        ST_line stream;
        stream.init(value,timing);
        return stream;
    }
    
    fun static ST_line line(Stream value,float timing) {
        ST_line stream;
        stream.init(value,s(timing));
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
        return boundedMupWalk(s(minArg),s(maxArg),stepArg);
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
        return boundedMupWalk(s(minArg),s(maxArg),stepArg,start);
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
        return index(values,boundedWalk(0,values.cap(),step));
    }
    
    fun static ST_index walkList(float values[], Stream step) {
        return index(values,boundedWalk(0,values.cap(),step));
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
   
   fun static ST_index walkList(Stream values[],Stream step) {
       return index(values,boundedWalk(0,values.cap()-1,step));
   }

    fun static ST_smartWalkList smartWalkList(float values[],Stream step,Stream direction) {
        ST_smartWalkList str;
        str.init(values,step,direction);
        return str;
    }

    fun static ST_smartWalkList smartWalkList(int values[],Stream step,Stream direction) {
        ST_smartWalkList str;
        str.init(values,step,direction);
        return str;
    }
    
    fun static ST_smartWalkList smartWalkList(Stream values[],Stream step,Stream direction) {
        ST_smartWalkList str;
        str.init(values,step,direction);
        return str;
    }
    
    fun static Stream bouncyListWalk(Stream minArg,Stream maxArg,float list[],Stream step) {
        return index( list , bouncyWalk(minArg,maxArg,step) );
    }
    
    fun static Stream bouncyListWalk(Stream minArg,Stream maxArg,Stream list[],Stream step) {
        return index( list , bouncyWalk(minArg,maxArg,step) );
    }
    
    fun static Stream bouncyListWalk(int minArg,int maxArg,Stream list[],Stream step) {
        return index( list , bouncyWalk(s(minArg),s(maxArg),step) );
    }
    
    fun static Stream bouncyListWalk(Stream listArg[],Stream stepperArg) {
        return index( listArg, bouncyWalk(0,listArg.cap(),stepperArg) );
    }
    
    fun static Stream bouncyListWalk(float listArg[],Stream stepperArg) {
        return index( listArg, bouncyWalk(0,listArg.cap(),stepperArg) );
    }
    
    fun static Stream bouncyListWalk(Stream list[])  {
        return index( list, bouncyWalk( s(0), s(list.cap()), s(1) ));
    }
    
    fun static Stream bouncyListWalk(float list[]) {
        return index( list, bouncyWalk(s(0),s(list.cap()), s(1) ));
    }
    
    fun static Stream boundedListWalk(Stream min,Stream max,float list[], Stream stepper) {
        return index( list, boundedWalk(min,max,stepper) );
    }
    
    fun static Stream boundedListWalk(Stream min,Stream max,Stream list[], Stream stepper) {
        return index( list, boundedWalk(min,max,stepper) );
    }
    
    fun static Stream boundedListWalk(float list[],Stream stepper) {
        return boundedListWalk(s(0),s(list.cap()),list,stepper);
    }
    
    fun static Stream boundedListWalk(float list[]) {
        return boundedListWalk(s(0),s(list.cap()),list,ch(-1,1));
    }
    
    fun static Stream boundedListWalk(Stream list[]) {
        return boundedListWalk(s(0),s(list.cap()),list,ch(-1,1));
    }
    
    fun static Stream boundedListWalk(Stream list[],Stream stepArg) {
        return boundedListWalk(s(0),s(list.cap()),list,stepArg);
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
        ST_guardedWalk str;
        str.init(startArg,guardsArg);
        return str;
    }
    
    fun static ST_apply apply(Stream inArg,Guard guards[]) {
        ST_apply str;
        str.init(inArg,guards);
        return str;
    }
    
    fun static ST_apply apply(Stream inArg, Guard guard) {
        return apply(inArg,[guard]);
    }
    
    fun static Guard guard(ST_operator funktorArg) {
        Guard str;
        str.init(funktorArg);
        return str;
    }
    
    fun static Guard guardTest(ST_operator testArg,ST_operator funktorArg) {
        GuardTest str;
        str.init(testArg,funktorArg);
        return str;
    }
    
    fun static Guard guardTestValue(ST_operator testArg,Stream valueArg) {
        GuardTestValue str;
        str.init(testArg,valueArg);
        return str;
    }
    
    fun static Guard guardControl(Stream controlArg,ST_operator funktorArg) {
        GuardControl str;
        str.init(controlArg,funktorArg);
        return str;
    }
    
    fun static Guard otherwise(ST_operator valueArg) {
        Guard str;
        str.init(valueArg);
        return str;
    }
    
    fun static ST_collatz collatz(Stream inputArg) {
        ST_collatz str;
        str.init(inputArg);
        return str;
    }
    
    fun static ST_div div (Stream a,Stream b) {
        ST_div st_div; st_div.init(a,b); return st_div;
    }
    fun static ST_div div (Stream a,float b) {
        ST_div st_div; st_div.init(a,b); return st_div;
    }
    fun static ST_div div (Stream a,int b) {
        ST_div st_div; st_div.init(a,b); return st_div;
    }
    fun static ST_div div (float a,Stream b) {
        ST_div st_div; st_div.init(a,b); return st_div;
    }
    fun static ST_sum sum(Stream a,Stream b) {
        ST_sum st_sum; st_sum.init(a,b); return st_sum;
    }
    fun static ST_sum sum(float a,Stream b) {
        ST_sum st_sum; st_sum.init(a,b); return st_sum;
    }
    fun static ST_sum sum(Stream a,float b) {
        ST_sum st_sum; st_sum.init(a,b); return st_sum;
    } 
    
    fun static ST_sum sum(float a,float b) {
        ST_sum st_sum; st_sum.init(a,b); return st_sum;
    }
    /* ST_smaller */
    fun static ST_smaller smaller(Stream a,Stream b) {
        ST_smaller st_smaller; st_smaller.init(a,b); return st_smaller;
    }
    fun static ST_smaller smaller(float a,Stream b) {
        ST_smaller st_smaller; st_smaller.init(a,b); return st_smaller;
    }
    fun static ST_smaller smaller(Stream a,float b) {
        ST_smaller st_smaller; st_smaller.init(a,b); return st_smaller;
    } 
    
    fun static ST_smaller smaller(float a,float b) {
        ST_smaller st_smaller; st_smaller.init(a,b); return st_smaller;
    }
    
    /* ST_bigger */
    fun static ST_bigger bigger(Stream a,Stream b) {
        ST_bigger st_bigger; st_bigger.init(a,b); return st_bigger;
    }
    fun static ST_bigger bigger(float a,Stream b) {
        ST_bigger st_bigger; st_bigger.init(a,b); return st_bigger;
    }
    fun static ST_bigger bigger(Stream a,float b) {
        ST_bigger st_bigger; st_bigger.init(a,b); return st_bigger;
    } 
    
    fun static ST_bigger bigger(float a,float b) {
        ST_bigger st_bigger; st_bigger.init(a,b); return st_bigger;
    }

    
    fun static ST_div div(float a,float b) {
        ST_div st_div; st_div.init(a,b); return st_div;
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
            return sum(s(0),0);
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
            return div(s(0),1);
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
            return mup(s(0),1);
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
            return sub(s(0),1);
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
        ST_bus b;
        b.init(stream,name);
        return b;
    }
    
    fun static ST_bus bus(string name) {
        ST_bus b;
        b.init(name);
        return b;
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
        ST_loop strm;
        strm.init(src,repeats,length);
        return strm;
    }  
    
    fun static ST_customLoop customLoop (Stream input, Stream length, Stream indexArg) {
        ST_customLoop str;
        str.input(input);
        str.length(length);
        str.indexer(indexArg);
        return str;
    }

    fun static ST_wchoice wchoice(float valueWeights[][]) {
        ST_wchoice str;
        str.init(valueWeights);
        return str;
    }
    
    fun static ST_wchoice wchoice(int valueWeights[][]) {
        ST_wchoice str;
        str.init(valueWeights);
        return str;
    }
    
    fun static ST_wchoice weights(float valueWeights[][]) {
        ST_wchoice str;
        str.init(valueWeights);
        return str;
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
        ST_wchoice str;
        str.init(valueWeights);
        return str;
    }
    
    fun static ST_weightStream weightStream(Stream values[],int weights[]) {
        ST_weightStream str;
        str.init(values,weights);
        return str;
    }
    
    fun static ST_weightStream weightStream(Stream values[],float weights[]) {
        ST_weightStream str;
        str.init(values,weights);
        return str;
    }
    
    fun static ST_weightStream weightStream(float values[],Stream weights[]) {
        ST_weightStream str;
        str.init(values,weights);
        return str;
    }
    
    fun static ST_weightStream weightStream(Stream values[],Stream weights[]) {
        ST_weightStream str;
        str.init(values,weights);
        return str;
    }
    
    fun static ST_trigger trigger(Stream arg) {
        ST_trigger str;
        str.init(arg);
        return str;
    }
    
    fun static ST_trig trig (Stream inArg, Stream trigArg ) {
        ST_trig str;
        str.init( inArg, trigArg );
        return str;
    }
    
    fun static ST_mtof mtof(Stream arg) {
        ST_mtof str;
        str.init(arg);
        return str;
    }
    
    fun static ST_ftom ftom(Stream arg) {
        ST_ftom str;
        str.init(arg);
        return str;
    }
    
    fun static ST_mtor mtor(Stream arg) {
        ST_mtor str;
        str.init(arg);
        return str;
    }
    
    fun static ST_mtosamps mtosamps(Stream arg) {
        ST_mtosamps str;
        str.init(arg);
        return str;
    }
    
    fun static ST_mtosec mtosec(Stream arg) {
        ST_mtosec str;
        str.init(arg);
        return str;
    }
    
    fun static ST_floor floor(Stream arg) {
        ST_floor str;
        str.init(arg);
        return str;
    }
         
    
    fun static ST_indexLin scan(float arrayArg[],Stream sizeArg,Stream offsetArg) {
        ST_indexLin str;
        str.init(arrayArg, sum( count2(sizeArg) , offsetArg ));
        return str;
    }
    
    fun static ST_indexLin lookup(float arrayArg[],Stream indexer) {
        ST_indexLin str;
        str.init(arrayArg, scaler(indexer, -1.0,1.0,0,arrayArg.cap()-1 ));
        return str;
    }
    
    fun static ST_index lookupStream (Stream arrayArg[],Stream indexer) {
        ST_index str;
        str.init (arrayArg, scaler(indexer,-1.0,1.0,0,arrayArg.cap()-1));
        return str;
    }
    
    fun static ST_sine sine(float freqArg) {
        ST_sine str;
        str.init(freqArg);
        return str;
    }
    
    fun static ST_stateMachine statemachine(Stream args[]) {
        ST_stateMachine str;
        str.init(args);
        return str;
    }
    
    fun static ST_sin sin(Stream phase) {
        ST_sin str;
        str.init(phase);
        return str;
    }
    
    fun static ST_sineseg sineseg(float number) {
        ST_sineseg str;
        str.init( s(number) );
        return str;
    }
    
    fun static ST_sineseg sineseg( Stream arg ) {
        ST_sineseg str;
        str.init( arg );
        return str;
    }
    
    fun static ST_sineseg hzSineseg(float freqArg) {
        return sineseg( 44100.0 / freqArg );
    }
    
    fun static ST_sineseg hzSineseg(Stream arg) {
        return sineseg( div ( 44100, arg ) );
    }
    
    fun static ST_sine sine(int freqArg) {
        ST_sine str;
        str.init(freqArg $ float);
        return str;
    }
    
    fun static ST_sine sine(Stream streamArg) {
        ST_sine str;
        str.init(streamArg);
        return str;
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
        return line(seq(0,1),seq(wavelength,0.0));
    }
    
    fun static ST_line phasor(Stream wavelength) {
        return line(seq(0,1),seq(wavelength,s(0.0)));
    }
    
    fun static ST_hzPhasor hzPhasor(Stream arg) {
        ST_hzPhasor str;
        str.init(arg);
        return str;
    }
    
    fun static ST_rampGen rampGen(Stream trig, Stream number) {
        (ST_rampGen gen).init( trig, number );
        return gen;
    }
    
    fun static ST_seq impulse(Stream interval) {
        return seq( latch(s(1),s(1)) 
                  , latch(s(0),interval) 
                  );
    }
    
    fun static ST_seq impulse(Stream interval,Stream source) {
        return seq ( source 
                   , latch ( s(0), interval) 
                   );
    }
    
    fun static ST_tableCap tableCap(float tab[]) {
        ST_tableCap str;
        str.init(tab);
        return str;
    }
    
    fun static ST_tableCap tableCap(int tab[]) {
        ST_tableCap str;
        str.init(tab);
        return str;
    }
    
    fun static ST_store wr (string name,Stream value) {
        ST_store str;
        str.init(name,value);
        return str;
    }
    
    fun static ST_recall rd (string name) {
        ST_recall str;
        str.init(name);
        return str;
    } 
    
    fun static ST_define define(string name,float value) {
        ST_define str;
        str.init(name,value);
        return str;
    }
    
    fun static ST_divider divider(float dividend,float divisor) {
        ST_divider str;
        str.dividend(dividend);
        str.divisor(divisor);
        return str;
    }
    
    fun static ST_divider divider(Stream dividend,float divisor) {
        ST_divider str;
        str.dividend(dividend);
        str.divisor(divisor);
        return str;    
    }
    
    fun static ST_divider divider(Stream dividend,Stream divisor) {
        ST_divider str;
        str.dividend(dividend);
        str.divisor(divisor);
        return str;    
    }
    
    
    fun static ST_divider divider(float dividend,Stream divisor) {
        ST_divider str;
        str.dividend(dividend);
        str.divisor(divisor);
        return str;    
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
        ST_scale2 str;
        str.init(input,inMin,inMax,outMin,outMax);
        return str;
    }
    
    fun static ST_scale2 scaler(Stream input,float inMin,float inMax,float outMin,float outMax) {
        ST_scale2 str;
        str.init(input,inMin,inMax,s(outMin),s(outMax));
        return str;
    }
    
    fun static ST_scale2 scaler(Stream input,float outMin,float outMax) {
        ST_scale2 str;
        str.init(input,outMin,outMax);
        return str;
    }
    
    // scales (not optimized(.
    fun static ST_scale linlin(Stream input,float minIn,float maxIn,Stream minOut,Stream maxOut) {
        ST_scale str;
        str.init(input,s(minIn),s(maxIn),minOut,maxOut,s(1.0));
        return str;
    }
    
    fun static ST_scale linlin(Stream input,Stream minIn,Stream maxIn,Stream minOut,Stream maxOut) {
        ST_scale str;
        str.init(input,minIn,maxIn,minOut,maxOut,s(1.0));
        return str;
    }
    
    fun static ST_scale linexp(Stream input,float minIn,float maxIn,Stream minOut,Stream maxOut,Stream expArg) {
        ST_scale str;
        str.init(input,s(minIn),s(maxIn),minOut,maxOut,expArg);
        return str;
    }
    
    fun static ST_scale linexp(Stream input,Stream minIn,Stream maxIn,Stream minOut,Stream maxOut,float expArg) {
        ST_scale str;
        str.init(input,minIn,maxIn,minOut,maxOut,s(expArg));
        return str;
    }
    
    fun static ST_scale linexp(Stream input,Stream minIn,Stream maxIn,Stream minOut,Stream maxOut,Stream expArg) {
        ST_scale str;
        str.init(input,minIn,maxIn,minOut,maxOut,expArg);
        return str;
    }
    
    fun static ST_scale linexp(Stream input,float minIn,float maxIn,float minOut,float maxOut,float expArg) {
        ST_scale str;
        str.init(input,s(minIn),s(maxIn),s(minOut),s(maxOut),s(expArg));
        return str;
    }
    /*    
    fun static ST_scale linlin(Stream input,float minIn,float maxIn,float minOut,float maxOut) {
        return (new ST_scale).init(input,s(minIn),s(maxIn),s(minOut),s(maxOut),s(1.0));
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
        ST_ugen str;
        str.init(arg);
        return str;
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
    
    fun static ST_biquad highpass(Stream inArg, Stream freqArg, Stream QArg, Stream gainArg) {
        ST_biquad biquad;
        biquad.setInput(inArg);
        biquad.setType("hp");
        biquad.setFreq(freqArg);
        biquad.setQ(QArg);
        biquad.setPeakGain(gainArg);
        return biquad;
    }
    
    
    fun static ST_slide slide(Stream inArg, Stream upArg, Stream downArg) {
        ST_slide str;
        str.init(inArg,upArg,downArg);
        return str;
    }
    
    fun static ST_slide slide(Stream inArg, int upArg, int downArg) {
        return slide(inArg,s(upArg),s(downArg));
    }
    
    fun static ST_slide slide(Stream inArg, int upArg, Stream downArg) {
        return slide(inArg,s(upArg),downArg);
    }
    
    fun static ST_slide slide(Stream inArg, Stream upArg, int downArg) {
        return slide(inArg,upArg,s(downArg));
    }
    
    fun static ST_clip clip(Stream inputArg,Stream minArg,Stream maxArg) {
        ST_clip str;
        str.input(inputArg).min(minArg).max(maxArg);
        return str;
    }
    fun static ST_clip clip(Stream inputArg,float minArg,float maxArg) {
        ST_clip str;
        str.input(inputArg).min(minArg).max(maxArg);
        return str;
    }
    fun static ST_clip clip(Stream inputArg,Stream minArg,float maxArg) {
        ST_clip str;
        str.input(inputArg).min(minArg).max(maxArg);
        return str;
    }
    fun static ST_clip clip(Stream inputArg,float minArg,Stream maxArg) {
        ST_clip str;
        str.input(inputArg).min(minArg).max(maxArg);
        return str;
    }

    fun static ST_tanh tanh(Stream inputArg) {
        ST_tanh str;
        str.input(inputArg);
        return str;
    }

    
    fun static ST_clip clip(Stream inputArg) {
        ST_clip str;
        str.input(inputArg).min(-1).max(1);
        return str;
    }
    
    fun static ST_funkStream funkStream(Funk funkArg,Stream xArg) {
        ST_funkStream str;
        str.funk(funkArg);
        str.x(xArg);
        return str;
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
        return index( table, mup( phasor(freqArg) , size ) );
    }
    
    /// linear
    fun static ST_indexLin waveOscL( float table[], Stream freqArg ) {
        table.cap() => int size;
        return indexLin( table, mup( phasor(freqArg) , size ) );
    }
    
    fun static ST_replaceZero replaceZero( Stream in ) {
        ST_replaceZero str;
        str.init(in);
        return str;
    }
    
    fun static ST_zeroCount zeroCount(Stream input,Stream stFrame) {
        ST_zeroCount str;
        str.init(input,stFrame);
        return str;
    }
    
    fun static ST_zeroCount zeroCount(Stream input, int framesize) {
        ST_zeroCount str;
        str.init(input,framesize);
        return str;
    }
    
    fun static ST_zeroCount zeroCount(Stream input) {
        ST_zeroCount str;
        str.init(input, 4410);
        return str;
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
        return mup(div(samplerate,frameSize),zeroCount(input,frameSize));
    }

    
    // more efficient ?
    fun static ST_wave wave(float tableArg[],Stream freqArg) {
        ST_wave x;
        x.init(tableArg,freqArg);
        return x;
    }
    // reads a table with a certain frequency
    fun static ST_wave wave(float tableArg[],float freqArg) {
        ST_wave x;
        x.init(tableArg,s(freqArg));
        return x;
    }
    
    
    // resets a walk to source arg, every reps
    fun static ST_reset reset( ST_walk walkArg , Stream sourceArg, Stream repsArg ) {
        ST_reset x;
        x.init(walkArg,sourceArg,repsArg);
        return x;
    }
    
    fun static ST_trigReset trigReset( ST_walk walkArg, Stream sourceArg, Stream trigArg ) {
        ST_trigReset x;
        x.init(walkArg, sourceArg, trigArg );
        return x;
    }
    
    // resets a walk to source every time 'timer' has passed
    fun static ST_timedReset timedReset( ST_walk walkArg , Stream sourceArg, Stream timerArg ) {
        ST_timedReset x;
        x.init(walkArg,sourceArg,timerArg);
        return x;
    }
    
    /* writes to table */
    fun static void writerShred(ST_write arg,Stream timerArg) {
        while(1) {
            arg.next();
            timerArg.next() * second => now;
        }
    }
    
    fun static ST_write write( float table[], Stream valueArg, Stream indexArg) {
        ST_write x;
        x.init(table,valueArg,indexArg);
        return x;
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
        spork ~ writerShred( stream, s(1) );
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
        ST_readWrite str;
        str.init( tableArg, readIndexArg, valueArg , writeIndexArg, overwriteArg);
        return str;
    }
    
    fun static ST_readWrite readWrite( float tableArg[], Stream readIndexArg,Stream valueArg, Stream writeIndexArg) {
        // write and read synchronized.
        ST_readWrite str;
        str.init( tableArg, readIndexArg, valueArg , writeIndexArg, 0);
        return str;
    }
    
    fun static ST_readWrite readWrite(float tableArg[],  Stream readIndexArg, Stream valueArg) {
        // write sequentially.
        ST_readWrite str;
        str.init( tableArg, readIndexArg, valueArg, count( tableArg.cap() ),0);
        return str;
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
        ST_writeover str;
        str.init(tableArg,input,index,mix,s(0.0));
        return str;
    }
    
    fun static ST_writeover writeover(float tableArg[], Stream input, Stream index, Stream mix, Stream offset) {
        ST_writeover str;
        str.init(tableArg,input,index,mix,offset);
        return str;
    }
    
    fun static ST_append append(float tabArg[],Stream valueArg) {
        ST_append str;
        str.init(tabArg,valueArg);
        return str;
    }
    
    fun static ST_onePole onepole(Stream arg,Stream fArg) {
        ST_onePole str;
        str.init(arg,fArg);
        return str;
    }
    
    /* prints the output to the log */
    fun static ST_monitor monitor( int arg, Stream arg2 ) {
        ST_monitor str;
        str.init(arg,arg2);
        return str;
    }
    
    fun static ST_monitor monitor( Stream arg2 ) {
        ST_monitor str;
        str.init(4410,arg2);
        return str;
    }
    
    /* stream gets repeated weightone in weighttwo times */
    fun static Stream skip (Stream arg,int weightone,int weighttwo) {
        return hold( arg , weights([[1,weightone],[2,weighttwo]]) );
    }
    
    fun static ST_normStream normStream (Stream arg[]) {
        ST_normStream str;
        str.init(arg);
        return str;
    }
    
    fun static void test (Stream arg) {
        return arg.test();
    }
    
    fun static void test (Stream streamArg,float timeArg) {
        return streamArg.test(timeArg*second);
    }
    
    fun static Schedule schedule (Stream procArg,Stream timeArg) {
        Schedule str;
        str.init(procArg,timeArg);
        return str;
    }
    
    
    fun static Schedule sampSchedule (Stream procArg, Stream timeArg) {
        Schedule schedule;
        samp => schedule._timeStep;
        return schedule.init(procArg,timeArg);
    }
    
    
    
    fun static ST_couple couple (Stream arg1, Stream arg2) {
        // sync a procedure with a stream, a is the stream, b is the procedure.
        // arg1.next() is returned
        ST_couple str;
        str.init(arg1,arg2);
        return str;
    }
    
    fun static ST_midiCtrl midiCtrl(int deviceArg,int channelArg,int controllerArg) {
        ST_midiCtrl str;
        str.init(deviceArg,channelArg,controllerArg);
        return str;
    }
    
    fun static ST_midiCtrl midiCtrl(int channelArg,int controllerArg) {
        ST_midiCtrl str;
        str.init(3,channelArg,controllerArg);
        return str;
    }
    
    fun static ST_midiCtrl midiCtrl(int controllerArg) {
        ST_midiCtrl str;
        str.init(3,1,controllerArg);
        return str;
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
        ST_key str;
        str.init(hidNum);
        return str;
    }
    
    fun static ST_singleKey singleKey( int hidNum, string key ) {
        ST_singleKey str;
        str.init(hidNum,key);
        return str;
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
    
    fun static ST_oscin oscin(string name) {
        ST_oscin str;
        str.init(name);
        return str;
    }
    
    fun static ST_oscin oscin(string name,float default) {
        ST_oscin str;
        str.init(name,default);
        return str;
    }
    
    fun static ST_delay delay(Stream inArg,int maxArg,Stream delArg) {
        ST_delay str;
        str.init(inArg,maxArg,delArg);
        return str;
    }
    
    fun static ST_delayi delayi(Stream inArg, int maxArg, Stream delArg) {
        ST_delayi stream;
        stream.input(inArg);
        stream.maxRead(maxArg);
        stream.delay(delArg);
        return stream;
    }
    
    fun static ST_adc audioIn(Stream channel) {
        ST_adc str;
        str.init(channel);
        return str;
    }
    
    fun static ST_dacin dacin(Stream channel) {
        ST_dacin str;
        str.init(channel);
        return str;
    }
    
    fun static ST_dacin dacin(int channel) {
        ST_dacin str;
        str.init(channel);
        return str;
    }
    
    fun static ST_adc audioIn(int channel) {
        ST_adc str;
        str.init(channel);
        return str;
    }
    
    fun static ST_adc audioIn() {
        return audioIn(0);
    }
    
    fun static ST_avg avg(Stream in, int n) {
        ST_avg str;
        str.init(in,n);
        return str;
    }
    
    fun static ST_avg avg(Stream in) {
        ST_avg str;
        str.init(in,8);
        return str;
    }
    
    fun static Stream beat(Stream bpm,int divisor) {
        return div( div( 60.0, bpm ), divisor ) $ Stream;
    }
    
    
    fun static Stream beat(Stream bpm,Stream divisor) {
        return div( div( 60.0, bpm), divisor) $ Stream;
    }
    
    fun static Stream beat(float bpm,float divisor) {
        return s( 60.0 / bpm / divisor );
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
        NodeSynth str;
        str.init(size,amp,pan,outArg,durArg,topArg,timerArg,recordArg,inputArg,fundArg);
        return str;
    }
    
    fun static void resetNode () {
       NodeSynth node;
       node.reset();
       return;
    }
    
    fun static ST_invert invert(Stream arg) {
       ST_invert str;
       str.input(arg);
       return str;
   }
    
    fun static ST_mup flip(float tableArg[],int idxArg,Stream arg) {
        return mup(arg,index(tableArg,s(idxArg)));
    }
    
    fun static ST_mup flop(float tableArg[],int idxArg,Stream arg) {
        return mup(arg,invert(index(tableArg,s(idxArg))));
    }
    
    fun static ST_abs abs (Stream arg) {
        ST_abs str;
        str.init(arg);
        return str;
    }
            
}

[st.s(1)] @=> st.globals;
