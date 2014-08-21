public class ST_delay extends Stream 
{
    Stream @ input;
    float memory[256];
    int phase,readPos,delay,maxRead;
    "ST_delay" @=> _type;
    
    
    fun void init(Stream _input,int _maxRead,int _delay) {
        if (_delay > maxRead) { maxRead-1  => delay; };
        _maxRead => maxRead => memory.size;
        _input @=> input;
        _delay => delay;
    }
    
    fun float next() {
        (phase+1) % maxRead => phase;
        
        input.next() => memory[phase];
        phase - delay => readPos;
        while (readPos < 0)  maxRead +=> readPos;
        <<<phase,readPos,"phase/readpos">>>;
        
        return memory[readPos];
    }        
}
