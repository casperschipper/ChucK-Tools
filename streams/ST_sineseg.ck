public class ST_sineseg extends Stream {
    float phase;
    float incr;
    
    3.1415926535 * 2.0 => float TWOPI;
    
    Stream st_steps;
    
    fun ST_sineseg init( Stream arg ) {
        arg @=> st_steps;
        1.01 => phase;
        return this;
    }
    
    fun float next() {
        if (phase > 1.0) {
            1.0 / st_steps.next() => incr;
            chout <= (incr*44100) <= IO.newline();
            0 => phase;
        }   
        incr +=> phase;
        return Math.sin( phase * TWOPI );
    }
}


    