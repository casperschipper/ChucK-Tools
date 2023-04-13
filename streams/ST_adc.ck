public class ST_adc extends Stream {
    0 => int channel;
    null @=> Stream ST_channel;
    <<<"ST_adc - number of channels in:">>>;
    <<<adc.channels()>>> => int nchans;
    
    fun ST_adc init(int channel) {
        channel % nchans => this.channel;
        return this;
    }
    
    fun ST_adc init(Stream channel) {
        channel @=> this.ST_channel;
        return this;
    }
    
    fun float next() {
        if (ST_channel != null) {
            (ST_channel.next() => Math.floor) $ int => channel;
            channel % nchans => channel;
        }
        if (nchans == 0) {
            return 0.0;
        } else if (nchans == 1) {
            return adc.last();
        } else {
            return adc.chan(channel).last();
        }
    }
}


