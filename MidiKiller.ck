public class MidiKiller {
    MidiOut mout;
    MidiMsg msg;
    0xB0 => int _allNoteOffStatus;
    0x80 => int _noteOffStatus;
    
    if (mout.open(0)) {
        chout <= "midi port: " <= 0 <= " is open" <= IO.newline();
    } else {
        <<<"port failed">>>;
    }
    
    fun void killAll() {
        <<<"killed midi">>>;
        for (0 => int channel;channel<16;channel++) {
            for (0 => int note;note<128;note++) {
                _noteOffStatus + channel => msg.data1;
                note => msg.data2;
                0 => msg.data3;
                mout.send(msg);
                
            }
        }
    }
}