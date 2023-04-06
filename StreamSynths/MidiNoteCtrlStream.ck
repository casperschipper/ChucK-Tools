public class MidiNoteCtrlStream extends MidiStream {
    null @=> Stream @ st_ctrlValue;
    1 => int _ctrlNumber;
    
    0xbc => int _ctrlChange;
 
    
    fun void ctrlNumber(int arg) {
        safeMidi(arg) => this._ctrlNumber;
    }
    
    fun void ctrlValue(Stream arg) {
        arg @=> this.st_ctrlValue;
    }
    
    
    fun int safeMidi(int in) {
        if (in < 0) {
            return 0;
        } 
        if (in > 127) {
            return 127;
        }
        return in;
    }
    
    fun void playNote() {
        int currentPitch;
        
        /* note on */
        _noteOn | _channel => msg.data1;
        st_pitch.nextInt() => currentPitch => msg.data2;
        st_velo.nextInt() => msg.data3;
        mout.send(msg);
        
        /* send controller */
        _ctrlChange | _channel => msg.data1;
        _ctrlNumber => msg.data2;
        st_ctrlValue.nextInt () => safeMidi => msg.data3;  
        mout.send(msg);
        
        /* send note off */
        st_dura.next() * second => now;
        _noteOff => msg.data1;
        currentPitch => msg.data2;
        0 => msg.data3;
        mout.send(msg);
    }
}
