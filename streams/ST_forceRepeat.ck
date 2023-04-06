public class ST_forceRepeat extends Stream {
    // this will force a "holding" stream to continue after stopping.
    
    Stream @ input;
    Stream @ reps;
    0 => int N;
    
    0 => int _more;
    
    
    fun ST_forceRepeat init(Stream input, Stream reps) {
        reps @=> this.reps;
        input @=> this.input;
        this.reps.nextInt() => N;
        if (N < 0) { 
            0 => N;
        }
        return this;
    }
    
    fun int more() {
        input.more() => int state;
        if (!state) {
            N--;
            if (N == 0) {
                this.reps.nextInt() => N;
                return false;
            }
        }
        return true;
    }
        
        
    fun float next() {
        return this.input.next();
    }
}
        