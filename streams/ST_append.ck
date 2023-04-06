public class ST_append extends Stream {
    float _table[];
    Stream st_value;
    
    fun ST_append init(float tabArg[],Stream valueArg) {
        tabArg @=> _table;
        valueArg @=> st_value;
        return this;
    }
    
    fun float next() {
        _table << st_value.next();
        return 0.;
    }
}

/*
class M extends st { 
    [-.1,.1] @=> float foo[];
    append(foo,rv(-.1,.1)) @=> Stream bar;
    
    bar.next();
    bar.next();
    
    StepSynth s => Safe safe => dac;
    s.init(
    index( foo, count( tableCap(foo) ) ),
    st(1));
        
    schedule( bar , st(0.001) );
    
    hour => now;
}

M m;
*/

