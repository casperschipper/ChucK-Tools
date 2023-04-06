public class ST_sin extends Stream {
    "ST_sin" @=> _type;
    Stream input;
    
    fun ST_sin init(Stream input) {
        input @=> this.input;
        return this;
    }
    
    fun float next() {
        return Math.sin(input.next());
    }
}