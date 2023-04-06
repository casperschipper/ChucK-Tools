public class ST_latchWalk extends Stream {
    // todo: maybe have an implementation for more?
    null @=> Stream @ st_source;
    null @=> Stream @ st_step;
    
    // init
    0.0 => float _value;
    
    fun void setSource(Stream sourceArg) {
        sourceArg @=> st_source;
    }
    
    fun void setStep(Stream stepArg) {
        stepArg @=> st_step;
    }
    
    fun ST_latchWalk init(Stream sourceArg, Stream stepArg) {
        this.setSource(sourceArg);
        this.setStep(stepArg);
        st_source.next() =>  this._value;

        return this;
    }
    
    fun float next() {
        _value => float tmp;
        if (!st_step.more()) {
            this.reset();
            return tmp;
        } 
        _value + st_step.next() => _value;
        return tmp; 
    }
    
    fun void reset() {
        st_source.next() => _value;
        st_step.reset();
    }
}

