public class StreamPan extends Chugraph {
    inlet => Pan4 p => dac;

    null @=> Stream @ stream;
    null @=> Stream @ timer;
    
    0 => int loop;
    
    samp => dur _timeStep;
    
    fun StreamPan init(Stream arg,Stream timerArg) {
        arg @=> stream;
        timerArg @=> timer;
        spork ~ play();
        return this;
    }
    
    fun StreamPan timeStep(dur arg) {
        arg => _timeStep;
        return this;
    }
    
    fun void play() {
        1 => loop;
        while(loop) {
            _timeStep * timer.next() => now;
            stream.next() => p.pan;
        }
    }
    
    fun void stop() {
        0 => loop;
    }
}
            