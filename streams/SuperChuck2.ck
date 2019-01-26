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

public class SuperChuck extends StreamSynth {
    NodeID nodeID;
    int currentID;
    "default" @=> string instr;
     
     OscSend xmit;
     xmit.setHost("localhost",57110);
            
    
    StreamDict streamDict;
    
    // mes   i  id act target
    "/s_new, s, i, i, i," @=> string prefix;
    
    string formatString;
    
    false => int loop;
    
    (new ST_value).init(0.25) @=> Stream st_timer;
    second => dur _timeStep;
    
    fun SuperChuck timeStep(dur arg) {
        arg => _timeStep;
        return this;
    }
    
    fun SuperChuck timer(Stream arg) {
        arg @=> st_timer;
        return this;
    }
    
    fun SuperChuck instrument(string arg) {
        arg @=> instr;
        return this;
    }
    
    fun SuperChuck clear() {
        streamDict.clear();
        return this;
    }
    
    fun SuperChuck addPar(string nameArg,Stream streamArg) {
        streamDict.store(nameArg,streamArg);
        updateMessage();
        return this;
    }
    
    /*
    fun SuperChuck addDefered(string nameArg,Stream streamArg) {
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
    
    fun SuperChuck freq(Stream arg) {
        return addPar("freq",arg);
    }
    
    fun SuperChuck duration(Stream arg) {
        return addPar("duration",arg);
    }
    
    fun SuperChuck amp(Stream arg) {
        return addPar("amp",arg);
    }
    
    fun SuperChuck pan(Stream arg) {
        return addPar("pan",arg);
    }
    
    fun SuperChuck freq(float arg) {
        return addPar("freq",ST_value.make(arg));
    }
    
    fun SuperChuck duration(float arg) {
        return addPar("duration",ST_value.make(arg));
    }
    
    fun SuperChuck amp(float arg) {
        return addPar("amp",ST_value.make(arg));
    }
    
    fun SuperChuck pan(float arg) {
        return addPar("pan",ST_value.make(arg));
    }
    
    fun SuperChuck timer(float arg) {
        ST_value.make(arg) @=> st_timer;
        return this;
    }
    
    fun void playShred() { // private
        1 => loop;
        
        
        while(loop) {      
            nodeID.get() => currentID;

                  
            st_timer.next() * _timeStep => now;
            xmit.openBundleTimed(0.2);
            xmit.startMsg("/s_new",",siii");
            xmit.addString(instr); // instrument
            xmit.addInt(currentID);
            xmit.addInt(0);
            xmit.addInt(1);
            
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
        
    fun SuperChuck play() {
        spork ~ playShred();
        return this;
    }
    
    fun SuperChuck stop() {
        0 => loop;
        return this;
    }
    
    fun SuperChuck start() {
        spork ~ playShred();
        return this;
    }
    
    fun SuperChuck init() {
        // abstrat method
        return this;
    }
}  


        
        
            
