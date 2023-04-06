ST_adc stream;
stream.init(0);
Impulse n => adc;

while(1) {
    stream.next() => n.next;
    samp => now;
}
    
    