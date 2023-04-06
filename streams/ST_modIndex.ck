public class ST_modIndex extends Stream {
    /* index two different tables with one input.
    it is similar to a slide over the keys on a piano.
    the pitch classes repeat throughout the octaves 
    so table1 can be seen as pitch classes while table2 is the octaves.
    
    pseudocode:
    divide the signal through number of cycles
    remainder is index for table1
    actual result is used as index for tabel2
    sum both
    
    */ 
    
    Stream st_input;
    float breakpoint;
    int cycles;
    float table1[]; int size1;
    float table2[]; int size2;
    
    fun ST_modIndex init(Stream inputArg,float table1Arg[],float table2Arg[]) {
        
        inputArg @=> this.st_input;
        table1Arg.cap() => this.cycles;
        1.0 / cycles => this.breakpoint; 
        
        table1Arg @=> this.table1;
        table1Arg.cap() => this.size1;
        table2Arg @=> this.table2; 
        table2Arg.cap() => this.size2;
        
        return this;
    }
    
    fun float next() {
        st_input.next() => float value;
        
        (value + 1.0) * 0.5 => value;
        
        value / breakpoint => float div;
        ((Math.floor( div ) / cycles) * size1) $ int => int index1;
        Math.floor((div - index1) * size2) $ int => int index2;
        
        cs.safeTableIndex( index1 , size1-1) => index1;
        cs.safeTableIndex( index2 , size2-1) => index2;
        
        return table1[index1] + table2[index2];
    }
}

/*
class M extends st {
    fun void event(float freq,dur dura) {
        SinOsc osc => Envelope env => dac;
        osc.freq(freq);
        env.value(.05);env.target(0);
        dura => env.duration => now;
        
    }
    
    ST_modIndex foo;
    cs.grow(100,1.5,8) @=> float tab1[];
    [1000.,500,-200] @=> float tab2[];
     line(seq([st(-1),st(1)]), ch([2]) ) @=> Stream idx;
    foo.init( idx, 8, tab1, tab2 );
    
 
    
    while(1) {
        spork~ event(foo.next(), 1.5::second);
        1.0::second / 5 => now;
    }
}

M m;
minute => now;
            
            */
        