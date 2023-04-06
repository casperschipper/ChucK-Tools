/*
 * A guarded walk is a walk where the step is determend by some external factor
 * For example if the value gets too small, you can add or multiply it
 * 
 *
 */

public class ST_guardedWalk extends ST_walk {
   
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
        for(0 => int i;i < guards.cap();i++) { // try untill you find a guard, note: only one guard is applied per step!
            if (guards[i].test(_value)) {
                guards[i].apply(_value) => _value;            
                return _value;
            }
        }
        return _value; // dont' do nothin
    }       
}
/*
testing code
class M extends st {    
    (new GuardTest).init( 
        smaller( st(30) ), sum(rv(1,10000)) 
    ) @=> Guard @ g1;
    (new GuardTest).init(
        bigger(st(19000)), div(st(2)) 
    ) @=> Guard g2;   
    
    (new Guard).init( mup(seq([rv(0.9,0.01).st(),rv(0.0,3.9)])) ) @=> Guard g3; 
    
    PingSynth synth => Safe safe => dac;
    synth.init(
    (new ST_guardedWalk).init(400,[g1,g2,g3]),
    st(0.002),       
    st(0.02),
    st(1.0));
}

M m ;
hour => now;
*/
    