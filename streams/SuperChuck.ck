class SuperChuck {
    OscSend xmit; 
    "localhost" => string _host;
    57110 => int _port;
    
    xmit.setHost("localhost",57110);
    
    "default" @=> string instr;
    0 => static int nodeID;
    
    -1 => int instanceNodeID;
    
    StreamDict streamDict; // contains all parameters that will be called at start event
    
    StreamDict updateStreamDict; // calls parameters that want to be updated.
    StreamDict updateTimerDict; // holds the timers for the updated parameters
    
    // mes   i  id act target
    "/s_new, s, i, i, i," @=> string prefix; // create synth
    "/n_set, i, " @=> string updatePrefix; // set something within synth

    
    prefix @=> string formatString;
    prefix @=> string updateFormatString;
    
    false => int loop;
    
    Stream st_timer;
    null @=> Stream st_dur;
    null @=> Stream st_updateTimer; // think I need multiple, one per parameter
    
    -1 => int updateShredID;
    
    second => dur _timeStep;
    
    fun SuperChuck timeStep(dur arg) {
        arg => _timeStep;
        return this;
    }
    
    fun SuperChuck timer(Stream arg) {
        arg @=> st_timer;
        return this;
    }
    
    fun SuperChuck updateTimer(Stream arg) {
        arg @=> st_updateTimer;
        return this;
    }
    
    fun SuperChuck instrument(string arg) {
        arg @=> instr;
        return this;
    }
    
    fun SuperChuck clear() {
        streamDict.clear();
        updateStreamDict.clear();
        prefix @=> formatString;
        updatePrefix @=> updateFormatString;
        return this;
    }
    
    fun SuperChuck addPar(string nameArg,Stream streamArg) {
        streamDict.store(nameArg,streamArg);
        "s, f" +=> formatString;
        return this;
    }
    
    fun SuperChuck addUpdatePar(string nameArg,Stream streamArg) {
        updateStreamDict.store(nameArg,streamArg);
        "s, f" +=> updateFormatString;
        return this;
    }
    
    fun void playShred(int nodeID) { // private
        1 => loop;

        if ((st_updateTimer != null) && (st_dur != null)) { // single call, no after control
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
                    streamDict.nextStream().next() => xmit.addFloat;
                }
                spork ~ updateShred() @=> Shred shred;
                shred.id() => updateShredID;
                spork ~ killShred(st_dur.next() * _timeStep);   
            }
        } else if ((st_updateTimer == null) && (st_dur != null)) { // only a duration
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
                    streamDict.nextStream().next() => xmit.addFloat;
                }
                spork ~ killShred(st_dur.next() * _timeStep);
            }
        } else {
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
                    streamDict.nextStream().next() => xmit.addFloat;
                }
            }
        }
    }
    
    fun void killShred(dur durArg) {
        durArg => now;
        xmit.startMsg("\n_free, i");
        if (updateShredID > 0) { 
            instanceNodeID => killID;
            Machine.remove(updateShredID); 
            -1 => updateShredID;
        }
        xmit.addInt(instanceNodeId);
    }
        
        
    
    fun void updateShred(int nodeID,string name,Stream updater,Stream timer) {
        while(killID != nodeId) {
            xmit.startMsg("\n_set, i, s, f");
            xmit.addInt(nodeID);
            update.next() => xmit.addFloat;
            timer.next() * second => now;
        }
    }
            
            
        // this should only track one parameter
    
    fun SuperChuck play() {
        nodeID => instanceNodeID; // just take a nodeID
        nodeID++;
        spork ~ playShred(instanceNodeID);
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
