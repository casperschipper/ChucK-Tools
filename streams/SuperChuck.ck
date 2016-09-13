class StreamDict {
    0 => int length;
    string keys[0];
    Stream values[0];
    
    0 => int index;
    
    fun StreamDict store(string keyArg,Stream streamArg) {
        length++; // number of keys increased
        keys.size(length); // change size of keys list
        keyArg @=> keys[length-1]; // store key
        streamArg @=> values[keyArg]; // store item
        return this;
    }
    
    fun StreamDict clear() {
        keys.size(0);
        values.size(0);
        reset();
        return this;
    }
    
    fun StreamDict reset() {
        0 => index;
        return this;
    }
    
    fun int more() {
        if (index < length) {
            return true;
        }
        return false;
    }
    
    fun string nextKey() {
        if (index < length) {
            return keys[index];
        } 
        return null;
    }
    
    fun Stream nextStream() {
        if (index < length) {
            return values[keys[index++]];
        } 
        return null;
    }
    
    fun Stream next() {
        return nextStream();
    }
    
    fun string [] allKeys() {
        return keys;
    }
    
    fun Stream fetch(string keyArg) {
        if (values[keyArg] != null) {
            return values[keyArg];
        } else {
            <<<"stream not found, returning 0 stream">>>;
            return (new Stream);
        }
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
    
    // mes   i  id act target
    "/s_new, s, i, i, i," @=> string prefix;
    
    "" @=> string formatString;
    
    false => int loop;
    
    Stream st_timer;
    dur _timeStep;
    
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
    
    fun SuperChuck freq(Stream streamArg) {
        return addPar("freq",streamArg);
    }
    
    fun SuperChuck duration(Stream streamArg) {
        return addPar("duration",streamArg);
    }
    
    fun SuperChuck gain(Stream streamArg) {
        return addPar("gain",streamArg);
    }
    
    fun void updateMessage() { // private
        // this creates the SC string address for OSC
        streamDict.length => int n;
        prefix @=> formatString;
        while(n--) {
            "s, f" +=> formatString;
        }
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
            while(streamDict.more()) {
                streamDict.nextKey() => xmit.addString;
                streamDict.next().next() => xmit.addFloat;
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
    
    fun SuperChuck setHost(string hostArg,int portArg) {
        xmit.setHost("localhost",portArg);
        return this;
    }
}        
       
        