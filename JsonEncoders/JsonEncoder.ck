public class JsonEncoder {
   // Helper functions to create JSON values
   fun static JsonString json_str(string val) {
       JsonString json;
       json.init(val);
       return json;
   }
   
   fun static JsonObject json_obj() {
       JsonObject json;
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
   
   fun static JsonString json_string(string val) {
       JsonString json;
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

