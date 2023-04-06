

public class ST_key extends Stream {
    Hid hi;
    HidMsg msg;

    float _lastKey;

    fun ST_key init(int device) {
        if (!hi.openKeyboard(device)) {                 
            <<<"cannot open keyboard " + device>>>;
        } else {
            <<<"hid opened:" + device>>>;
            spork ~ spark();
        }        
        return this;
    }

    fun void spark () {
        while(true) {
            hi => now;
            while( hi.recv( msg ) ) {
                if (msg.isButtonUp()) {
                    msg.which => _lastKey;
                }
            }
        }
    }
		 
    fun float next() {
        return _lastKey;
    }
}
	
	
