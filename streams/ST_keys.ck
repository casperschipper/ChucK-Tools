public class ST_keys extends Stream {
    Hid hi;
    HidMsg msg;
    
    1 => int key;
    0 => int device;
    
    fun void spark () {
        if( !hi.openKeyboard(device) ) me.exit();
        while( true )
        {
            // wait on event
            hi => now;
            // get one or more messages
            while( hi.recv( msg ) )
            {
                // check for action type
                if( msg.isButtonDown() )
                {
                    msg.ascii => key;
                }
            }
        }
        //    <<< "up:", msg.which, "(code)", msg.key, "(usb key)", msg.ascii, "(ascii)" >>>;
    }
    
    fun ST_keys init(int device) {
        device => this.device;
        spork ~ spark();
        return this;
    }
    
    fun float next() {
        return key $ float;
    }    
}


