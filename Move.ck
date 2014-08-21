public class Move {
    
    Gain gL;
    Gain gR;
    
    fun void set_channels(int one,int two) {
        gL => dac.chan(1);
        gR => dac.chan(0);
    }
    
    fun void pan(float pan) {
        Math.sqrt(pan)             => gL.gain; 
        <<<1.0 - Math.sqrt(pan)>>> => gR.gain;
    }
    
    fun void move(dur dura,int home,int target) {
        set_channels(home,target);
        Step unit => Envelope e => blackhole;
        unit.next(1);
        0 => e.value;
        1 => e.target;
        dura => e.duration;
        now => time then;
        while((now-then)<dura) {
            pan(e.last());
            10::ms => now;
        }
    }
    
    fun void connect(UGen ugen) {
        ugen => gL;
        ugen => gR;
    }
}
    
    
     
    
    
    