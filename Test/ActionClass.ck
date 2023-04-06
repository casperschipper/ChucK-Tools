SinOsc c[1000];

class Action {
    fun void forEach(UGen x[]) {
        for (int i;i<x.cap();i++) {
            eval();
        }
    }
        
    fun void eval() {
        
    }
}

fun void setGain() {
    for (int i;i<c.cap();i++) {
        c[i].gain(0.001);
    }
}

fun void connect() {
    for (int i;i<c.cap();i++) {
        Math.random2f(0,127) => Std.mtof => c[i].freq;
    }
}

fun void disconnect() {
    for