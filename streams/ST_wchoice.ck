class ST_wchoice extends Stream {
    Random random;
    
    float sum;
    float weights[][];
    float n;
    
    fun float [][] int2float(int arg[][]) { // helper converter func
        arg.cap() => int count;
        float result[count][2];
        for (int i;i<count;i++) {
            arg[i][0] => result[i][0];
            arg[i][1] => result[i][1];
        }
        return result;   
    }
    
    fun ST_wchoice initialize(float arg[][]) {
        arg @=> weights;
        arg.size() => size;
        for (int i;i<size;i++) {
            weights[i][1] +=> sum;
        }
        return this;
    }
    
    fun ST_wchoice init(float arg[][]) {
        return initialize(arg);
    }
    fun ST_wchoice init(int arg[][]) {
        return initialize(int2float(arg));
    }
    
    fun float next() { 
       Math.random2f(0,sum) => n;
       for (int i;i<size;i++)
       {
            if (n < weights[i][1])
            { return weights[i][0]; }
            else
            { weights[i][1] -=> n; }
       }
       return weights[size-1][0];
   }
}

(new ST_wchoice).init([[1.,10],[22.,1]]).test();
   
