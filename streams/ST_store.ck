public class ST_store extends Stream {
    static float mem[];
    Stream st_input;
    string name;
    
    fun ST_store init(string nameArg,Stream valueArg) {
        valueArg @=> st_input;
        nameArg @=> name;
        return this;
    }
    
    fun float next() {
        st_input.next() => float value;
        value => mem[name];
        return value;
    }
}      

[0.0] @=> ST_store.mem;


        
        