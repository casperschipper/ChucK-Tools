public class ST_weights extends Stream {
    CRandom random;
    random.seed();

    float _weights[][];
        
    fun float [][] int2float(int arg[][]) { // helper converter func
        arg.cap() => int count;
        float result[count][2];
        for (int i;i<count;i++) {
            arg[i][0] => result[i][0];
            arg[i][1] => result[i][1];
        }
        return result;   
    }
    
    fun float next() {
        return random.w_choicef(_weights);
    }
    
    fun ST_weights weights(int arg[][]) {
        int2float(arg) @=> _weights;
        return this;
    }
    
    fun ST_weights weights(float arg[][]) {
        arg @=> _weights;
        return this;
    }
}

