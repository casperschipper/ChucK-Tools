public class ST_delayc extends ST_delay 
{   
    fun float next() {
        (_phase+1) & _maxRead => _phase;
        
        if (st_delay != null) {
            st_delay.nextInt() => _delay;
            delayBound(_delay) => _delay;
        }
        
        _input.next() => _memory[_phase];
        _phase - _delay => _readPos;
        while (_readPos < 0)  _maxRead +=> _readPos;
        
        Math.floor(_readPos) => int x0;
        x0 - 1 => x_min1
        x0 + 1 => x1;
        x0 + 2 => x2;
        
        
        
        _memory[x0] => float y0;
        _memory[(x0+1) & _readMax] => float y1;
        return _memory[cs.linterp(y0,y1,p)];
    }        
}
