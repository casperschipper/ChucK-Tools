public class MidiStream extends StreamSynth {
    MidiOut mout;
    MidiMsg msg;

    
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
    
    0x90 => int _noteOn;
    0x80 => int _noteOff;
            
    fun MidiStream port(int arg) {
        if (mout.open(arg)) {
            chout <= "midi port: " <= arg <= " is open" <= IO.newline();
        } else {
            <<<"else okay">>>;
        }
        return this;   
    }
    
    fun MidiStream channel(int arg) {
        arg - 1 => _channel;
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
        for (0 => int midi_chan;midi_chan<16;midi_chan++) {
            for (int note;note < 127;note++) {
                _noteOff | midi_chan => msg.data1;
                note => msg.data2;
                0 => msg.data3;
                mout.send(msg);
                ms => now;
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
    }
}
