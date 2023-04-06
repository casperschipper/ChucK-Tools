public class StepChannelSynth extends Chugraph {
    Step step;
        
    null @=> Stream @ _value;
    null @=> Stream @ _dura;
    null @=> Stream @ _channel;
    
    dac.channels( ) => int nChannels;
    <<<"number of chans",dac.channels()>>>;
    
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
            step => dac.chan(channel);
            
            _value.next() => step.next; 
            _dura.next() * _timeStep => now;
            
            step !=> dac.chan(channel);   
        }
    }
    
    fun void stop() {
        0 => loop;
    }       
}




