public class ST_ftom extends Stream {
    float _in;
    null @=> Stream @ st_input;

    fun ST_ftom init(Stream arg) {
        arg @=> st_input;
        return this;
    }
    
    fun float next() {
        if (st_input != null) st_input.next() => _in;
        return Std.ftom(_in);
    }
}        