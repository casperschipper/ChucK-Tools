public class FeedbackDelay extends Chubgraph
{
    inlet => Delay del => Gain g => del;
    del => outlet;
    
    .5 => g.gain;
    
    5::second => del.max;
    
    fun dur delay (dur _delay) {
        _delay => del.delay;
        return _delay;
    }
    
    fun float fb (float _fb) {
        _fb => g.gain;
        return _fb;
    }
}


    