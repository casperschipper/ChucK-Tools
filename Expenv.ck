public class Expenv extends Chugraph {
    inlet => Gain g => outlet;
    Step unit => Envelope e => g; 
    1 => unit.next;
    e => g;
    3 => g.op;
    
    fun dur duration (dur _dur) {
        _dur => e.duration;
        return _dur;
    }
    
    fun float value (float _value) {
        _value => e.value;
        return _value;
    }
    
    fun float target (float _target) {
        _target => e.target;
        return _target;
    }   
}