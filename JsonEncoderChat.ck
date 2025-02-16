


// Class for JSON Strings
class JsonString extends JsonValue {
    string value;
    
    // Constructor
    fun void init(string val) {
        val => value;
    }
    
    // Encode method
    fun string encode() {
        return "\"" + value + "\"";
    }
}

// Class for JSON Integers
class JsonInt extends JsonValue {
    int value;
    
    // Constructor
    fun void init(int val) {
        val => value;
    }
    
    // Encode method
    fun string encode() {
        return value + "";
    }
}

// Class for JSON Floats
class JsonFloat extends JsonValue {
    float value;
    
    // Constructor
    fun void init(float val) {
       val => value;;
    }
    
    // Encode method
    fun string encode() {
        return value + "";
    }
}

// Class for JSON Booleans
class JsonBool extends JsonValue {
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

// Class for JSON Arrays
class JsonArray extends JsonValue {
    JsonValue array[0];
    
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



public class JsonEncoder {
    fun static JsonObject json_obj() {
        return JsonObject obj;
    } 
    
    fun static JsonObject add(JsonObject obj, string key, JsonObject arg) {
        obj.add(key,arg);
        return obj;
    }
        
   
   // Helper functions to create JSON values
   fun static JsonString json_str(string val) {
       JsonString json;
       json.init(val);
       return json;
   }
   
   fun static JsonInt json_int(int val) {
       JsonInt json;
       json.init(val);
       return json;
   }
   
   fun static JsonFloat json_float(float val) {
       JsonFloat json;
       json.init(val);
       return json;
   }
   
   fun static JsonBool json_bool(int val) {
       JsonBool json;
       json.init(val);
       return json;
   }
   
   fun static JsonArray json_arr(JsonValue val[]) {
       JsonArray json;
       json.init();
       for (int i;i<val.cap();i++) {
           json.add(val[i]);
       }
       return json;
   }
}

