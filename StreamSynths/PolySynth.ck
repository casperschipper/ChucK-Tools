class Voice {
    StreamSynth synth;
    int state; // 1 = busy, 0 = available
    
    fun void playVoice(float pitch,float velo) {
        spork ~ play(pitch,velo);
    } 
    
    fun void play() {
        synth.play();
    }
}

class PolySynth {
    Voice array[8];
    
    0 => int currentVoice;
    
    fun void noteOn(float noteNumber, float velo) {
        findVoice() => int voiceN;
        if (voiceN == -1) {
            return;
        } else {
            array[voiceN].playVoice(pitch,velo);
        }
    }
    
    fun int findVoice() {
        currentVoice => int start;
        while (array[currentVoice].state) {
            currentVoice++;
            if (currentVoice == start) {
                return -1;
                <<<"all voices are busy">>>;
            }    
        }
    }     
}