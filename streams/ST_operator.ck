// virtual
public class ST_operator extends Stream 
{
    "ST_operator" @=> _type;
    
    float _v1;
    float _v2;
    
    null @=> Stream @ st_v1;
    null @=> Stream @ st_v2;
    
    false => int v1IsStream;
    false => int v2IsStream;

    true => int v1More;
    true => int v2More;
        
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
    
    fun ST_operator make(int arg1,Stream arg2) {
        return (new ST_operator).init(arg1,arg2);
    }
    
    fun int more() {
        return v1More || v2More;
    }
        
    fun ST_operator v1(Stream arg) {
        arg @=> st_v1;
        st_v1.next() => _v1;
        true => v1IsStream;
        return this;
    }
    
    fun ST_operator v1(float arg) {
        arg => _v1;
        false => v1IsStream;
        null @=> st_v1;
        return this;
    }
    
    fun ST_operator v1(int arg) {
        arg => _v1;
        true => v1IsStream;
        null @=> st_v1;
        return this;
    }
    
    fun ST_operator v2(Stream arg) {
        arg @=> st_v2;
        st_v2.next() => _v2;
        true => v2IsStream;
        return this;
    }
    
    fun ST_operator v2(float arg) {
        arg => _v2;
        false => v2IsStream;
        null @=> st_v2;
        return this;
    }
    
    fun ST_operator v2(int arg) {
        arg => _v1;
        false => v2IsStream;
        null @=> st_v1;
        return this;
    }
    
    fun ST_operator init(Stream arg1,Stream arg2) {
        v1(arg1);
        v2(arg2);
        return this;
    }
    
    fun ST_operator init(float arg1,Stream arg2) {
        v1(arg1);
        v2(arg2);
        return this;
    }
    
    fun ST_operator init(Stream arg1,float arg2) {
        v1(arg1);
        v2(arg2);
        return this;
    }
    
    fun ST_operator init(float arg1,float arg2) {
        v1(arg1);
        v2(arg2);
        return this;
    }
    
    fun ST_operator init(int arg1,Stream arg2) {
        v1(arg1);
        v2(arg2);
        return this;
    }
    
    fun ST_operator init(Stream arg) {
        v2(arg);
        null @=> st_v1;
        return this;
    }
    
    fun ST_operator init(float arg) {
        v2(arg);
        null @=> st_v1;
        null @=> st_v2;
        return this;
    }
        
    
    fun float operator(float a,float b) {
        // placeholder
        return a;
    }
    
    fun float next() {
        if (!v1IsStream && !v2IsStream) {
            return operator(_v1,_v2);
        }

        operator(_v1,_v2) => float result;
        
        if (v1IsStream) st_v1.more() => v1More;
        if (v2IsStream) st_v2.more() => v2More;
   
        if (v1More ^ v2More) {
            if (v1More) st_v1.next() => _v1;
            if (v2More) st_v2.next() => _v2;
        } else {
            if (v1IsStream) st_v1.next() => _v1;
            if (v2IsStream) st_v2.next() => _v2;
        }

        return result;
    }
    
    fun float nextCurry(float x) {
        x => _v1;
        return next();
    }
    
    fun void reset() {
        if (v1IsStream) st_v1.reset();
        if (v2IsStream) st_v2.reset();
    }
        
}