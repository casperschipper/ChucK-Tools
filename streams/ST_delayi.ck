public class ST_delayl extends Stream 
{
    Stream @ _input;
    null @=> Stream @ st_delay;
    
    float _memory[256];
    int _phase,_maxRead;
    float _readPos,_delay;
    "ST_delay" @=> _type;
    
    fun ST_delayl input (Stream arg) {
        arg @=> _input;
        return this;
    }
    
    fun ST_delayl init(Stream inArg,int maxArg, Stream delayArg) {
        input(inArg);
        maxRead(maxArg);
        delay(delayArg);
        return this;
    }
    
    fun ST_delayl maxRead( int arg ) {
        arg => _maxRead => _memory.size;
        return this;
    }
    
    fun ST_delayl delay( int arg ) {
        null @=> st_delay;
        arg => _delay;
        return this;
    }
    
    fun ST_delayl delay( Stream arg ) {
        arg @=> st_delay;
        return this;
    }
    
    fun float next() {
        (_phase+1) % _maxRead => _phase;
        
        if (st_delay != null) {
            st_delay.next() => _delay;
        }
        
        _input.next() => _memory[_phase];
        
        _delay + _phase => _readPos;
        Math.floor(_readPos) => int bottom;

        cs.safeTableIndex(bottom,_maxRead) => bottom;

        _memory[bottom] => float leftsamp;
        return leftsamp + (
            (_readPos - Math.floor(_readPos)) * 
            (_memory[(bottom + 1) % _maxRead] - leftsamp));
    }        
}
