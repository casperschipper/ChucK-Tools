<<<"correct file">>>;
public class MidiNoteChannelTriggerMulti extends StreamSynth {
    MidiOut mout;
    MidiMsg msg;
    
    MidiIn min;
    MidiMsg msg_in;
    
    
    
    if (mout.open(0)) {
        chout <= "midi port: " <= 0 <= " is open" <= IO.newline();
    } else {
        <<<"port failed">>>;
    }
    
    if (min.open(1)) {
        chout <= "midi port: " <= 0 <= " is open" <= IO.newline();
    } else {
        <<<"port failed">>>;
    }
    
    0 => int _channel;
    0 => int _inChannel; // channel that we trigger on.
    
    null @=> Stream @ st_pitch;
    null @=> Stream @ st_velo;
    null @=> Stream @ st_dura;
    null @=> Stream @ st_channel;
    null @=> Stream @ st_trigger;
    null @=> Stream @ st_inChannel;
    
    0x90 => int _noteOn;
    0x80 => int _noteOff;
    0xB0 => int _allNoteOffStatus;
    
    
    fun MidiNoteChannelTriggerMulti port(int arg) {
        if (mout.open(arg)) {
            chout <= "midi port: " <= arg <= " is open" <= IO.newline();
        } else {
            <<<"else okay">>>;
        }
        return this;
    }
    
    fun void channel(int arg) {
        arg - 1 => _channel;
        null @=> st_channel;
    }
    
    fun void inChannel(int arg) {
        arg - 1 => _inChannel;
        null @=> st_inChannel;
    }
    
    fun void inChannel(Stream arg) {
        arg @=> st_inChannel;
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
    
    
    fun void velo(int arg) {
        ST_value.make(arg) @=> st_velo;
        
    }
    
    fun void dura(int arg) {
        ST_value.make(arg) @=> st_dura;
        
    }
    
    
    fun void trigger(Stream t) {
        t @=> st_trigger;
    } 
    
    fun void start() {
        spork ~ midiSpork();
    }
    
    fun int testChannel(MidiMsg msg, int channel) {
        return (msg.data1 & 0x0f) == channel; // test that it has the correct channel on input
    }
    
    fun int test(MidiMsg msg, int channel) {
        return (msg.data1 & 0xf0) == 0x90 && testChannel(msg, channel);
    }
    
    fun void midiSpork() {
        1 => loop;
        
        //killAll();
        
        while(loop) { 
            min => now;
            if (st_inChannel != null) {
                (st_inChannel.next() - 1.0 => Math.floor) $ int => _inChannel;
            }
            min.recv(msg_in);
            test(msg_in,_inChannel) => int shouldPlay;
            if (shouldPlay) { // this tests channel and noteon 
                
                st_trigger.next() => float triggerValue;
                if (triggerValue > 0.0) {
                    while (triggerValue > 0.0) {
                        // Only on trigger actually update
                        spork ~ playNote();
                        triggerValue - 1.0 => triggerValue;
                    }
                    updateDefered(); // only once per chord
                } else {
                  // nothing   
                }
                
            } else {
                // nothing
            }
            
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
            _allNoteOffStatus + ch => msg.data1;
            123 => msg.data2;
            0 => msg.data3;
            mout.send(msg);
        }
        <<<"kill">>>;
        
        
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
        0 => loop;
        st_pitch.reset();
        st_velo.reset();
        st_dura.reset();
        if(st_channel != null) {
            st_channel.reset();
        }
    }
}
