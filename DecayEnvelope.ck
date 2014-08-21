class DecayEnvelope extends chubgraph {
    inlet => Gain g => outlet;
    
    0 => float value;
    0.99 => float _exp;
    
    fun float setExp(float exp) {
        exp => _exp;
        return exp;
    } 
    
    fun dur setDuration(dur duration) {
        Math.pow(0.001,1.0/(duration/samp)) => _exp;
        return duration;
    }
    
    fun float reset() {
        1 => value;
        return value;
    }
    
    fun float noteOn(float amp) {
        amp => value;
        return amp;
    }
    
    fun float tick() {
        value * _exp => value => g.gain;
    }
}
