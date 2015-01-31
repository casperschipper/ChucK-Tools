public class ST_scale2 extends Stream  // slightly optimized version for quick table scaling.
{
    "ST_scale2" @=> _type;
    
    null @=> Stream @ stInput;
    
    float inRange;
    float inOffset;
    null @=> Stream @ stOutLow;
    null @=> Stream @ stOutHigh;
    
    float _outLow,_outHigh;
    
    fun ST_scale2 init(Stream input,float inLow,float inHigh,Stream outMin,Stream outHigh) {
        input @=> stInput;
        Math.fabs(inHigh-inLow) => inRange;
        Math.min(inHigh,inLow) => inOffset;
        outMin @=> stOutLow;
        outHigh @=> stOutHigh;
        return this;
    }
    
    fun ST_scale2 init(Stream input,Stream outLow,Stream outHigh) {
        input @=> stInput;
        2.0 => inRange;
        1.0 => inOffset;
        outLow @=> stOutLow;
        outHigh @=> stOutHigh;
        return this;
    }
    
    fun float next() {
        stOutLow.next() => float _outLow;
        stOutHigh.next() => float _outHigh;
        return _outLow + ( Math.fabs(_outHigh - _outLow) * stInput.next() );
    }
}