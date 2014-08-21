Expsig2 extends Chubgraph {
    Linseg l => Buffer exptable => outlet;
    Step offset => 
    
    4096 * samp => exptable.max;
    exptable.exp();
    
    2 => exptable.sync;
    
    l.gain(4096);
    
    fun float value (float _value) {
        _value => l.value;
    }
    
    fun float target (float _target) {
        _target => l.target;
}