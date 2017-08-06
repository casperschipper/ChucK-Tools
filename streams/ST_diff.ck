public class ST_diff extends Stream {
    Stream st_input;
    float mem;
    
    fun ST_diff init(Stream arg) {
        arg @=> st_input;
        return this;
    }
    
    fun float next() {
        mem => float tmp;
        st_input.next() => mem;
        return mem - tmp;
    }
}