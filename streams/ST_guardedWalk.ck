class Guard {
    // default is always.
    ST_operator st_funktor;
    
    fun Guard funktor(ST_operator arg) {
        arg @=> st_funktor;
        return this;
    }
    
    fun Guard init(ST_operator funktorArg) { 
        funktorArg @=> st_funktor;
        return this;
    }
    
    fun int test(float in) {
        // returns true always;
        return 1;
    }
    
    fun float apply(float in) {
        // if test is true, apply funktor
        return st_funktor.nextCurry(in);
    }
}


class GuardTest extends Guard { 
    ST_operator st_test;
    
    fun Guard init(ST_operator arg,ST_operator funktorArg) { 
        arg @=> st_test;
        funktorArg @=> st_funktor;
        return this;
    }
       
   fun int test(float in) {
       return (st_test.nextCurry(in) > 0);
   }

   fun float apply(float in) {
       // if test is true, apply funktor
       return st_funktor.nextCurry(in);
   }
}

class GuardControl extends Guard { 
    // 
    Stream control;
        
    fun Guard init(Stream controlArg,ST_operator funktorArg) {
        controlArg @=> control;
        funktorArg @=> st_funktor;
        return this;
    }
    
    fun int test(float in) {
        if (controlArg.next() > 0) {
            return 1;
        }
    }
    
    fun float apply(float in) {
        // if test is true, apply funktor
        return st_funktor.nextCurry(in);
    }
}


class ST_guardedWalk extends ST_walk {
    // guarded walk
    Guard guards[];
       
    fun ST_guardedWalk init( float startArg, Guard guardsArg[] ) {
        startArg => _value;
        setGuards(guardsArg);
        return this;
    }
    
    fun ST_guardedWalk addGuard(Guard arg) {
        guards << arg;
        return this;
    }
    
    fun ST_guardedWalk setGuards(Guard arg[]) {
        arg @=> guards;
        return this;
    }
    
    fun float next() {
        0 => int i;
        true => int defaultCase;
                
        for(;i < guards.cap();i++) { // try untill you find a guard, note: only one guard is applied per step!
            if (guards[i].test(_value)) {
                false => defaultCase;
                break;
            }
        }
        if (defaultCase) {
            return _value; // dont' do nothin
        }
        guards[i].apply(_value) => _value; // apply connected step;
        return _value;
    }       
}

class M extends st {    
    (new GuardTest).init( 
        smaller( st(30) ), mup(st(1.5)) 
    ) @=> Guard @ g1;
    (new GuardTest).init(
        bigger(st(800)), div(st(2)) 
    ) @=> Guard g2;   
    
    (new Guard).init( div(st(2)) ) @=> Guard g3; 
    
    PingSynth synth => Safe safe => dac;
    synth.init(
    (new ST_guardedWalk).init(400,[g1,g2,g3]),
    st(0.14),       
    st(0.99),
    st(1.0));
}

M m ;
hour => now;
    