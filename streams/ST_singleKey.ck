public class ST_singleKey extends Stream {
    Hid hi;
    HidMsg msg;
    
    int _state;
    int _whichKey;
      
    fun ST_singleKey init(int device,string key) {
        if (!hi.openKeyboard(device)) {                 
            <<<"cannot open keyboard " + device>>>;
            me.exit();
        } else {
            <<<"hid opened:" + device>>>;
            key => translate => _whichKey;
            spork~spark();
        }        
        
        return this;
    }
    
    fun int translate (string k) {
        if (k == "up") {
            return 82;
        }
        if (k == "left")  {
            return 80;
        }
        if (k == "down") {
            return 81;
        }
        if (k == "right") {
            return 79;
        }
        if (k == "space") {
            return 44;
        }
        
        k.charAt(0) => int tmp;
        
        if (tmp >= 97 && tmp <= 122) { // a..z
            return tmp - 93;
        }
        if (tmp == 48) { // 0 
            return 39;
        } 
        if (tmp >= 49 && tmp <= 57) { // 1..9
            return tmp - 19;
        }
        return 0;
    }
    
    fun void spark () {
        while(true) {
            hi => now;
            while( hi.recv( msg ) ) {
                if (msg.which == _whichKey) {
                    if (msg.isButtonDown()) {
                        1 => this._state;
                    } else {
                        0 => this._state;
                    }
                }
            }
        }
    }
    
    fun float next() {
        return _state $ float;
    }
}


