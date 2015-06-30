public class ST_walk extends Stream {
    null @=> Stream @ st_step;
    
    0 => float initialValue;
    float _value;
    float _step;
    
    fun ST_walk step(Stream stepArg) {
        stepArg @=> st_step;
        return this;
    }
    
    fun ST_walk setStep(float stepArg) {
        null @=> st_step;
        stepArg @=> _step;
        return this;
    }
    
    fun ST_walk init(float valueArg,float stepArg) {
        valueArg => _value => initialValue;
        stepArg => _step;
        null @=> st_step;
        return this;
    }
    
    fun ST_walk init(float valueArg,Stream stepArg) {
        valueArg => value => initialValue;
        stepArg @=> st_step;
        return this;
    }
    
    fun static ST_walk make(float valueArg,float stepArg) {
        ST_walk stream;
        stream.init(valueArg,stepArg);
        return stream;
    }
    
    fun static ST_walk make(float valueArg,Stream stepArg) {
        ST_walk stream;
        stream.init(valueArg,stepArg);
        stepArg @=> stream.st_step;
        return stream;    
    }
    
    fun float next() {
        if (st_step != null) {
            st_step.next() => _step;
        }
        _step + _value => _value;
        wrap();
        return _value;
    }
    
    // here you can do advanced stuff with boundaries.
    fun void wrap() {
        // nothing;
    }
}
