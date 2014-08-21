public class TimedList {
    dur timelist[];
    float valuelist[];
    
    0 => int interp;
    
    time then;
    
    fun int size() {
        return valuelist.size();
    }
    
    fun void append (dur timy,float value) {
        timelist.size(size()+1);
        valuelist.size(size()+1);
        timy => timelist[size()-1];
        value => valuelist[size()-1];
    }
    
    fun void appenddur (dur dury,float value) {
        timelist.size(size()+1);
        valuelist.size(size()+1);
        timelist[size()-2] + dury => timelist[size()-1];
        value => valuelist[size()-1];
    }
    
    fun void setall(dur timy[],float values[]) {
        values @=> valuelist;
        timy @=> timelist;
        now => then;
    }
    
    fun void setall(dur timy[],float values[]) {
        timelist.size(timy.size());
        0::second => dur current;
        for (int i;i<timy.size();i++) {
            current => timelist[i];
            values[i] => valuelist[i];
            timy[i] +=> current;
        }
        now => then;
    }    
    
    fun void init() {
        now => then;
    }
    
    fun int lookup() {
        int x;
        now - then => dur passed;
        for (int i;i<timelist.size();i++) {
            if (timelist[i] > passed) break;
            else x++;
        }
        return x-1;
    }
        
    fun float linterp(dur nu,dur to,dur ti,float yo,float yi) {
        return (((nu-to)*yi) + ((ti-nu)*yo))/(ti-to);
    }
    
    fun float next() {
        if (interp == 0) return valuelist[lookup()];
        else if (interp == 1) { 
            lookup() => int index;
            if (index > (size()-2)) return valuelist[index];
            return linterp((now-then),timelist[index],timelist[index+1],valuelist[index],valuelist[index+1]);
        }
    }
}
        
    
                
        
                   
        
 