public class ST_monitor extends Stream {
    Stream @ st_input;
    
    fun ST_monitor init(Stream arg) {
        arg @=> st_input;
        return this;
    }
    
    fun float next() {
        return <<<st_input.next()>>>;
    }
}