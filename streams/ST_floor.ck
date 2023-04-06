public class ST_floor extends Stream {
    "ST_floor" @=> _type;
    
    Stream @ st_input;
    
    fun ST_floor init(Stream arg) {
        arg @=> st_input;
        return this;
    }
    
    fun float next() {
        return Math.floor(st_input.next()) $ float;
    }
}