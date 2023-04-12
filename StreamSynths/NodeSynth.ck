public class NodeSynth extends StreamSynth {
    // similar to the chaos13.ck and chaos17.ck patches, 
    // makes an array of wavetable oscillators modulate each other.
    
    
    static Gain node_bus[]; // NOTE: static values need to be initialized outside of class definition (maybe gc?)
    static int nodeCounter; 

    int thisBufferIndex; // keep this so we know where we connected.
    
    
    Phasor p => Buffer buffer => outlet;
    
    Stream nextOut;
    Stream duration;
    Stream topLevel;
    Stream timer;
    Stream recordSwitch;
    Stream input;
    Stream fundamental;
    
    0 => int buffersize;
    
    fun void reset() {
        0 => nodeCounter;
    }
    
    fun void connect() {
        // connect input bus to this node
        node_bus[nodeCounter] => buffer;
        nodeCounter => thisBufferIndex;
        nodeCounter + 1 => nodeCounter;
    }
    
    fun NodeSynth init(int size,float amp, float pan,Stream outArg,Stream durArg,Stream topArg,Stream timerArg,Stream recordSwitchArg,Stream inputArg,Stream fundArg) {
        // size: size of buffer
        // outArg: number of output bus to send to
        // durArg: length of envelope
        // topArg: amount of modulation
        // timerArg: length of time to next
        // recordArg: when 1, start recording one buffer and continue
        <<<"NodeSynth, nodecounter: ",nodeCounter>>>;
        buffer.max(size*samp);
        size => buffersize;
        size => p.gain;
        buffer.sync(2);
        buffer.noise();
        
        outArg @=> nextOut;
        durArg @=> duration;
        topArg @=> topLevel;
        timerArg @=> timer;
        recordSwitchArg @=> recordSwitch;
        inputArg @=> input;
        fundArg @=> fundamental;
        
        connect();
        
        PanFour p4;
        p4.connect(buffer);
        p4.pan(pan);
        
        spork ~ play();
        return this;
    }
    
    fun void envelope(Envelope e,float top,dur dura) {
        top => e.target;
        dura * 0.5 => e.duration => now;
        0 => e.target;
        dura * 0.5 => e.duration => now;
    }
        
    
    fun void play() {
        1 => loop;
        while(loop) {
            updateDefered();
            if (recordSwitch.nextInt() != 0) {
                ((buffer.max() / samp) => Math.floor) $ int => int n;
                for (int i;i<n;i++) {
                    buffer.valueAt(i,input.next());
                    samp => now;
                 
                }
                <<<thisBufferIndex,"done">>>;
            } else {  
                fundamental.next() => p.freq;     
                nextOut.nextInt() => int targetBus;
                duration.next() * second => dur dura;
                topLevel.next() => float top;
                if (targetBus < nodeCounter) {
                    buffer => Envelope env => node_bus[targetBus];
                    spork ~ envelope(env,top,dura);
                    updateDefered();
                    timer.next() * second => now;
                } else {
                    <<<"Node: target bus out of range!">>>;
                    0 => loop;
                }
            }
            
        }
    }
    
    fun void stop() {
        0 => loop;
    }
}

Gain g[20] @=> NodeSynth.node_bus;
    
    