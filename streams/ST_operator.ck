// virtual
public class ST_operator extends Stream 
{
    "ST_operator" @=> _type;
    
    float v1;
    float v2;
    
    null @=> Stream @ st_v1;
    null @=> Stream @ st_v2;
    
    fun ST_operator make(Stream arg1,Stream arg2) {
        return (new ST_operator).init(arg1,arg2);
    }
    fun ST_operator make(Stream arg1,float arg2) {
        return (new ST_operator).init(arg1,arg2);
    }
    fun ST_operator make(float arg1,Stream arg2) {
        return (new ST_operator).init(arg1,arg2);
    }
    fun ST_operator make(float arg1,float arg2) {
        return (new ST_operator).init(arg1,arg2);
    }
    
    fun ST_operator init(Stream arg1,Stream arg2) {
        arg1 @=> st_v1;
        arg2 @=> st_v2;
        return this;
    }
    
    fun ST_operator init(float arg1,Stream arg2) {
        arg1 => v1;
        arg2 @=> st_v2;
        return this;
    }
    
    fun ST_operator init(Stream arg1,float arg2) {
        arg1 @=> st_v1;
        arg2 => v2;
        return this;
    }
    
    fun ST_operator init(float arg1,float arg2) {
        arg1 => v1;
        arg2 => v2;
        return this;
    }
    
    fun float next() {
        if (st_v1 != null) st_v1.next() => v1;
        if (st_v2 != null) st_v2.next() => v2;
        return v1 + v2;
    }
}