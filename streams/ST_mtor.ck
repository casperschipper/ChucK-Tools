public class ST_mtor extends Stream {
    "ST_mtor" @=> _type;
    
    null @=> Stream @ input;
    
    fun ST_mtor init(Stream arg) {
        arg @=> input;
        return this;
    }
    
    fun int more() {
        return input.more();
    }
           
    fun float next() {
        return cs.mtor(input.next());
    }
}
