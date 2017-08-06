public class ST_hzPhasor extends Stream {
    Stream st_freq;
    
    float phase;
    
    (samp / second) $ int=> int _SR;
    
    fun ST_hzPhasor init(Stream arg) {
        arg @=> st_freq;
        return this;
    }
    
    fun float next() {
        (st_freq.next() / _SR) => float phaseIncr; 
        //            if( d->num >= 1.0 || d->num < 0.0 ) d->num -= floor( d->num );

        if (phaseIncr < 0.0 || phaseIncr >= 1.0) {
            Math.floor(phaseIncr) -=> phaseIncr;
        }
        
        phase + phaseIncr => phase;
            
        return phase;
    }
}