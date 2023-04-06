public class PercEnv extends Chugraph {
    inlet => Gain VCA;
    Step unit => Envelope l => CurveTable c => VCA => outlet; 
    
    6.0 => float _curve;
    
    3 => VCA.op;
    [0.,1.,-_curve,0.95,0.0,-_curve,1.0,0.0] => c.coefs;
    // 0.95 because of hidden guardpoint of this function.
    1 => unit.next;
    
    dur _duration;
    
    0.95 => l.value;

    
    fun void trigger() {
        0 => l.value;
        0.95 => l.target;
        _duration => l.duration;
    }
    
    fun dur duration(dur duration) {
        duration => _duration;
        duration => l.duration;
        trigger();
        return _duration;
    }
    
    fun dur duration() {
        return _duration;
    }
    
    fun float curve(float curve) {
        [0.,1.,-curve,0.95,0.0,-curve,1.0,0.0] => c.coefs;
        return curve;
    }
    
    fun float curve() {
        return _curve;
    }
}        
    