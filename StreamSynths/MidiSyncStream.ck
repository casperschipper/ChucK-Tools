public class MidiSyncStream extends StreamSynth {
    MidiOut mout;
    MidiMsg msg;
    MidiIn min;
    
    false => int clockIsRunning;
    0 => int delta_tick;
    
    port(0);
    
    initClock(0);
    
    ST_value pitchBus;
    ST_value veloBus;
    
    ST_bus bus1;
    bus1.init(pitchBus,"midi-pitch-in");
    ST_bus bus2;
    bus2.init(veloBus,"midi-velo-in");
    // register the busses 
    
    
    0 => int _channel;
    
    null @=> Stream @ st_pitch;
    null @=> Stream @ st_velo;
    null @=> Stream @ st_dura;
    null @=> Stream @ st_channel;
    null @=> Stream @ st_delta_tick;
    null @=> Stream @ st_timer;
    
    0x90 => int _noteOn;
    0x80 => int _noteOff;
    
    fun void initClock(int deviceId) {
        if (!min.open(deviceId)) {
            me.exit();
        } else {
            <<<"input device: "+deviceId+" has been opened">>>;
        }
    }
    

    
    fun MidiSyncStream port(int arg) {
        if (mout.open(arg)) {
            chout <= "output midi port: " <= arg <= " is open" <= IO.newline();
        } else {
            <<<"else okay">>>;
        }
        
    }
    
    fun void channel(int arg) {
        arg - 1 => _channel;
        null @=> st_channel;
    }
    
    fun MidiSyncStream init(Stream pitchArg,Stream veloArg,Stream duraArg,Stream delta,Stream channel) {
        pitchArg @=> st_pitch;
        veloArg @=> st_velo;
        duraArg @=> st_dura;
        delta @=> st_delta_tick;
        channel @=> st_channel;
        spork ~ midiSpork();
        return this;
    }
    
    fun void pitch(Stream arg) {
        arg @=> st_pitch;
    }
    
    fun void velo(Stream arg) {
        arg @=> st_velo;
    }
    
    fun void dura(Stream arg) {
        arg @=> st_dura;
        
    }
    
    fun void timer(Stream arg) {
        arg @=> st_timer;
        
    }
    
    fun void channel(Stream arg) {
        arg @=> st_channel;
    }
    
    fun void pitch(float arg) {
        ST_value.make(arg) @=> st_pitch;
        
    }
    
    fun void velo(float arg) {
        ST_value.make(arg) @=> st_velo;
        
    }
    
    fun void dura(float arg) {
        ST_value.make(arg) @=> st_dura;
        
    }
    
    fun void timer(float arg) {
        ST_value.make(arg) @=> st_timer;
        
    }
    
    fun void velo(int arg) {
        ST_value.make(arg) @=> st_velo;
        
    }
    
    fun void dura(int arg) {
        ST_value.make(arg) @=> st_dura;
        
    }
    
    fun void timer(int arg) {
        ST_value.make(arg) @=> st_timer;
        
    }
    
    fun void delta(Stream arg) {
        arg @=> st_delta_tick;
    }
    
    fun void start() {
        spork ~ midiSpork();
    }
    

    fun void midiSpork() {
        1 => loop;
        
        killAll();
        <<<"midiSporck started">>>;

        
        while(loop) {
              
            min => now; 
            
            while(min.recv(msg) )
            {   
                /*
                if (msg.data1 == 250) {
                    true => clockIsRunning;
                } 
                if (msg.data1 == 248 && clockIsRunning) {
                    //tick();         
                }
                if (msg.data1 == 252) {
                    false => clockIsRunning;
                    killAll();
                }
                */
                
                
                if ((msg.data1 & 0x90) == 0x90) {
                    pitchBus.setValue(msg.data2);
                    veloBus.setValue(msg.data3);
                    tick();
                }
                
                
                
            }
        }
    }
    
    fun void tick() {
        if (delta_tick <= 0) {
            updateDefered();
            spork ~ playNote();
            st_delta_tick.nextInt() => delta_tick;
        } else {
            delta_tick--;
        }
    }
    
    
    fun void killAll() {
        // https://www.midi.org/specifications-old/item/table-1-summary-of-midi-message
        //0xd0 | _channel => msg.data1; // controller type, but 
        //0xb0 | _channel => msg.data1;
        //0x7b => msg.data2; // using 123
        //0 => msg.data3;
        
        //mout.send(msg);
        
        //<<<"Kill">>>;
        
        for (0 => int ch;ch<16;ch++) {
            for (int note;note < 127;note++) {
                _noteOff | ch => msg.data1;
                note => msg.data2;
                0 => msg.data3;
                mout.send(msg);
                samp => now;
            }
        }
        
        
        /*** outdated note off ***
        for (int midi_chan;midi_chan<16;midi_chan++) {
            for (int note;note<127;note++) {
                _noteOff + midi_chan => msg.data1;
                note => msg.data2;
                0 => msg.data3;
                mout.send(msg);
            }
        }
        ******/
    }
    
    fun void playNote() {
        int currentPitch;
        
        if (st_channel != null) {
            st_channel.nextInt() - 1 => _channel;
        }
        
        _noteOn | _channel => msg.data1;
        st_pitch.nextInt() => currentPitch => msg.data2;
        st_velo.nextInt() => msg.data3;
        mout.send(msg);
        
        st_dura.next() * second => now;
        _noteOff | _channel => msg.data1;
        currentPitch => msg.data2;
        0 => msg.data3;
        mout.send(msg);
    }
    
    fun void stop() {
        <<<"stopped stream!">>>;
        
        0 => loop;
        st_pitch.reset();
        st_velo.reset();
        st_dura.reset();
        if(st_channel != null) {
            st_channel.reset();
        }
    }
}
