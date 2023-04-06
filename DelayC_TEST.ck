DelayC delay;

delay.setsize(44100::samp);

SinOsc lfo => Gain mod => blackhole; lfo.gain(10000); lfo.freq(.1);
Step offset => mod; 22050 => offset.next;

SqrOsc sqr => blackhole; .25 => sqr.gain;

delay.connectInput(sqr);
delay.connectOutput(dac.chan(0));
delay.connectDelayTime(mod);
delay.connectRaw(dac.chan(1));


//hour => now;
