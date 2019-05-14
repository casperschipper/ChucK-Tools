public class ST_hzPhasor extends Stream {
    Stream st_freq;
    
    0.0 => float phase;
    
    (second / samp) => float _SR;
    
    fun ST_hzPhasor init(Stream freq) {
        freq @=> st_freq;
        return this;
    }
    
    fun float next() {
        (st_freq.next() / _SR) => float phaseIncr; 
        //            if( d->num >= 1.0 || d->num < 0.0 ) d->num -= floor( d->num );
        
        if (phase > 1.0) {
            0 => phase;
        }
        if (phase < 0.0) {
            1.0 => phase;
        }
        
        phase + phaseIncr => phase;
            
        return phase;
    }
}