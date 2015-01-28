// Stream controlled non linear feedback filter
// 


// this is a very rough approximation of a mouthpiece. x - x ^ 3
class MouthPiece extends Chugen {
    fun float tick(float in) {
        if ((in > 1) || (in < -1)) return 0.;
        return in -  (in * in * in);
    }
}    

class NonLinFeedbackFilter extends Chubgraph {
    inlet => Gain input => MouthPiece mpiece => DelayL del => HPF dc => Clip c => outlet;
    dc => input;
    
    Tanh h;
    
    
    //input.op(1); // should be 3 (multiplication), but I tend to use 1, more easy to get oscillation
    //dc.op(-1);
    
    inlet => mpiece;
    
    5*second=>del.max;
    
    // set dc cutting filter pars:
    10 => dc.freq;
    0.9 => dc.Q;
    
    fun float freq(float arg) {
        second / arg => del.delay;
        return arg;
    }
    
    fun NonLinFeedbackFilter setSigmoid() {
        input !=> mpiece;
        mpiece !=> del;
        input => h;
        h => del;
        return this;
    }
    
    fun NonLinFeedbackFilter setMouth() {
        input !=> h;
        h !=> del;
        input => mpiece;
        mpiece => del;
        return this;
    }
        
    
    fun int inputOp(int op) {
        input.op(op);
        return op;
    }
    
    
    fun float fb(float arg) {
        arg => dc.gain;
        return arg;
    }
}


public class StreamNonLinFilter extends Chubgraph {
    inlet => NonLinFeedbackFilter f => Clip c => outlet;
    
    Stream @ st_freq;
    Stream @ st_fb;
    Stream @ st_timer;
    
    0 => int loop;
    
    samp => dur _timeStep;
    
    fun StreamNonLinFilter init(Stream freqArg,Stream fbCtrl,Stream timerArg) {
        freqArg @=> st_freq;
        fbCtrl @=> st_fb;
        timerArg @=> st_timer;
        spork ~ play();
        return this;
    }
    
    fun int inputOp(int op) {
        f.inputOp(op);
        return op;
    }
    
    fun void play() {
        1 => loop;
        while(loop) {
            st_freq.next() => f.freq;
            st_fb.next() => f.fb;
            st_timer.next() * _timeStep=> now;
        }
    }
    
    fun StreamNonLinFilter timeStep(dur arg) {
        arg => _timeStep;
        return this;
    }
    
    fun void stop() {
        0 => loop;
    }
}