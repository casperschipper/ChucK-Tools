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
    "default" @=> string instr;
    6159 => int OSC_PORT;

    OscOut xmit;
    xmit.dest("localhost", OSC_PORT);
    
    StreamDict streamDict;
    
    // mes   i  id act target
    
    false => int loop;
    
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
        //updateMessage();
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
  
  /*  
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
    */
    
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
            st_timer.next() * _timeStep => now;
            
            streamDict.reset();
            
            // first, update all defered streams.
            updateDefered();
            
            "/" + instr => xmit.start;

            while(streamDict.more()) {
                streamDict.nextKey() => xmit.add; // add par
                streamDict.nextStream().next() => xmit.add; //add value
            }
            xmit.send();
        }
    }
    
    fun OSCStream play() {
        spork ~ playShred();
        return this;
    }
    
    fun OSCStream stop() {
        0 => loop;
        return this;
    }
    
    fun OSCStream start() {
        spork ~ playShred();
        return this;
    }
    
    fun OSCStream init() {
        // abstrat method
        return this;
    }
}  





