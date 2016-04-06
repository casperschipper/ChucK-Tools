public class StreamDict {
    0 => int length;
    string keys[0];
    Stream values[0];
    
    0 => int index;
    
    fun StreamDict store(string keyArg,Stream streamArg) {
        length++; // number of keys increased
        keys.size(length); // change size of keys list
        keyArg @=> keys[length-1]; // store key
        streamArg @=> values[keyArg]; // store item
        return this;
    }
    
    fun StreamDict clear() {
        keys.size(0);
        values.size(0);
        reset();
        return this;
    }
    
    fun StreamDict reset() {
        0 => index;
        return this;
    }
    
    fun int more() {
        if (index < length) {
            return true;
        }
        return false;
    }
    
    fun string nextKey() {
        if (index < length) {
            return keys[index];
        } 
        return null;
    }
    
    fun Stream nextStream() {
        if (index < length) {
            return values[keys[index++]];
        } 
        return null;
    }
    
    fun string [] allKeys() {
        return keys;
    }
    
    fun Stream fetch(string keyArg) {
        if (values[keyArg] != null) {
            return values[keyArg];
        } else {
            <<<"stream not found, returning 0 stream">>>;
            return (new Stream);
        }
    }
}