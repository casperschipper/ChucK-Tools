public class ST_funkStream extends Stream {
    // a Stream is reading a funk. 
    // it is similar to index, but the indexed list is itself an object (means that it can be dynamic) instead of an array.
    null @=> Stream @ _x;
    null @=> Funk @ _funk;
    
    fun ST_funkStream x (Stream arg) {
        arg @=> _x;
        return this;
    }
    
    fun ST_funkStream funk( Funk arg) {
        arg @=> _funk;
        return this;
    }
    
    fun float next() {
        return _funk.x(_x.next());
    }
}