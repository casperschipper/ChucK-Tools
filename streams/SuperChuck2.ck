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

public class SuperChuck {
    OscSend xmit;
    "localhost" => string _host;
    57110 => int _port;
    
    xmit.setHost("localhost",57110);
    
    "default" @=> string instr;
    -1 => int nodeID;
    
    StreamDict streamDict;
    ST_defer deferedStreams[0];
    
    // mes   i  id act target
    "/s_new, s, i, i, i," @=> string prefix;
    
    "" @=> string formatString;
    
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
    
    fun void updateMessage() { // private
        // this creates the SC string address for OSC
        streamDict.length => int n;
        prefix @=> formatString;
        while(n--) {
            "s, f" +=> formatString;
        }
    }
    
    fun SuperChuck freq(Stream arg) {
        return addPar("freq",arg);
    }
    
    fun SuperChuck duration(Stream arg) {
        return addPar("duration",arg);
    }
    
    fun SuperChuck gain(Stream arg) {
        return addPar("gain",arg);
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
    
    fun SuperChuck gain(float arg) {
        return addPar("gain",ST_value.make(arg));
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
            st_timer.next() * _timeStep => now;
            
            xmit.startMsg(formatString);
            xmit.addString(instr); // instrument
            xmit.addInt(nodeID);
            xmit.addInt(0);
            xmit.addInt(1);
            streamDict.reset();
           
           // first, update all defered streams.
           for (int i;i<deferedStreams.cap();i++) {
                deferedStreams[i].update();
            }
            
            while(streamDict.more()) {
                streamDict.nextKey() => xmit.addString;
                streamDict.nextStream().next() => xmit.addFloat;
            }
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
    
    fun SuperChuck setHost(string hostArg,int portArg) {
        xmit.setHost("localhost",portArg);
        return this;
    }
}  


        
        
            
