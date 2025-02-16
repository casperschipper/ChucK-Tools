<<<"correct file">>>;
public class MidiNoteChannelStream extends StreamSynth {
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
    null @=> Stream @ st_channel;
    
    0x90 => int _noteOn;
    0x80 => int _noteOff;
            
    fun MidiNoteChannelStream port(int arg) {
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
        for (0 => int ch;ch<16;ch++) {
            0xb0 + ch => msg.data1;
            123 => msg.data2;
            0 => msg.data3;
            mout.send(msg);
        }
        <<<"kill">>>;
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
        st_timer.reset();
        if(st_channel != null) {
            st_channel.reset();
        }
    }
}
