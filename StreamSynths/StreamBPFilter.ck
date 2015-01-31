// stream controller high pass filter
// usage: input => StreamHPFilter filter => output;
// filter.init(freq,q,timing);
// 

public class StreamBPFilter extends Chubgraph {
    inlet => BPF f => Clip c => outlet;
    
    Stream @ st_freq;
    Stream @ st_q;
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





