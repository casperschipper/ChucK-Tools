public class ST_monitor extends Stream {
    Stream @ st_input;
    0 => int count;
    4410 => int _interval;
    
    fun ST_monitor init(int arg1,Stream arg) {
        arg @=> st_input;
        arg1 => _interval;
        return this;
    }
    
    fun float next() {
        count + 1 => count;
        st_input.next() => float nxt;
        if (count >= _interval) {
            <<<nxt>>>;
            0 => count;
        }
        return nxt;
    }
}