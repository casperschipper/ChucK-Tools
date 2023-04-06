public class ST_avg extends Stream {
    Stream st_input;
    0.0 => float curAvg;
    
    8 => int num;
    float mem[num];
    int idx;  
    int firstRun;

    fun ST_avg init(Stream inArg) {
        return init(inArg,8);
    }
    
    fun ST_avg init(Stream inArg,int n) {
        inArg @=> st_input;
        n => num;
        mem.size( num );
        
        true => firstRun; 
        0 => idx;
        0.0 => curAvg;    

        return this;
    }
    
    fun float calcAverage() {
        0.0 => float sum;
        for (int i;i<num;i++) {
            sum + mem[i] => sum;
        }
        
        return sum / num;
    }
    
    fun float updateAverage(float next, float oldest) {
        return curAvg + ((1.0 / num) * ( next - oldest ));
    }
   
    fun float next() {
        if (idx == num) {
            false => firstRun;
            0 => idx;
        }
        st_input.next() => float val;
        val => mem[idx];
        if(firstRun) {
            calcAverage() => curAvg;
        } else {
            idx - 1 => int oldestIdx;
            if (oldestIdx < 0) {
                num-1 => oldestIdx;
            }
            updateAverage( val, mem[oldestIdx] ) => curAvg;
        }

        idx + 1 => idx;
        return curAvg;
    }
}
            