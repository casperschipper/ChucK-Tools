public class ST_oscin extends Stream {
    static OSC_Read @ osc_read;
    string name;
    
    fun ST_oscin init(string name) {
        name @=> this.name;
        osc_read.makePar(name,"/"+name+", f");
        return this;
    }
    
    fun ST_oscin init(string name,float default) {
        name @=> this.name;
        osc_read.makePar(name,"/"+name+", f",default);
        return this;
    }
    
    fun float next() {
        return osc_read.values[name];
    }
}

(new OSC_Read) @=> ST_oscin.osc_read;
        