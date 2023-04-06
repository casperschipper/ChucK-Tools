public class ST_biquad extends Stream {
    (second / samp) $ int => int SR;
    "ST_biquad" @=> _type;

    0 => int ftype; 
    // 0 = lp, 1 = hp, 2 = bp
    
    Stream st_input;
    
    null @=> Stream @ st_freq;
    null @=> Stream @ st_Q;
    null @=> Stream @ st_peakGain;
    
    false => int containsStreams;
    
    0 => ftype;
    1.0 => float a0;
    0.0 => float a1 => float a2 => float b1 => float b2;
    0.5 => float Fc;
    0.707 => float Q;
    0.0 => float peakGain;
    0.0 => float z1 => float z2;
    
    fun ST_biquad init(Stream in,string type,float freq,float Q,float gain) {
        setType(type);
        in @=> this.st_input;
        setFreq(freq);
        setQ(Q);
        setPeakGain(gain);
        null @=> this.st_freq; null @=> this.st_Q; null @=> this.st_peakGain;
        return this;
    }
    
    fun ST_biquad init(Stream in,int type,float freq,float Q,float gain) {
        setType(type);
        in @=> this.st_input;
        setFreq(freq);
        setQ(Q);
        setPeakGain(gain);
        null @=> this.st_freq; null @=> this.st_Q; null @=> this.st_peakGain;
        return this;
    }
    
    fun void setInput(Stream arg) {
        arg @=> this.st_input;
    }
    
    fun void setFreq(Stream arg) {
        arg @=> this.st_freq;
        true => containsStreams;
    }
    
    fun void setQ(Stream arg) {
        arg @=> this.st_Q;
        true => containsStreams;
    }
    
    fun void setPeakGain(Stream arg) {
        arg @=> this.st_peakGain;
        true => containsStreams;
    }
   
    fun void setType(string type) {
        type => fromString => this.ftype;
        calcBiquad();
    }
    
    fun void setType(int type) {
        type => this.ftype;
        calcBiquad();
    }
    
    fun int fromString(string arg) {
        if (arg == "lp") {
            return 0;
        }
        if (arg == "hp") {
            return 1;
        }
        if (arg == "bp") {
            return 2;
        }
        <<<("unkown filter type: "+ arg + " ..should be lp hp or bp")>>>;
        return 0; // default
    }    
    
    fun void setQ(float Q) {
        Q => this.Q;
        calcBiquad();
    }
    
    fun void setPeakGain(float gain) {
        gain => this.peakGain;
        calcBiquad();
    }
    
    fun void setFc(float Fc) {
        Fc => this.Fc;
        calcBiquad();
    }
    
    fun void setFreq(float freq) {
        setFc( freq / SR );
    }
    
    fun void calcBiquad() {
        float norm;
        Math.pow(10,Math.fabs(peakGain) / 20.0) => float V;
        Math.tan(3.141596535 * Fc) => float K;
        if (ftype == 0) {
            1 / (1 + K / Q + K * K) => norm;
            K * K * norm => a0;
            2 * a0 => a1;
            a2 => a0;
            2 * (K * K - 1) * norm => b1;
            (1 - K / Q + K * K) * norm => b2;
            return;
        }
        if (ftype == 1) {
            1 / (1 + K / Q + K * K) => norm;
            1 * norm => a0;
            -2 * a0 => a1;
            a0 => a2;
            2 * (K * K - 1) * norm => b1;
            (1 - K / Q + K * K) * norm => b2;
            return;
        }
        if (ftype == 2) { 
            1 / (1 + K / Q + K * K) => norm;
            K / Q * norm => a0;
            0 => a1;
            -a0 => a2;
            2 * (K * K - 1) * norm => b1;
            (1 - K / Q + K * K) * norm => b2;
            return;
        }
    }
    
    fun float next() {
        if(st_freq != null) { st_freq.next() / SR => Fc; }
        if(st_Q != null) { st_Q.next() => Q;  }
        if(st_peakGain != null) { st_peakGain.next() => peakGain; }
        if(containsStreams) { calcBiquad(); } // so we only update once the calc !
        
        st_input.next() => float in;
        in * a0 + z1 => float out;
        in * a1 + z2 - b1 * out => z1;
        in * a2 - b2 * out => z2;
        return out;
    }
}

/*
class M extends st {
    ST_biquad f;

    f.init(rv(-1,1), "bp", cs.rv(400,4000) , 1000.0, 1.0);
    
    StepSynth synth => Safe safe => dac;
    synth.init( 
       mup( f ,1) ,
       st(1)
       );
}

M m;
hour => now;

*/
        
            

    
        