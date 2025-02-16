
// Class for JSON Arrays
public class JsonArray extends JsonValue {
    JsonValue array[0];
    
    fun JsonArray(JsonValue lst[]) {
        lst @=> array;
    }
    
    // Constructor
    fun void init() {
        array.size(0);
    }
    
    // Add method
    fun void add(JsonValue val) {
        array << val;
    }
    
    // Encode method
    fun string encode() {
        string result;
        "[" => result;
        for (0 => int i; i < array.size(); i++) {
            if (i > 0) { "," +=> result; }
            array[i].encode() +=> result;
        }
        "]" +=> result;
        return result;
    }
}