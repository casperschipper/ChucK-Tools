class Expseg extends Chugraph {
    Step unit => Envelope e => Gen5 gen5 => Gain mup => Gain sum => outlet;
    Step offset => sum;
      
    1 => unit.next;
    
    [0.0001,.5,1,.5,0.0001] => gen5.coefs;
    
    float val;
    
    fun float value (float _value) {
        _value => val => offset.next;
        return _value;
    }
    
    fun float target (float _target) {
        _target - val => mup.gain;
        0 => e.value;
        .5 => e.target; 
        return _target;
    }
         
    fun dur duration (dur dura) {
        dura => e.duration;
        return dura;
    }
}

Expseg test => SinOsc c => Envelope e => dac;

test.value(15000);
test.target(50);

50::ms => test.duration;

while(1) {
    1::ms => now;
    <<<test.last()>>>;
}
        
        
        