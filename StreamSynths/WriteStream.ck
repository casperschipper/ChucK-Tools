public class WriteStream {
    float _table[];
    
    Stream @ st_index;
    Stream @ st_value;
    Stream @ st_timer;
    
    // (index, value) 
    // pointer to table
    
    false => int loop;
    
    second => dur _timeStep;
    
    
    fun WriteStream table(float arg[]) {
        arg @=> _table;
        return this;
    }
    
    fun WriteStream index(Stream arg) {
        arg @=> st_index;
        return this;
    }
    
    fun WriteStream value(Stream arg) {
        arg @=> st_value;
        return this;
    }
    
    fun WriteStream timer(Stream arg) {
        arg @=> st_timer;
        return this;
    }
    
    fun WriteStream timeStep(dur arg) {
        arg => _timeStep;
        return this;
    }
    
    fun void shred() {
        1 => loop;
        while(loop) {
            st_value.next() => float tmp;
            st_index.nextInt() => int idx;
            cs.wrap(idx,0,_table.cap()) => idx;
            tmp => _table[idx];
            st_timer.next() * _timeStep => now;
        }
    }
    
    fun WriteStream start() {
        spork ~ shred();
        return this;
    }
    
    fun WriteStream stop() {
        0 => loop;
    }
    
}
