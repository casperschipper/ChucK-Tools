
// Class for JSON Booleans
public class JsonBool extends JsonValue {
    int value; // 0 for false, 1 for true
    
    // Constructor
    fun void init(int val) {
        val => value;;
    }
    
    // Encode method
    fun string encode() {
        if (value) {
            return "true";
        }
        else {
            return "false";
        }
        
    }
}