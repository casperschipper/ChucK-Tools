public class ST_avg extends Stream {
    Stream st_input;
    float currAvg;
    
    8 => int num;
    0.0 => float curAvg;
    
    fun ST_avg init(Stream inArg) {
        inArg @=> st_input;
        return this;
    }
    
    fun ST_avg init(Stream inArg,int numArg) {
        inArg @=> st_input;
        numArg => num;
        return this;
    }
   
    fun float next() {
        curAvg + ((st_input.next() - curAvg) / num ) => curAvg;
        return curAvg;
    }
}
            