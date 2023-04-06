class HidDecoder {
    fun int translate (int char) {
        if (tmp >= 97 && tmp <= 122) { // a..z
            return tmp - 93;
        }
        if (tmp == 48) { // 0 
            return 39;
        } 
        if (tmp >= 49 && tmp <= 57) { // 1..9
            return tmp - 19;
        }
    }
    
    fun int [] decode(string str) {
        int result[ str.length() ];
        for (int i;i<str.length();i++) {
            str.charAt => translate => result[i];
        }
        return result[i];
    }
}

public class KeyboardSynth {
    Hid hids[3];
    HidMsg msg;
    
    // init midi :
    for( int i; i < hi.cap(); i++ )
    {
        hids[i].printerr( 0 );
        if( hids[i].open( i ) )
        {
            <<< "device", i, "->", min[i].name(), "->", "open: SUCCESS" >>>;
            spork ~ go( hids[i], i );
            devices++;
        }
        else break;
    }
    if( devices == 0 )
    {
        <<< "um, couldn't open a single keyboard device, bailing out..." >>>;
        me.exit();
    }
    
    // handler for one midi event
    fun void go( Hid hi, int id )
    {
        HidMsg msg;
        while( true )
        {
            min => now; 
            // print message
            while( min.recv( msg ) )
            {
                parseMsg(msg);
            }
        }
    }
    
    fun void parseMsg(HidMsg msg) {
        msg.isButtonDown()
        // all other situations, just ignore for now...
    }
    
    fun SingleKeySynth init(StreamSynth synth, int midiKey) {
        synth @=> this.synth;
        midiKey => this.midiKey;
        return this;
    }
}


