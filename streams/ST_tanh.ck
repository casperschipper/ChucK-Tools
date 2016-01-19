public class ST_tanh extends Stream {
    Stream @ st_input;
    
    fun ST_tanh input(Stream arg) {
        arg @=> st_input;
        return this;
    }
    
    fun int more() {
        return st_input.more();
    }
    
    fun float next() {
        return Math.tanh(st_input.next());
    }
}