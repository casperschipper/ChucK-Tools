public class ST_history extends Stream {
    0 => int channel;
    null @=> Stream ST_delaytime;
    1.0 => float delaytime;
    dac.channels() => int nchans;
    
    DelayC del => blackhole;
    del.max(30*second);
    
    fun ST_history init(int channel) {
        channel % nchans => this.channel;
        dac.chan(this.channel) => del;
        return this;
    }
    
    fun ST_history init(int channel,Stream delaytime) {
        init(channel);
        delaytime @=> this.delaytime;
        return this;
    }
    
    fun ST_history init(int channel, float delaytime) {
        init(channel);
        null @=> ST_delaytime;
        delaytime => this.delaytime;
        return this;
    }
    
    fun ST_history init(Stream delaytime) {
        channel @=> this.ST_channel;
        delaytime @=> this.ST_delaytime;
        return this;
    }
        
    
    fun float next() {
        if (ST_delaytime != null) {
            ST_delaytime.next() => delaytime;
        }
        delaytime * second => del.delay;
        return del.last();
    }
}