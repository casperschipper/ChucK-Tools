public class OSC {
    static float table1[];
    static float table2[];
    static float table3[];
    static float table4[];
    static float table5[];
    static float table6[];
    static float table7[];
    static float table8[];
    static float table9[];
}
    

class OSCTable { 
    5555 => int port;
    int shouldUpdate;
    
    128 => int size;
    float table[size];
    
    OscIn oin;
    
    ["/shape1","/shape2","/shape3","/shape4","/shape5","/shape6","/shape7","/shape8","/shape9"] @=> string standardNames[];
    0 => static int index;
    
    fun OSCTable init() {
        init(standardNames[index++%standardNames.cap()],size);
        return this;
    }  
    
    fun string makeFormat() {
        ", " @=> string format;
        for (int i;i<size;i++) {
            format + "f" @=> format;
        }
        return format;
    }
    
    fun OSCTable init(string address,int sizeArg) {
        sizeArg => size;
        table.size(size);
        port => oin.port;
        oin.addAddress( address + makeFormat() );
        // infinite event loop
        spork ~ loop();
        return this;
    }
    
    fun void loop() {
        OscMsg msg;
        true => shouldUpdate;
        while ( shouldUpdate )
        {
            oin => now;
            while ( oin.recv(msg) != 0 )
            { 
                for (int i;i<size;i++) msg.getFloat(i) => table[i];
            }
        }
    }
    
    fun void stop() {
        false => shouldUpdate;
    }
}

OSCTable osc1,osc2,osc3,osc4,osc5,osc6,osc7,osc8,osc9;
osc1.init("/shape1",128).table @=> OSC.table1;
osc2.init("/shape2",128).table @=> OSC.table2;
osc3.init("/shape3",128).table @=> OSC.table3;
osc4.init("/shape4",128).table @=> OSC.table4;
osc5.init("/shape5",16).table @=> OSC.table5;
osc6.init("/shape6",16).table @=> OSC.table6;
osc7.init("/shape7",16).table @=> OSC.table7;
osc8.init("/shape8",16).table @=> OSC.table8;
osc9.init("/shape9",512).table @=> OSC.table9;


day * 7 => now;

