class Mod {   
    fun static void modc ( UGen ugen , UGen mod , float min , float max , dur controlRate ) {
        spork ~ mod (ugen, mod, min, max, controlRate);
    }
    
    fun static void mod ( SinOsc osc, UGen mod , float min , float max , dur controlRate ) {
        while(1) {
            ( mod.last() * Std.fabs(max-min) ) + Math.min(min,max) => osc.freq;
            controlRate => now;
        }
    }
    fun static void mod ( Phasor osc, UGen mod, float min, float max, dur controlRate ) {
        while(1) {
            ( mod.last() * Std.fabs(max-min) ) + Math.min(min,max) => osc.freq;
            controlRate => now;
        }
    }
    fun static void mod ( SqrOsc osc , UGen mod , float min , float max , dur controlRate ) {
        while(1) {
            ( mod.last() * Std.fabs(max-min) ) + Math.min(min,max) => osc.freq;
            controlRate => now;
        }
    }
    fun static void mod ( SawOsc osc , UGen mod , float min , float max , dur controlRate ) {
        while(1) {
            ( mod.last() * Std.fabs(max-min) ) + Math.min(min,max) => osc.freq;
            controlRate => now;
        }
    }
    fun static void mod ( PulseOsc osc , UGen mod , float min , float max , dur controlRate ) {
        while(1) {
            ( mod.last() * Std.fabs(max-min) ) + Math.min(min,max) => osc.freq;
            controlRate => now;
        }
    }
    fun static void mod ( LPF f, UGen mod , float min, float max , dur controlRate ) {
        while(1) {
            ( mod.last() * Std.fabs(max-min) ) + Math.min(min,max) => f.freq;
            controlRate => now;
        }
    }
    fun static void mod ( HPF f, UGen mod , float min, float max , dur controlRate ) {
        while(1) {
            ( mod.last() * Std.fabs(max-min) ) + Math.min(min,max) => f.freq;
            controlRate => now;
        }
    }
    fun static void mod ( DelayC d, UGen mod, float min, float max,  dur controlRate ) {
        while(1) {
            (( mod.last() * Std.fabs(max-min) ) + Math.min(min,max)) * samp => d.delay;
            controlRate => now;
        }
    }
    fun static void mod ( DelayL d, UGen mod, float min, float max, dur controlRate ) {
        while(1) {
            (( mod.last() * Std.fabs(max-min) ) + Math.min(min,max)) * samp => d.delay;
            controlRate => now;
        }
    }
}

SinOsc c => dac;
SinOsc m => blackhole;

.1 => c.gain;

Mod.modc(c,m,400,8000,samp);

second => now;