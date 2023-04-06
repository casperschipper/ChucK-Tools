public class ChannelSynth extends Chugraph {
    SawOsc c;
    
    null @=> Stream @ _value;
    null @=> Stream @ _dura;
    null @=> Stream @ _amp;
    null @=> Stream @ _channel;
    
    dac.channels( ) => int nChannels;
    <<<dac.channels()>>>;
    
    int channel;
    
    0 => int loop;
    
    samp => dur _timeStep;
    
    fun static ChannelSynth make(Stream value,Stream dura) {
        ChannelSynth synth;
        synth.init(value,dura);
        return synth;
    }
    
    fun ChannelSynth init(Stream value,Stream dura) {
        value @=> _value;
        dura @=> _dura;
        spork ~ play();
        return this;
    }
    
    fun ChannelSynth init(Stream value,Stream dura,Stream amp,Stream channel) {
        value @=> _value;
        dura @=> _dura;
        amp @=> _amp;
        channel @=> _channel;
        spork ~ play();
        return this;
    }
    
    fun ChannelSynth timeStep(dur timeStep) {
        timeStep => _timeStep;
        return this;
    }
    
    fun void play() {
        1 => loop;
        while(loop) {
            Math.floor(_channel.next() % nChannels) $ int => channel;
            c => dac.chan(channel);
            
            if (_amp != null) {
                _amp.next() => c.gain;
            }
            _value.next() => c.freq;
            _dura.next() * _timeStep => now;
            c !=> dac.chan(channel);   
        }
    }
    
    fun void stop() {
        0 => loop;
    }       
}




