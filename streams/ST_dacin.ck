public class ST_dacin extends Stream {
    0 => int channel;
    null @=> Stream ST_channel;
    <<<"ST_outin - output channels :">>>;
    <<<dac.channels()>>> => int nchans;
    
    fun ST_dacin init(int channel) {
        channel % nchans => this.channel;
        return this;
    }
    
    fun ST_dacin init(Stream channel) {
        channel @=> this.ST_channel;
        return this;
    }
    
    fun float next() {
        if (ST_channel != null) {
            (ST_channel.next() => Math.floor) $ int => channel;
            channel % nchans => channel;
        }
        return dac.chan(channel).last();
    }
}

/*
class M extends st {
    SinOsc osc => dac.left;
    osc.gain(0.1);
    StepSynth synth => dac;
    
    (new ST_dacin).init(0) @=> Stream dacin;
    
    synth.init(
    sum(dacin,rv(-0.1,0.1))
    ,st(1));
}


M m;

*/




