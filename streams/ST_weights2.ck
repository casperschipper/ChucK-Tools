class ST_weights2 extends Stream {
    Stream weights[];
    int numberOf;

    fun ST_weights2 init (Stream weightsArg[]) {
        weightsArg @=> weights;
        weightsArg.size() => numberOf;
        return this;
    }
    
    fun float next() {
        0 => float sum;
        float currentWeights[numberOf];
        for (int i;i<numberOf;i++) {
            weights[i].next() => currentWeights[i] +=> sum;
        }
        Math.random2f(0,sum) @=> float x;
        
        0 => int i;
        for (;i<numberOf;i++) {
            x - currentWeights[i] => x;
            if (x <= 0) {
                return i;
            }
        }
        return i $ float;
    }
}
        
        
    