public class ShredEventStack {
    // This is a stack, to handle removing the last event,without risking removing OSC stuff
    // you can also remove all.
    static ShredEvent eventStack[];
    3334 => static int inport;
    3333 => static int outport;
       
    fun void start() {
        spork ~ OSC_ls();
        spork ~ OSC_stopIndex();
    }
    
    fun void OSC_ls() {
        OscIn oin;
        inport => oin.port;
        oin.addAddress("/cisp/ls");
        OscMsg msg;
 
        while(true) {
            oin => now;
            while(oin.recv(msg)) {
                reportState();
            }
        }
    }
    
    fun void OSC_stopIndex() {
        OscIn oin;
        inport => oin.port;
        oin.addAddress("/cisp/stopIndex");
        OscMsg msg; 
        
        while(true) {
            oin => now;
            while(oin.recv(msg)) {
                if (msg.typetag == "i") {
                    msg.getInt(0) => int idx;
                    <<<"removing index: idx">>>;
                    popIndex(idx);
                }
            }
        }
    }

    
    fun void reportAdded(string name, int idx) {
        OscOut xmit;
        xmit.dest("localhost",3333);
        xmit.start("/cisp/added");
        xmit.add(name);
        xmit.add(idx);
        xmit.send();
    }
    
    fun string q(string arg) {
        return "\"" + arg + "\"";
    }
    
    fun void reportState() {
        OscOut xmit;
        xmit.dest("localhost",outport);
        xmit.start("/cisp/state");
        "[\n" => string json_list;
        for (0 => int i;i<eventStack.size();i++) {
            "{\"name\" : " +  q(eventStack[i].name) +=> json_list;
            ",\"id\" : " + i + "}" +=> json_list;
            if (eventStack.size() > 1) {
                "," +=> json_list;
            }
        } 
        "]" +=> json_list;
        <<<json_list>>>;
        xmit.add(json_list);
        xmit.send();
        me.yield();
    }
            
            
    
    fun void push(ShredEvent arg) {
        <<<"push">>>;
        reportAdded(arg.name,eventStack.size() + 1);
        eventStack << arg;
    }
    
    fun static void pop() {
        eventStack.size() => int size;
        if (size == 0) {
            return;
        }
        eventStack[size-1].signal();
        eventStack.size(size-1);
        <<<"removed last cisp shred">>>;
    }
    
    fun static void popIndex(int index) {
        eventStack.size() => int size;
        
        // Check if the index is within the valid range
        if (index < 0 || index >= size) {
            <<< "Index out of range" >>>;
            return;
        }
        
        eventStack[index].signal(); // end the shred
        
        // Shift elements to the left to overwrite the element at the specified index
        for (index => int i; i < size - 1; i++) {
            eventStack[i + 1] @=> eventStack[i];
        }
        
        // Resize the array to remove the last element
        eventStack.size(size - 1);
    }

    
    fun static void soloCurrentShred() {
        eventStack.size() => int size;
        if(size < 2) {
            return;
        }
        
        eventStack[size-1] @=> ShredEvent currentShredEvent;
        for (0 => int i;i<size - 1;i++) {
            eventStack[i].signal();
        }
        eventStack.size(1);
        currentShredEvent @=> eventStack[0];
        <<<"removed all but last shred">>>;
    }
    
    fun static void popOldest() {
        eventStack[0].signal(); // remove oldest
        eventStack.size() => int size;
        for (int i;i<size-1;i++) {
            eventStack[i+1] @=> eventStack[i]; // move all one left
        }
        eventStack.size(size-1); // make one smaller
    }
    
    fun static void status() {
        <<<"current stacksize is: ",eventStack.size()>>>;
    }
    
    fun static void popAll() {
        if (eventStack.size() < 1) {
            return;
        }
        for (0 => int i;i<eventStack.size();i++) {
            eventStack[i].signal();
        }
        eventStack.size(0);
        <<<"remove all cisp shreds">>>;
    }
}

[(new ShredEvent)] @=> ShredEventStack.eventStack;
ShredEventStack.eventStack.size(0);
ShredEventStack myStack;
myStack.start();
day * 7 => now;