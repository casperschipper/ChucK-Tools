public class ShredEventStack {
    // This is a stack, to handle removing the last event,without risking removing OSC stuff
    // you can also remove all.
    static Event eventStack[];
    
    fun static void push(Event arg) {
        eventStack << arg;
    }
    
    fun static void pop() {
        eventStack.size() => int size;
        if (size == 1) {
            return;
        }
        eventStack[size-1].signal();
        eventStack.size(size-1);
        <<<"removed last cisp shred">>>;
    }
    
    fun static void soloCurrentShred() {
        eventStack.size() => int size;
        if(size < 2) {
            return;
        }
        
        eventStack[size-1] @=> Event currentShredEvent;
        for (0 => int i;i<size - 1;i++) {
            eventStack[i].signal();
        }
        eventStack.size(1);
        currentShredEvent @=> eventStack[0];
        <<<"removed all but last shred">>>;
    }
    
    fun static void popAll() {
        if (eventStack.size() < 2) {
            return;
        }
        for (1 => int i;i<eventStack.size();i++) {
            eventStack[i].signal();
        }
        eventStack.size(1);
        <<<"remove all cisp shreds">>>;
    }
}

[(new Event)] @=> ShredEventStack.eventStack;