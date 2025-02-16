
// Class for JSON Integers
public class JsonInt extends JsonValue {
    int value;
    
    fun JsonInt(int val) {
        init(val);
    }
    
    // Constructor
    fun void init(int val) {
        val => value;
    }
    
    // Encode method
    fun string encode() {
        return value + "";
    }
}