fun void oneVoice(dur a) {
    Impulse i => Pan2 p => dac;
    p.pan(Math.random2f(-1,1));
    
    1 => i.next;
    
    Math.random2f(0.0,3.0) => float m;
    
    Math.random2f(0.0,18) => Std.mtof => float c;
    now + a => time then;
    
    while(now < then) {
        i.last() * m + c => Math.sin => i.next;
        samp => now;
    }
}

while(1) {
    spork ~ oneVoice(Math.random2f(0.0,0.05) * second);
    Math.random2f(0.01,0.1) * second => now;
}

