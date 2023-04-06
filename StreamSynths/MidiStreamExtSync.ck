public class MidiStreamExtSync extends StreamSynth {
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
    
    null @=> Stream @ st_pitch;
    null @=> Stream @ st_velo;
    null @=> Stream @ st_dura;
    
    0x90 => int _noteOn;
    0x80 => int _noteOff;
            
    fun MidiStreamExtSync port(int arg) {
        if (mout.open(arg)) {
            chout <= "midi port: " <= arg <= " is open" <= IO.newline();
        } else {
            <<<"else okay">>>;
        }
        
    }
    
    fun MidiStreamExtSync channel(int arg) {
        arg - 1 => _channel;
        
    }
    
    fun MidiStreamExtSync init(Stream pitchArg,Stream veloArg,Stream duraArg) {
        pitchArg @=> st_pitch;
        veloArg @=> st_velo;
        duraArg @=> st_dura;
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
    
    
    fun void pitch(Stream arg) {
        arg @=> st_pitch;
        
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
    

    fun void start() {
        spork ~ midiSpork();
    }
    
    fun void midiSpork() {
        1 => loop;
        
        killAll();
        
        while(loop) {
            
            min => now;
            min.recv(msg_in);
            if ((msg_in.data1 & 0xf0) == 0x90 ) {
                 updateDefered();
                 spork ~ playNote();
            }
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
    }
}
