public class ST_abs extends Stream {
    Stream _input;
    
    fun ST_abs init(Stream arg) {
        arg @=> _input;
        return this;
    }
    
    fun float next() {
        return (_input.next() => Math.fabs);
    }
    
    fun int more() {
        return _input.more();
    }
}
        
    