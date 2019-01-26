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

public class SuperChuckWrite extends StreamSynth {
    // TODO, rewrite this function to use the file object to write to files
    
   FileIO fout;
        
           
    fun void playShred() { // private
        1 => loop;
        
        
        while(loop) {      
            nodeID.get() => currentID;
            
            st_timer.next() * _timeStep => now;
            xmit.openBundleTimed(now);
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
    
    fun SuperChuckWrite init( string filename ) {
        fout.open( filename, FileIO.WRITE );
    
        if (!Fout.good() )
        { 
            cherr <= "can't open file for writing..." <= IO.newline();
            me.exit();
        }
    }
        
}