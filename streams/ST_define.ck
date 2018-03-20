public class ST_define {
    fun ST_define init(string nameArg,float valueArg) {
        valueArg => ST_store.mem[nameArg];
        return this;
    }
}
    