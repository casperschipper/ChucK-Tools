public class ST_invert extends Stream {
    "ST_invert" @=> _type;
    
    Stream _input;
    
    fun void input(Stream arg) {
        arg @=> _input;
    }
    
    fun float next() {
        if (_input.next() == 0.0) {
            return 1.;
        } else {
            return 0.;
        }
    }
}
        
    