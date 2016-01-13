public class StreamFeedbackDelay extends Chubgraph {
    inlet => FeedbackDelay delay => outlet;
    
    null @=> Stream @ st_delay;
    null @=> Stream @ st_feedback;
    null @=> Stream @ st_timing;
    
    false => int loop;
    
    fun StreamFeedbackDelay max ( dur arg ) {
        delay.max(arg);
        return this;
    }
    
    fun StreamFeedbackDelay init (Stream delArg,Stream feedbackArg,Stream timingArg) {
        delArg @=> st_delay;
        feedbackArg @=> st_feedback;
        timingArg @=> st_timing;
        spork ~ playShred();
        return this;
    }
    
    fun void playShred() {
        1 => loop;
        while(loop) {
            st_delay.next() => delay.delay;
            st_feedback.next() => delay.fb;
            st_timing.next() * second => now;
        }
    }
            
    fun void stop() {
        0 => loop;
    }
}
