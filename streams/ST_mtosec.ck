public class ST_mtosec extends Stream {
    "ST_mtosec" @=> _type;
    
    Stream @ input;
    
    fun ST_mtosec init(Stream arg) {
        arg @=> input;
        return this;
    }
    
    fun float freqToSeq (float freq) {
        return 1.0 / freq;
    }
    
    fun float next() {
        return (input.next() => Std.mtof => freqToSeq);
    }
}
        
       
       
      
    