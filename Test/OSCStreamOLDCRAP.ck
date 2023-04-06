// JUST SOME OLD CRAP

class NodeID {
    1000 => static int nodeID;
    
    fun int get() {
        nodeID + 1 => nodeID;
        return nodeID;
    }
}

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

public class OSCStream extends StreamSynth {
    NodeID nodeID;
    int currentID;
    "default" @=> string instr;
    
    OscSend xmit;
    xmit.setHost("localhost",57110);
    
    
    StreamDict streamDict;
    
    // mes   i  id act target
    "/s_new, s, i, i, i," @=> string prefix;
    
    string formatString;
        
    (new ST_value).init(0.25) @=> Stream st_timer;
    second => dur _timeStep;
    
    fun OSCStream timeStep(dur arg) {
        arg => _timeStep;
        return this;
    }
    
    fun OSCStream timer(Stream arg) {
        arg @=> st_timer;
        return this;
    }
    
    fun OSCStream instrument(string arg) {
        arg @=> instr;
        return this;
    }
    
    fun OSCStream clear() {
        streamDict.clear();
        return this;
    }
    
    fun OSCStream addPar(string nameArg,Stream streamArg) {
        streamDict.store(nameArg,streamArg);
        updateMessage();
        return this;
    }
    
    /*
    fun OSCStream addDefered(string nameArg,Stream streamArg) {
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
    */
    
    fun void updateMessage() { // private
        // this creates the SC string address for OSC
        streamDict.length => int n;
        prefix @=> formatString;
        while(n--) {
            if (n == 0) {
                " s, f" +=> formatString;
            } else {
                " s, f," +=> formatString;
            }
        }
    }
    
    fun OSCStream freq(Stream arg) {
        return addPar("freq",arg);
    }
    
    fun OSCStream duration(Stream arg) {
        return addPar("duration",arg);
    }
    
    fun OSCStream amp(Stream arg) {
        return addPar("amp",arg);
    }
    
    fun OSCStream pan(Stream arg) {
        return addPar("pan",arg);
    }
    
    fun OSCStream freq(float arg) {
        return addPar("freq",ST_value.make(arg));
    }
    
    fun OSCStream duration(float arg) {
        return addPar("duration",ST_value.make(arg));
    }
    
    fun OSCStream amp(float arg) {
        return addPar("amp",ST_value.make(arg));
    }
    
    fun OSCStream pan(float arg) {
        return addPar("pan",ST_value.make(arg));
    }
    
    fun OSCStream timer(float arg) {
        ST_value.make(arg) @=> st_timer;
        return this;
    }
    
    fun void playShred() { // private
        1 => loop;
        
        
        while(loop) {      
            nodeID.get() => currentID;
            
            
            st_timer.next() * _timeStep => now;
            xmit.openBundle();
            xmit.startMsg("/s_new",",s");
            xmit.addString(instr); // instrument
            
            streamDict.reset();
            
            // first, update all defered streams.
            updateDefered();
            
            while(streamDict.more()) {
                xmit.startMsg("/n_set",",isf");
                currentID => xmit.addInt;
                streamDict.nextKey() => xmit.addString;
                streamDict.nextStream().next() => xmit.addFloat;
            }
            xmit.closeBundle();
        }
        
    }
    
    fun void play() {
        spork ~ playShred();
    }

    fun void start() {
        spork ~ playShred();
    }
    
    fun OSCStream init() {
        // abstrat method
        return this;
    }
}  





