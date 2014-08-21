public class ST_mtof extends Stream 
{
    "ST_mtof" @=> _type;
    null @=> Stream @ inputStream;
    
    fun ST_mtof init(Stream arg) {
        arg @=> Stream;
        return this;
    }
    
    fun ST_mtof make(Stream arg) {
        ST_mtof stream;
        stream.init(arg);
        return stream;
    }
    
    fun float next() {
        return Std.mtof(inputStream.next());
    }
}