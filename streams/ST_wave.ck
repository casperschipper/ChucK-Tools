// this class allows you to use a frequency to read a buffer.
public class ST_wave extends Stream {
    ST_index lookup;
    ST_boundedWalk myIndex;
    
    fun ST_wave init(float tableArg[],Stream freqArg) {
        tableArg.cap() => size;
        ;
        
        lookup.init(tableArg , myIndex
        .min(0)
        .max(size)
        .step( (new ST_mup).init((1.0 / size),freqArg)));
        return this;
    }
    
    fun float next() {
        return lookup.next();
    }
    
    fun ST_wave min(Stream arg) {
        myIndex.min(arg);
        return this;
    }
    
    fun ST_wave max(Stream arg) {
        myIndex.max(arg);
        return this;
    }
    
}