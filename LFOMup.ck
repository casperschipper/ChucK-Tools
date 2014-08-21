public class LFOMup extends Chubgraph {
    inlet => Gain VCA => outlet;
    SinOsc LFO => Scaler s => VCA;
    3 => VCA.op;
    s.set(-1,1,0,1);
    
    fun float freq(float _freq) {
        _freq => LFO.freq;
        return _freq;
    }
}
  /*    
SinOsc test => LFOMup mup => Tanh h1 => dac.left;
SinOsc test2 => LFOMup mup2 => Tanh h2 => dac.right;

mup.freq(5);
mup2.freq(3);

test.freq(8000);
test2.freq(8300);

.1 => h1.gain => h2.gain;
hour => now;  
    */