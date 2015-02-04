// a class that does 
// input - (input % divisor);
public class ST_mod extends Stream {
    Stream @ st_input;
    Stream @ st_divisor;
    
    fun ST_mod init(Stream arg,Stream arg2) {
        arg @=> st_input;
        arg2 @=> st_divisor;
        return this;
    }
    
    fun float next() {
        st_input.next() => float in;
        return in - (in % st_divisor.next());
    }
}
