public class ST_monitor extends Stream {
    Stream @ st_input;
    int count;
    
    fun ST_monitor init(Stream arg) {
        arg @=> st_input;
        return this;
    }
    
    fun float next() {
        st_input.next() => float nxt;
        if (count > 4410) {
            <<<nxt>>>;
            0 => count;
        }
        count + 1 => count;
        return nxt;
    }
}