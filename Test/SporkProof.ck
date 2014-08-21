fun void Loop() {
    Impulse n => dac;
    while(1) {
        n.next(1);
        .2::second => now;
    }
}

int ID;

(spork ~ Loop()).id() => ID;
<<<ID>>>;

1::second => now;
Machine.remove(ID);
10::second => now;
        