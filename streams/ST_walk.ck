public class ST_walk extends Stream {
    null @=> Stream @ st_step;
    
    float value;
    float step;
    
    fun ST_walk init(float _value,float _step) {
        _value => value;
        _step => step;
        null @=> st_step;
        return this;
    }
    
    fun ST_walk init(float _value,Stream _step) {
        _value => value;
        _step @=> st_step;
        return this;
    }
    
    fun static ST_walk make(float _value,float _step) {
        ST_walk stream;
        stream.init(_value,_step);
        return stream;
    }
    
    fun static ST_walk make(float _value,Stream _step) {
        ST_walk stream;
        stream.init(_value,_step);
        _step @=> stream.st_step;
        return stream;    
    }
    
    fun float next() {
        if (st_step != null) {
            st_step.next() => step;
        }
        step + value => value;
        return wrap();
    }
    
    // here you can do advanced stuff with boundaries.
    fun float wrap() {
        return value;
    }
}
