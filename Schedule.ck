public class Schedule {
    Stream st_procedure;
    Stream st_timer;
    
    0 => int play;
    
    fun Schedule init(Stream arg,Stream arg2) {
        arg @=> st_procedure;
        arg2 @=> st_timer;
        spork ~ Spark();
        return this;
    }
    
    fun Schedule init(Stream arg,Stream arg2,time endTime) {
        arg @=> st_procedure;
        arg2 @=> st_timer;
        spork ~ Spark();
        endTime => now;
        0 => play;
        return this;
    }
    
    fun void Spark() {
        1 => play;
        while(play) {
            st_procedure.next();
            Math.fabs(st_timer.next()) * second => now;
        }
    }
    
    fun Schedule stop() {
        0 => play;
        return this;
    }
    
    fun Schedule procedure(Stream arg) {
        arg @=> st_procedure;
        return this;
    }
    
    fun Schedule procedure(Stream arg) {
        arg @=> st_timer;
        return this;
    }
}

