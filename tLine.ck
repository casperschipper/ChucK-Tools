public class tLine 
{
    float range;
    float start;
    float end;
    time then;
    dur tim;
    
    fun void init(float a,float b,dur t) {
        b-a => range;
        a => start;
        b => end;
        t => tim;
        now => then;
    }
    
    fun void init() {
        now => then;
    }
    
    fun void init(float a) {
        a => start;
        now => then;
    }
    
    fun void init(float target,dur t) {
        next() => float a;target => float b;
        b-a => range;
        a => start;
        t => tim;
        now => then;
    }
    
    fun void init(float a,float b,float t) {
        b-a => range;
        a => start;
        t::second => tim;
        now => then;
    }
        
    fun float next() {
        if (tim == 0::second) return start;
        return (((now - then)/tim) * range) + start;
    }
    
    fun float nexts() {
        if ((now-then)>tim) return end;
        return ((now - then)/tim * range) + start;
    }
    
    fun int ended() {
        if ((now-then)>tim) return 1;
        return 0;
    }
}