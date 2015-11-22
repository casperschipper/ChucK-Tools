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
        -1.0 => inOffset;
        outLow @=> stOutLow;
        outHigh @=> stOutHigh;
        return this;
    }
    
    fun ST_scale2 init(Stream input,float outLow,float outHigh) {
        input @=> stInput;
        2.0 => inRange;
        -1.0 => inOffset;
        null @=> stOutLow;
        null @=> stOutHigh;
        outLow => _outLow;
        outHigh => _outHigh;
        return this;
    }
    
    fun float next() {
        if (stOutLow != null) stOutLow.next() => _outLow;
        if (stOutHigh != null) stOutHigh.next() => _outHigh;
        
        return _outLow + ( Math.fabs(_outHigh - _outLow) * 
        ((stInput.next()-inOffset) / inRange) 
        );
    }
}