// stream controller high pass filter
// usage: input => StreamHPFilter filter => output;
// filter.init(freq,q,timing);
// 


// a helper class to model non linearity of mouthpiece. x - x ^ 3
class MouthPiece extends Chugen {
    fun float tick(float in) {
        return in -  (in * in * in);
    }
}    

class NonLinFeedbackFilter extends Chugraph {
    DelayL del => HPF dc => outlet;
    5*second=>del.max;
    dc => del;
    dc => MouthPiece mpiece => del;
    
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


class StreamNonLinFilter extends Chugraph {
    inlet => NonLinFeedbackFilter f => SinOsc c => outlet;
    
    c.sync(1);
    c.gain(-1);
    
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

PulseSynth synth => StreamNonLinFilter filter => StreamNonLinFilter filter2 => StreamNonLinFilter filter3 => Clip c1 => dac;

filter3 => StreamNonLinFilter filter4 => Clip c2 => dac.left;
filter3 => StreamNonLinFilter filter5 => Clip c3 => dac.right;
filter4 => StreamNonLinFilter filter6 => Clip c4 => dac.left;
filter5 => StreamNonLinFilter filter7 => Clip c5 => dac.right;

.1 => c1.gain => c2.gain => c3.gain => c4.gain => c5.gain;


synth.init(st.rv(-.1,.1),st.tchoice([40,400,1,2,10,10000,44100,88200],st.choice([.01,.02,.2,.5])));



filter.init( st.mtof(st.rv(-30,120)) , st.seq([-0.9,0.2,0.2]), st.st(100000) );
filter2.init( st.mtof(st.rv(-30,120)) , st.seq([-0.2,0.2,0.4]), st.st(10000) );
filter3.init( st.mtof(st.rv(-30,120)) , st.seq([-0.3,0.2,0.4]), st.st(200000) );
filter4.init( st.mtof(st.rv(-120,120)) , st.seq([-0.4,0.2,0.4]), st.st(80000) );
filter5.init( st.mtof(st.rv(-120,120)) , st.seq([-0.6,0.2,0.4]), st.st(60000) );
filter6.init( st.mtof(st.rv(-120,120)) , st.seq([-0.5,0.2,0.4]), st.rv(50000,60000) );
filter7.init( st.mtof(st.rv(-120,120)) , st.seq([-0.4,0.2,0.4]), st.rv(4000,60000) );


hour => now;




    



            
        
        