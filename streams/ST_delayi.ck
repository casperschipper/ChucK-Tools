public class ST_delayi extends ST_delay 
{
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
        Math.floor(_readPos) $ int => int x0;
        _readPos - x0 => float p;
        _memory[x0] => float y0;
        _memory[(x0+1) & _maxRead] => float y1;
        return cs.linterp(y0,y1,p);
    }        
}
