public class ST_delay extends Stream 
{
    Stream @ _input;
    null @=> Stream @ st_delay;
    
    float _memory[256];
    int _phase,_readPos,_delay,_maxRead;
    "ST_delay" @=> _type;
    
    fun ST_delay input (Stream arg) {
        arg @=> _input;
        return this;
    }
    
    fun ST_delay init(Stream inArg,int maxArg, Stream delayArg) {
        input(inArg);
        maxRead(maxArg);
        delay(delayArg);
        return this;
    }
    
    fun ST_delay maxRead( int arg ) {
        arg => Math.nextpow2 => int nextPow;
        _memory.size(nextPow);
        nextPow - 1 => _maxRead;   
        return this;
    }
    
    fun ST_delay delay( int arg ) {
        null @=> st_delay;
        arg & _maxRead => _delay;
        return this;
    }
    
    fun ST_delay delay( Stream arg ) {
        arg @=> st_delay;
        return this;
    }
    
    fun int delayBound(int value) {
        if (value < 0) {
            return _maxRead - ((-1 * value) & _maxRead);
        } else {
            return value & _maxRead;
        }
    }
    
    fun float next() {
        (_phase+1) & _maxRead => _phase;
        
        if (st_delay != null) {
            st_delay.nextInt() => _delay;
            delayBound(_delay) => _delay;
        }
        
        _input.next() => _memory[_phase];
        _phase - _delay => _readPos;
        while (_readPos < 0)  _maxRead +=> _readPos;        
        return _memory[_readPos];
    }        
}
