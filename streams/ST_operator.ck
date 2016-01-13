// virtual
public class ST_operator extends Stream 
{
    "ST_operator" @=> _type;
    
    float _v1;
    float _v2;
    
    null @=> Stream @ st_v1;
    null @=> Stream @ st_v2;
    
    0 => int v1IsStream;
    0 => int v2IsStream;

    0 => int v1More;
    0 => int v2More;
        
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
        
    fun ST_operator v1(Stream arg) {
        arg @=> st_v1;
        st_v1.next() => _v1;
        1 => v1IsStream;
        return this;
    }
    
    fun ST_operator v1(float arg) {
        arg => _v1;
        0 => v1IsStream;
        null @=> st_v1;
        return this;
    }
    
    fun ST_operator v1(int arg) {
        arg => _v1;
        0 => v1IsStream;
        null @=> st_v1;
        return this;
    }
    
    fun ST_operator v2(Stream arg) {
        arg @=> st_v2;
        st_v2.next() => _v2;
        1 => v2IsStream;
        return this;
    }
    
    fun ST_operator v2(float arg) {
        arg => _v2;
        0 => v2IsStream;
        null @=> st_v2;
        return this;
    }
    
    fun ST_operator v2(int arg) {
        arg => _v1;
        0 => v2IsStream;
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
    
    fun float operator(float a,float b) {
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
}