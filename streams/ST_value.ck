public class ST_value extends Stream 
{
    "ST_value" @=> _type;
    
    float value;
    
    fun ST_value init(float _value) {
        _value => value;
        return this;
    }
    
    fun static ST_value make(float _value) {
        ST_value stream;
        stream.init(_value);
        return stream;
    }
    
    fun void setValue(float arg) {
        arg => value;
    }
    
    fun float next () {
        return value;
    }
}
