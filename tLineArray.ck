public class tLineArray {
    tLine tlarray[];
    
    fun void init(float startstop[][],dur dura) {
        startstop.size() => int size;
        if (tlarray.size() == 0) tLine temp[size] @=> tlarray;
        for (int i;i<size;i++) {
            tlarray[i].init(startstop[i][0],startstop[i][1],dura);
        }
    }
    
    fun void init(float start[],float eind[],dur dura) {
        start.size() => int size;
        if (tlarray.size() == 0) tLine temp[size] @=> tlarray;
        for (int i;i<size;i++) {
            tlarray[i].init(start[i],eind[i],dura);
        }
    }
        
    fun float get(int index) {
        return tlarray[index].next();
    }
}

