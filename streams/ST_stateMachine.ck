public class ST_stateMachine extends Stream {
    "ST_stateMachine" @=> _type;
    null @=> Stream @ states[];
    
    fun ST_stateMachine init(Stream arg[]) {
        arg @=> states;
        return this;
    }
    
    fun float next() {
        states[index].nextInt() => int tmp;
        tmp % states.cap() => index;
        return index $ float;
    }
}
        