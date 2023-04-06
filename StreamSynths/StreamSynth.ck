class ST_defer extends Stream {
    // this stream only updates if update is called.
    Stream input;
    0 => float _value;
    
    fun void update() {
        input.next() => _value;
    }
    
    fun float next() {
        return _value;
    }
    
    fun ST_defer init( Stream arg ) {
        arg @=> input;
        return this;
    }
}

public class StreamSynth extends Chugraph {
    ST_defer deferedStreams[0];
    
    int loop;
    
    fun StreamSynth addDefered(string nameArg,Stream streamArg) {
        // called with a name (that will be used for the (~ busName)) 
        // and the stream to be evaluated once per event
        ST_defer defered;
        defered.init( streamArg );
        // store it, so we can call update at the right moment.
        deferedStreams.size() => int arraySize;
        arraySize + 1 => deferedStreams.size;
        defered @=> deferedStreams[arraySize];
        // store the stream in the bus namesspace, so it can be used anywwhere.
        (new ST_bus).init(defered.st(),nameArg);
        return this;
    }
    
    fun void start() {
        spork ~ play();
    }
    
    fun void play() {
        while(loop) {
            day => now;
        }
    }
    
    fun void stop() {
        0 => loop;
    }
    
    fun void updateDefered() {
        for (int i;i<deferedStreams.cap();i++) {
            deferedStreams[i].update();
        }
    }
}