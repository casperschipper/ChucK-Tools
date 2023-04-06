class CustomPanner {
    fun float pan(float arg) {
        // nothgin 
        return arg;
    }
    fun void connect(UGen arg) {
    }
}

class PannerFour extends CustomPanner {
    PanFour p;
    fun float pan(float arg) {
        p.pan(arg);
    }
    fun void connect(UGen arg) {
        p.connect(arg);
    }
}

class PannerEight extends CustomPanner {
    Pan8 p => dac;
    fun float pan(float arg) {
        arg * 4.0 => p.pan;
        return arg;
    }
    fun void connect(UGen arg) {
        arg => p;
    }
}
    

class PannerSixteen extends CustomPanner {
    Pan16 p => dac;
    
    fun float pan(float arg) {
        arg * 8.0 => p.pan;
        return arg;
    }
    
    fun void connect(UGen arg) {
        arg => p;
    }
}


public class StepPanSynth extends Chugraph {
    Step i => Safe safe; 
    CustomPanner p;
    
    dac.channels() => int nChannels;
    <<<"number of channels",nChannels>>>;
    
    if (nChannels > 16) {
        (new PannerSixteen) @=> p;
    } else if (nChannels > 7) {
        (new PannerEight) @=> p;
    } else {
        (new PannerFour) @=> p;
    }
    // connect input
    p.connect(safe);
        
        
    null @=> Stream @ _value;
    null @=> Stream @ _dura;
    null @=> Stream @ _pan;
    
    0 => int loop;
    
    samp => dur _timeStep;
    
    fun static StepPanSynth make(Stream value,Stream dura,Stream pan) {
        StepPanSynth synth;
        synth.init(value,dura,pan);
        return synth;
    }
    
    fun StepPanSynth init(Stream value,Stream dura,Stream pan) {
        value @=> _value;
        dura @=> _dura;
        pan @=> _pan;
        spork ~ play();
        return this;
    }
    
    fun StepPanSynth timeStep(dur timeStep) {
        timeStep => _timeStep;
        return this;
    }
    
    fun void play() {
        1 => loop;
        while(loop) {
            _value.next() => i.next;
            _pan.next() => p.pan;
            _dura.next() * _timeStep => now;
        }
    }
    
    fun void stop() {
        0 => loop;
    }     
    
    fun float gain(float arg) {
        arg => safe.gain;
        return arg;
    }      
}





