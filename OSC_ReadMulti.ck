// QuickOSC class version 0.1 (c) Casper Schipper 2011
public class OSC_MultiSliderReader {
    <<<"mother">>>;
    int port;
    128 => int size;
    OscRecv oscrecv;
    // the static (assosiative) array is the place you finally pick up the values when you need them.
    static float values[];
    
    // Set OSC listening port
    fun void setPort(int aport) {
        aport => port;
        oscrecv.port(aport);
        oscrecv.listen();
    }
    
    // idem with defealt
    fun void setPort() {
        5321 => oscrecv.port => port;
        oscrecv.listen();
    }
    
    fun void setSize(int sizeArg) {
        sizeArg => size;
        values.size(sizeArg); 
    }
    
    fun void read(string address) {
        spork ~ OSC_ReadShred(string address);
    }

    // The OSC listening shread
    fun void OSC_ReadShred(string address) {
        // create OscEvent
        address => oscrecv.event @=> OscEvent oe;
        while (true) {
            // wait for osc...
            oe => now;
            oe.nextMsg();
            // store value in array    
            oe.getInt() => int index;
            if (address == "multi1, if") oe.getFloat() => values1[index];       
        }
    }
}

// okay chuck wants me to init the array with something, else it would just stay an empty reference.
// for some reason this can't be done from within a public class.
[0.] @=> OSC_Read.values1;








