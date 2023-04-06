class SERIES {
    Clist array;
    int a,z;
    
    fun int next() {
        if (array.size() == 0) {
            array.range(a,z+1);
            array.shuffle();
        }    
        return array.takeRand();
    }
    
    fun void init(int A,int Z) {
        A => a; Z => z;
        array.range(a,z+1);
        array.shuffle();
    }
}

class ALEA {
    int a,z;
    
    fun int next() {
        return Std.rand2(a,z);
    }
    
    fun int init(int A,int Z) {
        A => a;
        Z => z;
    }
}
        
class GROUP
{
    int a,z,n,type,la,lz;
    SERIES ser,lser;
    ALEA ale,lale;
    int rep;
    int value;

    fun int next() {
        if (type == 1) return AA();
        if (type == 2) return AS();
        if (type == 3) return SA();
        if (type == 4) return SS();
        else <<<"wrong typenr">>>;
    }
    
    fun int AA() {
        if (rep == 0) {
            ale.next() => value;
            lale.next() => rep;
        }
        rep--;
        return value;
    }
    
    fun int AS() {
        if (rep == 0) {
            ale.next() => value;
            lser.next() => rep;
        }
        rep--;
        return value;
    }
    
    fun int SA() {
        if (rep == 0) {
            ser.next() => value;
            lale.next() => rep;
        }
        rep--;
        return value;
    }
    
    fun int SS() {
        if (rep == 0) {
            ser.next() => value;
            lser.next() => rep;
        }
        rep--;
        return value;
    }
    
    fun void init(int A,int Z,int N,int TYPE,int LA,int LZ) {
        A => ale.a => ser.a;
        Z => ale.z => ser.z;
        N => n;
        TYPE => type;
        LA => lale.a => lser.a;
        LZ => lale.z => lser.z;
    }
    
    fun Clist list() {
        Clist output;
        output.size(n);
        for (int i;i<n;i++) {
            output.sv(i,next());
        }
        return output;
    }    
}

SqrOsc c => Envelope e => dac;

.1 => c.gain;

GROUP gr;

gr.init(1,7,30,1,1,7);



while(1) {
    ((gr.next()*8) + 40) => Std.mtof => c.freq;
    1 => e.target;
    1::samp => e.duration => now;
    1 => e.target;
    (1/c.freq())*16::second => e.duration => now;
}



        
        
                
        
    
