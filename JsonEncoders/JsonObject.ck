// Class for JSON Objects
public class JsonObject extends JsonValue {
    string keys[0];
    JsonValue values[0];
    
    fun JsonObject() {
        init();
    }
    
    // Constructor
    fun void init() {
        keys.size(0);
        values.size(0);
    }
    
    // Add method
    fun void add(string key, JsonValue val) {
        keys << key;
        values << val;
    }
    
    // Encode method
    fun string encode() {
        string result;
        "{" => result;
        for (0 => int i; i < keys.size(); i++) {
            if (i > 0) { "," +=> result; }
            "\"" + keys[i] + "\":" + values[i].encode() +=> result;
        }
        "}" +=> result;
        return result;
    }
}