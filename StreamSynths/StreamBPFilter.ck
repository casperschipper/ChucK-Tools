// stream controller high pass filter
// usage: input => StreamHPFilter filter => output;
// filter.init(freq,q,timing);
// 

public class StreamNonLinFilter extends Chubgraph {
    inlet => NonLinFeedbackFilter f => Clip c => outlet;
    
    Stream @ st_freq;
    Stream @ st_fb;
    Stream @ st_timer;
    
    0 => int loop;
    
    samp => dur _timeStep;
    
    fun StreamBPFilter init(Stream freqArg,Stream qCtrl,Stream timerArg) {
        freqArg @=> st_freq;
        qCtrl @=> st_q;
        timerArg @=> st_timer;
        spork ~ play();
        return this;
    }
    
    fun void play() {
        1 => loop;
        while(loop) {
            st_freq.next() => f.freq;
            st_q.next() => f.Q;
            st_timer.next() * _timeStep=> now;
        }
    }
    
    fun StreamBPFilter timeStep(dur arg) {
        arg => _timeStep;
        return this;
    }
    
    fun void stop() {
        0 => loop;
    }
}

class NonLinFeebbackFilter extends Chubgraph {
    DelayL del => HPF dc => Tanh h;
    h => del;
    h => MouthPiece mpiece => del;
    
    inlet => mpiece;
    
    // set dc cutting filter pars:
    20 => dc.freq;
    0.9 => dc.Q;
    
    fun float freq(float arg) {
        second / arg => del.delay;
        return arg;
    }
    
    fun float fb(float arg) {
        arg => dc.gain;
        return arg;
    }
}

// a class to model non linearity of mouthpiece. x - x ^ 3
class MouthPiece extends Chugen {
    fun float tick(float in) {
        return in - (in * in * in);
    }
}    
    



            
        
        