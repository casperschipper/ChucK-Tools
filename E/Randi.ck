public class Randi {
    [0.] @=> float buffer[];
    
    float incr;
    float pos;
    
    fun float init(int size) {
        buffer.size(size);
        for (int i;i<size;i++) {
            Math.random2f(-1.,1.) => buffer[i];
        }
    }
    
    fun float init() {
        buffer.size(16384);
        for (int i;i<buffer.size();i++) {
            Math.random2f(-1.,1.) => buffer[i];
        }
    }
    
    fun float next() {
        pos + incr => pos;
        if (pos > buffer.size()) {
            pos % incr => pos;
        }
        
        Math.floor(pos) $ int => int idx;
        (idx + 1) % buffer.size() => int nextIdx;   
        pos - Math.floor(pos) => float frac;
        
        return interp (buffer[idx],buffer[nextIdx],frac);
    }
    
    fun float nextCube() {
        pos + incr => pos;
        if (pos > buffer.size()) {
            pos % incr => pos;
        }
        
        pos - Math.floor(pos) => float frac;
        
        Math.floor(pos) $ int => int idx;
        
        buffer[wrapIndex(idx-1)] => float L1;
        buffer[wrapIndex(idx)] => float L0;
        buffer[wrapIndex(idx+1)] => float H0;
        buffer[wrapIndex(idx+2)] => float H1;
        
        return cubicInterp(L1,L0,H0,H1,frac);
        
    }
    
    fun int wrapIndex (int index) {
        if (index < 0) {
            return buffer.cap() + index;
        } 
        if (index > buffer.cap()) {
            return index % buffer.cap();
        } 
        else
            return index;
    }
    
    fun float interp(float a, float b,float frac) {
        return a + ((b - a) * frac);
    }
    
    fun float cubicInterp (float L1,float L0,float H0,float H1,float frac) {
        return L0 + 0.5 *
        frac * (H0 - L1 + 
        frac * (H0 + L0 *(-2) + L1 +
        frac * ((H0 - L0) * 9 + (L1 - H1) * 3 +
        frac * ((L0 - H0) * 15 + (H1 - L1) * 5 +
        frac * ((H0 - L0) * 6 + (L1 - H1) * 2 )))));
    }
}