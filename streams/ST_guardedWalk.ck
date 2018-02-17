class Guard { 
    // a test and a funktor (which changes the value when test is true)
   Operator st_test;
   Operator st_funktor;
   fun Guard init(Operator testArg,Operator funktorArg) {
       testArg @=> st_test;
       funktorArg @=> st_funktor;
       return this;
   }
   
   fun Guard apply(float in) {
       // if test is true, apply funktor
       if (testArg.nextCurry(in) > 0) {
           return st_funktor.nextCurry(in);
       } 
       return in;
   }
}

class ST_GuardedWalk extends ST_walk {
    Guard guards[];
    
    float _value;
    
    fun ST_GuardedWalk init( float start, Guard guards[] ) {
        start => _value;
        return this;
    }
    
    fun ST_GuardedWalk addGuard(Guard arg) {
        guards << arg;
        return this;
    }
    
    fun ST_GuardedWalk setGuards(Guard arg[]) {
        arg @=> guards;
        return this;
    }
    
    fun float next() {
        for (int i; i<guards.cap();i++) {
            guards[i].apply(_value) => _value;
        }
        return value;
    }       
}
        
           
           
ST_guard_walk.init(
[guard,guard,guard]
);
   
   