public class ST_scale extends Stream 
{
    "ST_scale " @=> _type;
    
    null @=> Stream @ stInput;
    
    null @=> Stream @ stInLow;
    null @=> Stream @ stInHigh;
    null @=> Stream @ stOutLow;
    null @=> Stream @ stOutHigh;
    null @=> Stream @ stExp;
    
    float inputLow,inputHigh,outputLow,outputHigh,exp;
    
    fun ST_scale init(Stream input,Stream inLow,Stream inHigh,Stream outLow,Stream outHigh,Stream exp) {
        input @=> stInput;
        inLow @=> stInLow;
        inHigh @=> stInHigh;
        outLow @=> stOutLow;
        outHigh @=> stOutLow;
        stExp @=> stExp;
        return this;
    }
    
    fun ST_scale make(Stream arg,Stream inLow,Stream inHigh,Stream outLow,Stream outHigh,Stream exp) {
        ST_scale stream;
        stream.init(arg,inLow,inHigh,outLow,outHigh,exp);
        return stream;
    }
    
    fun float next() {
        return cs.scalef(stInput.next(),stInLow.next(),stInHigh.next(),stOutLow.next(),stOutHigh.next(),stExp.next());
    }
}