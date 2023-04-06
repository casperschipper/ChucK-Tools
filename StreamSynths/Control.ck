class SingleKeySynth {
    MidiIn min[6];
    60 => int midiKey;
    StreamSynth @ synth;
    
    fun SingleKeySynth (StreamSynth synth, int midiKey) {
        synth @=> this.synth;
        midiKey => this.midiKey;
    }
    
    
    
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
                <<< "device", id, ":", msg.data1, msg.data2, msg.data3 >>>;
            }
        }
    }
}


        