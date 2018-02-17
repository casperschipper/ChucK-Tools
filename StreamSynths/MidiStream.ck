public class MidiStream extends StreamSynth {
    MidiOut mout;
    MidiMsg msg;
    if (mout.open(0)) {
        chout <= "midi port: " <= 0 <= " is open" <= IO.newline();
    } else {
        <<<"port failed">>>;
    }
    
    
    
    1 => int _channel;
    
    null @=> Stream @ st_pitch;
    null @=> Stream @ st_velo;
    null @=> Stream @ st_dura;
    null @=> Stream @ st_timer;
    
    0x90 => int _noteOn;
    0x80 => int _noteOff;
        
    0 => int play;
    
    fun MidiStream port(int arg) {
        if (mout.open(arg)) {
            chout <= "midi port: " <= arg <= " is open" <= IO.newline();
        } else {
            <<<"else okay">>>;
        }
        return this;
    }
    
    fun MidiStream channel(int arg) {
        arg => _channel;
        return this;
    }
    
    fun MidiStream init(Stream pitchArg,Stream veloArg,Stream duraArg,Stream delta) {
        pitchArg @=> st_pitch;
        veloArg @=> st_velo;
        duraArg @=> st_dura;
        delta @=> st_timer;
        spork ~ midiSpork();
        return this;
    }
    
    fun MidiStream pitch(Stream arg) {
        arg @=> st_pitch;
        return this;
    }
    
    fun MidiStream velo(Stream arg) {
        arg @=> st_velo;
        return this;
    }
    
    fun MidiStream dura(Stream arg) {
        arg @=> st_dura;
        return this;
    }
    
    fun MidiStream timer(Stream arg) {
        arg @=> st_timer;
        return this;
    }
    
    fun MidiStream pitch(Stream arg) {
        arg @=> st_pitch;
        return this;
    }
    
    fun MidiStream pitch(float arg) {
        ST_value.make(arg) @=> st_pitch;
        return this;
    }
    
    fun MidiStream velo(float arg) {
        ST_value.make(arg) @=> st_velo;
        return this;
    }
    
    fun MidiStream dura(float arg) {
        ST_value.make(arg) @=> st_dura;
        return this;
    }
    
    fun MidiStream timer(float arg) {
        ST_value.make(arg) @=> st_timer;
        return this;
    }
    
    fun MidiStream velo(int arg) {
        ST_value.make(arg) @=> st_velo;
        return this;
    }
    
    fun MidiStream dura(int arg) {
        ST_value.make(arg) @=> st_dura;
        return this;
    }
    
    fun MidiStream timer(int arg) {
        ST_value.make(arg) @=> st_timer;
        return this;
    }
    
    fun MidiStream start() {
        spork ~ midiSpork();
        return this;
    }
    
    fun void killAll() {
        // killall
        for (int midi_chan;midi_chan<16;midi_chan++) {
            for (int note;note<127;note++) {
                _noteOff + midi_chan => msg.data1;
                note => msg.data2;
                0 => msg.data3;
                mout.send(msg);
            }
        }
    }
    
    fun void midiSpork() {
        1 => play;
        
        killAll();
        
        0x90 + _channel => _noteOn;
        0x80 + _channel => _noteOff;
        
        while(play) {
            updateDefered();
            spork ~ playNote();
            st_timer.next() * second => now;
        }
    }
    
    fun void playNote() {
        int currentPitch;
        
        _noteOn => msg.data1;
        st_pitch.nextInt() => currentPitch => msg.data2;
        st_velo.nextInt() => msg.data3;
        mout.send(msg);
        
        st_dura.next() * second => now;
        _noteOff => msg.data1;
        currentPitch => msg.data2;
        0 => msg.data3;
        mout.send(msg);
    }
    
    fun MidiStream stop() {
        0 => play;
        return this;
    }
}