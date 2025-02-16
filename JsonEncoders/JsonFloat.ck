// Class for JSON Floats
public class JsonFloat extends JsonValue {
    float value;
    
    fun JsonFloat(float val) {
        init(val);
    }
    
    // Constructor
    fun void init(float val) {
        val => value;;
    }
    
    // Encode method
    fun string encode() {
        return value + "";
    }
}