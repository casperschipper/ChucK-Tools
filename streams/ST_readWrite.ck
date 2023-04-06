public class ST_readWrite extends Stream {
    // this combines reading and writing to a table, it doesn't use a timer shred, timing is defined by reading index
    "ST_ReadWrite" @=> _type;
    Stream @ st_writevalue;
    Stream @ st_writeIndex;
    float _table[];
    ST_index @ st_index;
    int _overwrite;
    
    fun ST_readWrite init(float tableArg[],Stream readIndexArg,Stream valueArg,Stream writeIndexArg,int overwriteArg) {
        valueArg @=> st_writevalue;
        writeIndexArg @=> st_writeIndex;
        tableArg @=> _table;
        (new ST_index).init(_table,readIndexArg) @=> st_index;
        tableArg.cap() => size;
        overwriteArg => _overwrite;
        return this;
    }
    
    fun int more() {
        return st_index.more();
    }
    
    fun float next() {
        cs.safeTableIndex(st_writeIndex.nextInt(),size) => int index;
        // overwrite adds the new value to the previous
        float previous;
        if (_overwrite) {
            _table[index] => previous;
        }
        // previous is zero if ignored.
        st_writevalue.next() + previous => _table[index];

        return st_index.next();
    }
}



