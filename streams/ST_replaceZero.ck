public class ST_replaceZero extends Stream {
    Stream @ st_input;
    
    fun ST_replaceZero init(Stream arg) {
        arg @=> st_input;
        return this;
    }
  
    fun float next() {
        st_input.next() => float x;
        if (x == 0) return 0.00001;
        else return x;
    }
}