public class ST_trigger extends Stream {
    null @=> Stream @ value;
    float previous;
    static ST_count @ current;
    
    int id;
    true => int needsUpdate;
    
    static int count;
    
    fun static void trigger() {
        current.next();
    }
    
    fun static void clear() {
        (new ST_count) @=> current;
    }
    
    fun ST_trigger init(Stream arg) {
        if (current == null) {
            (new ST_count) @=> current;
        }
        count => id;
        count++;	
        current.init(count);
        
        arg @=> value;
        value.next() => previous;
        
        return this;
    }
    
    fun float next() {
        if (current.value != id) { // turn on if needs update
            true => needsUpdate;
        } else {
            if (needsUpdate) { // if current id, then update
                value.next() => previous;
                false => needsUpdate; // prevent recursive update
            }
        }
        return previous;
    }
}






