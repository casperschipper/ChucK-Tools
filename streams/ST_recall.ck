public class ST_recall extends Stream {
    string name;
    fun ST_recall init(string nameArg) {
        nameArg @=> name;
        return this;
    }
    
    fun float next() {
        return ST_store.mem[name];
    }
}