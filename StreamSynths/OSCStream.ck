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
            
            while(streamDict.more()) {
                instr + "/" + streamDict.nextKey() => xmit.start;
                streamDict.nextStream().next() => xmit.add;
                xmit.send();
            }
        }
    }
    
    fun void stop() {
        0 => loop;
    }
    
    fun void start() {
        spork ~ playShred();
    }
}    






