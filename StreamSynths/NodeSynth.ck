public class NodeSynth extends StreamSynth {
    // similar to the chaos13.ck and chaos17.ck patches, 
    // makes an array of wavetable oscillators modulate each other.
    
    
    static Gain node_bus[]; // NOTE: static values need to be initialized outside of class definition (maybe gc?)
    static int nodeCounter; 
    
    Buffer buffer => outlet;
    
    Stream nextOut;
    Stream duration;
    Stream topLevel;
    Stream timer;
    
    fun void reset() {
        0 => nodeCounter;
    }
    
    fun void connect() {
        // connect input bus to this node
        node_bus[nodeCounter] => buffer;
        nodeCounter + 1 => nodeCounter;
    }
    
    fun NodeSynth init(int size,float amp, float pan,Stream outArg,Stream durArg,Stream topArg,Stream timerArg) {
        // size: size of buffer
        // outArg: number of output bus to send to
        // durArg: length of envelope
        // topArg: amount of modulation
        // timerArg: length of time to next
        <<<"NodeSynth, nodecounter: ",nodeCounter>>>;
        buffer.max(size*samp);
        buffer.sync(2);
        buffer.noise();
        
        outArg @=> nextOut;
        durArg @=> duration;
        topArg @=> topLevel;
        timerArg @=> timer;
        
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
    
    fun void stop() {
        0 => loop;
    }
}

Gain g[20] @=> NodeSynth.node_bus;
    
    