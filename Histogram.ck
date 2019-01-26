class Histogram {
    Stream input;
    
    Dictionary dict;
    
    fun Histogram testStream(Stream arg) {
        return testStream(arg,1000);
    }
    
    fun Histogram testStream(Stream arg,int number) {
        
    }
    
    fun sample() {
        input.nextInt() => int tmp;
        dict.hasKey(tmp+"");
        
        
}

class Dictionary {
    string allKeys[0];
    Object values[0];
    int count;
    
    fun void setValue(string key,Object obj) {
        allKeys << key;
        obj @=> values[key];
        count++;
    }
    
    fun hasKey(string key) {
        return values[key] != null;
    }
    
    fun Object get(string key) {
        return values[key];
    }
    
    fun int remove(string key) {
        if (hasKey(key)) {
            null @=> values[key];
            count--;
            return true;
        }
        return false;
    }
    
    fun string [] allKeys() {
        return allKeys;
    }
    
    fun int size() {
        return count;
    }
}

class Number {
    fun int asInteger() {
        return 0;
    }
    
    fun float asFloat() {
        return 0.0;
    }
    
    fun string asString() {
        "" + asFloat();
    }
}

class Integer extends Number {
    int value;
    
    fun init(int arg) {
        arg => value;
    }
}

class Float extends Number {
    float value;
    fun init(float arg) {
        arg => value;
    }
}

        
    
    
        