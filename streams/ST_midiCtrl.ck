public class ST_midiCtrl extends Stream {   
    int _device;
    int _channel;
    int _controller;
    
    int value;
    
    fun ST_midiCtrl init( int device, int channel, int controller) {
        device => _device;
        channel => _channel;
        controller => _controller;
        spork ~ spark();
        return this;
    }
    
    fun ST_midiCtrl default(int arg) {
        arg => value;
        return this;
    }
    
    fun ST_midiCtrl d(int arg) {
        arg => value;
        return this;
    }
        
    fun void spark () {
        MidiIn min;
        MidiMsg msg;
        if( !min.open( _device ) ) me.exit();
        // print out device that was opened
        <<< "MIDI device:", min.num(), " -> ", min.name() >>>;
        
        // infinite time-loop
        while( true )
        {
            // wait on the event 'min'
            min => now;
            
            // get the message(s)
            while( min.recv(msg) )
            {
                if(msg.data1 == 176) {
                    if(msg.data2 == _controller) {
                        msg.data3 => value;
                    }
                }
            }
        }
    }
    
    fun float next() {
        return value $ float;
    }
}

