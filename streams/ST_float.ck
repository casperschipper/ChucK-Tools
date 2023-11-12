public class ST_float extends Stream 
{
    "ST_float" @=> _type;
    
    float value;
    
    fun float init(float _value) {
        _value => value;
        return value;
    }
    
    fun float next () {
        return value;
    }
}
