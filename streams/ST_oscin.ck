public class ST_oscin extends Stream {
    OSC_Read osc_read;
    string name;
    
    fun ST_oscin init(int port, string name) {
        name @=> this.name;
        osc_read.makePar(name,"/"+name+", f");
        return this;
    }
    
    fun float next() {
        return osc_read.values[name];
    }
}
        