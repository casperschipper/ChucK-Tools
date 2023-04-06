public class ST_weave extends Stream
{
    "ST_weave" @=> _type;
    
    Stream streams[];
    0 => int weaveAmountOfStreams;
    0 => int weaveStreamIndex;
    
    
    fun void init(Stream _streams[]) {
        _streams @=> streams;
    }
    
    fun void init(Stream _stream1,Stream _stream2,Stream _stream3, Stream _stream4)
    {
        [_stream1,_stream2,_stream3,_stream4] @=> streams;
    }
    
    fun void init(Stream _stream1,Stream _stream2,Stream _stream3, Stream _stream4, Stream _stream5, Stream _stream6, Stream _stream7, Stream _stream8) {
        [_stream1,_stream2,_stream3,_stream4,_stream5,_stream6,_stream7,_stream8] @=> streams;
    }
    
    fun float next() {
        streams[weaveStreamIndex].next() => float value;
        (weaveStreamIndex + 1) % weaveAmountOfStreams => weaveStreamIndex;
        return value;
    }
}