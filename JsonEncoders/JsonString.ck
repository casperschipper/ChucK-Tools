

// Class for JSON Strings
public class JsonString extends JsonValue {
    string value;
    
    fun JsonString(string arg) {
        arg => value;
    }
    
    // Constructor
    fun void init(string val) {
        val => value;
    }
    
    // Encode method
    fun string encode() {
        return "\"" + value + "\"";
    }
}