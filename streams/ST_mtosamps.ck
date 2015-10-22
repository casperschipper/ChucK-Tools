public class ST_mtosamps extends Stream 
{
    "ST_mtosamps" @=> _type;
    null @=> Stream @ inputStream;
    
    fun ST_mtosamps init(Stream arg) {
        arg @=> inputStream;
        return this;
    }
    
    fun ST_mtosamps make(Stream arg) {
        ST_mtosamps stream;
        stream.init(arg);
        return stream;
    }
    
    fun float next() {
        return 44100.0 / Std.mtof(inputStream.next());
    }
}