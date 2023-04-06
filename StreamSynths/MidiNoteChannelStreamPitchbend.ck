class PitchWithBend {
    int pitch;
    int msb;
    int lsb;
    fun float init(float midiFloat) {
        Math.floor(midiFloat) => float floor;
        midiFloat - floor => float diff;
        if (diff > 0.5) {
            floor + 1 => pitch;
            8192 - (diff * 8192);
            8192 && 
        }
    }
    
    
}

public class MidiNoteChannelPitchBendStream extends StreamSynth {
    MidiOut mout;
    MidiMsg msg;
    
    /* pitchbend
     * if pitch < 0.5 floor it
     * if pitch > 0.5 ceil it
     * difference needs to be converted to 
    
    
    if (mout.open(0)) {
        chout <= "midi port: " <= 0 <= " is open" <= IO.newline();
    } else {
        <<<"port failed">>>;
    }
    
    0 => int _channel;
    
    null @=> Stream @ st_pitch;
    null @=> Stream @ st_velo;
    null @=> Stream @ st_dura;
    null @=> Stream @ st_timer;
    null @=> Stream @ st_channel;
    null @=> Stream @ st_pitchbend;
    
    0x90 => int _noteOn;
    0x80 => int _noteOff;
    0xE0 => int _pitchBend;
    
    fun MidiNoteChannelStream port(int arg) {
        if (mout.open(arg)) {
            chout <= "midi port: " <= arg <= " is open" <= IO.newline();
        } else {
            <<<"else okay">>>;
        }
        
    }
    
    fun void channel(int arg) {
        arg - 1 => _channel;
        null @=> st_channel;
    }
    
    fun MidiNoteChannelStream init(Stream pitchArg,Stream veloArg,Stream duraArg,Stream delta,Stream channel) {
        pitchArg @=> st_pitch;
        veloArg @=> st_velo;
        duraArg @=> st_dura;
        delta @=> st_timer;
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
    
    fun void pitch(Stream arg) {
        arg @=> st_pitch;
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
    
    fun void start() {
        spork ~ midiSpork();
    }
    
    fun void midiSpork() {
        1 => loop;
        
        killAll();
        
        while(loop) {
            updateDefered();
            spork ~ playNote();
            st_timer.next() * second => now;
        }
    }
    
    
    fun void killAll() {
        // https://www.midi.org/specifications-old/item/table-1-summary-of-midi-message
        //0xd0 | _channel => msg.data1; // controller type, but 
        0xb0 | _channel => msg.data1;
        0x7b => msg.data2; // using 123
        0 => msg.data3;
        
        mout.send(msg);
        
        <<<"Kill">>>;
        
        // only reset channel 1
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
    
    fun int [] pitchToBits (float pitchDeviation) {
        
    
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
        st_timer.reset();
        if(st_channel != null) {
            st_channel.reset();
        }
    }
}
