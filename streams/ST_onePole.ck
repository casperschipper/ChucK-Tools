public class ST_onePole extends Stream {
    
    (2.0 * pi) * (1.0 / 44100.0) => float w;
    
    Stream st_input, st_freq;
    
    float y_previous;
  
    
    fun ST_onePole init (Stream input,Stream freq) {
        input @=> st_input;
        freq @=> st_freq;
        return this;
    }
    
    fun float next() {
        Math.sin (st_freq.next() * w) => float a0;
        (st_input.next() * a0) + ((1.0 - a0) * y_previous) => y_previous;
        return y_previous; 
        
        
    }
}

