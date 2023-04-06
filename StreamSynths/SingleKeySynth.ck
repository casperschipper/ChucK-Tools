class Note {
    int channel;
    int pitch;
    int velocity;
    int type; // 1 == on, 0 == off, -1 something is wrong
    
    fun Note setFromMsg(MidiMsg msg) {
        msg.data1 => int byte1; // status, channel
        msg.data2 => int byte2; // pitch
        msg.data3 => int byte3; // velocity
        
        if ((byte1 & 0xf0) == 0x90) {
            1 => this.type;
        } else { 
            if ((byte1 & 0xf0) == 0x80) {
                0 => this.type;
            } else {
                -1 => this.type;
            }
        }
        byte1 & 0x0f => this.channel;
        byte2 => this.pitch;
        byte3 => this.velocity;
        
        return this;
    }
    
    fun int isNoteOn() {
        return (type == 1);
    }
    
    fun int isNoteOff() {
        return (type == 0);
    }
    
    fun int isNote() {
        return type != -1;
    }
}

public class SingleKeySynth {
    MidiIn min[3];
    60 => int midiKey;
    StreamSynth @ synth;
    
    int devices;
    // init midi :
    for( int i; i < min.cap(); i++ )
    {
        min[i].printerr( 0 );
        if( min[i].open( i ) )
        {
            <<< "device", i, "->", min[i].name(), "->", "open: SUCCESS" >>>;
            spork ~ go( min[i], i );
            devices++;
        }
        else break;
    }
    if( devices == 0 )
    {
        <<< "um, couldn't open a single MIDI device, bailing out..." >>>;
        me.exit();
    }
    
    // handler for one midi event
    fun void go( MidiIn min, int id )
    {
        MidiMsg msg;
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
    
    fun void parseMsg(MidiMsg msg) {
        (Note note).setFromMsg(msg);
        if (note.pitch == midiKey) {
             if (note.isNoteOn()) {
                 synth.start();
             } else {
                 if (note.isNoteOff()) {
                     synth.stop();
                 }
             }
         }
         // all other situations, just ignore for now...
     }
                  
    fun SingleKeySynth init(StreamSynth synth, int midiKey) {
        synth @=> this.synth;
        midiKey => this.midiKey;
        return this;
    }
}


        