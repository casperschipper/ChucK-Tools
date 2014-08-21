public class Mod {
    fun static void sin ( SinOsc osc, UGen mod , float min , float max , dur controlRate ) {
        while(1) {
            ( mod.last() * Std.fabs(max-min) ) + Math.min(min,max) => osc.freq;
            controlRate => now;
        }
    }
    fun static void phasor ( Phasor osc, UGen mod, float min, float max, dur controlRate ) {
        while(1) {
            ( mod.last() * Std.fabs(max-min) ) + Math.min(min,max) => osc.freq;
            controlRate => now;
        }
    }
    fun static void sqr ( SqrOsc osc , UGen mod , float min , float max , dur controlRate ) {
        while(1) {
            ( mod.last() * Std.fabs(max-min) ) + Math.min(min,max) => osc.freq;
            controlRate => now;
        }
    }
    fun static void saw ( SawOsc osc , UGen mod , float min , float max , dur controlRate ) {
        while(1) {
            ( mod.last() * Std.fabs(max-min) ) + Math.min(min,max) => osc.freq;
            controlRate => now;
        }
    }
    fun static void pulse ( PulseOsc osc , UGen mod , float min , float max , dur controlRate ) {
        while(1) {
            ( mod.last() * Std.fabs(max-min) ) + Math.min(min,max) => osc.freq;
            controlRate => now;
        }
    }
    fun static void lpf ( LPF f, UGen mod , float min, float max , dur controlRate ) {
        while(1) {
            ( mod.last() * Std.fabs(max-min) ) + Math.min(min,max) => f.freq;
            controlRate => now;
        }
    }
    fun static void hpf ( HPF f, UGen mod , float min, float max , dur controlRate ) {
        while(1) {
            ( mod.last() * Std.fabs(max-min) ) + Math.min(min,max) => f.freq;
            controlRate => now;
        }
    }
    fun static void delC ( DelayC d, UGen mod, dur controlRate ) {
        while(1) {
            mod.last()::samp => d.delay;
            controlRate => now;
        }
    }
    fun static void delL ( DelayL d, UGen mod, dur controlRate ) {
        while(1) {
            mod.last()::samp => d.delay;
            controlRate => now;
        }
    }
}