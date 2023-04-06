class ST_sortGroup extends Stream {
    null @=> Stream @ st_input;
    
    float table[ 2 << 14 ];
    
    int i,n;
    
    fun void fill() {
        0 => index => i;
        while(st_input.more()) {
            st_input.next() => table[i];
            i++;
        }
        i => size => n;
        sort();
    }
    
    fun void sort() {
        cs.quickSortF(table,size);
    }
    
    fun ST_sortGroup init(Stream arg) {
        arg @=> st_input;
        fill();
        
        return this;
    }
    
    fun float next() {
        if ( n == 0 ) {
            fill();
        }
        n--;
        return table[index++];
    }

}


class M extends st {
    line( seq(30,128), ch(cs.grow(0.001,2,8)) ) @=> Stream a;
    line( seq(30,128), ch(cs.grow(0.001,2,8)) ) @=> Stream b;

    (new ST_sortGroup).init( latch(rv(a,b), rv(1,10) ) ) @=> Stream blah;

    SuperChuck sc;
    
    0.01 * second => now;
    
    sc.instrument("ping");
    sc.timer(linlin(sine(line(seq([0.1,0.11]),ch(1,10))),st(-1),st(1),st(0.001),st(0.5)));
    sc.addPar("freq",mtof(sum(blah,0)));
    sc.addPar("duration",line(ch(cs.grow(0.009,2,11)),rv(1,4)));
    sc.addPar("pos",sine(cs.rvf(0.1,1.3)));
    sc.play();
    
     

        
}

M m[4];

hour => now;
        
        
        