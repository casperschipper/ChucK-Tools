public class ST_apply extends Stream {
    Stream st_input;
    Guard guards[];
    
    fun ST_apply init(Stream arg,Guard guardArg[]) {
        arg @=> st_input;
        guardArg @=> guards;
        return this;
    }
    
    fun float next() {        
        st_input.next() => float _value;
        //<<<"value",_value>>>;
        for(0 => int i;i < guards.cap();i++) { // try untill you find a guard, note: only one guard is applied per step!
            //<<<"test ? i=",i," guard =", guards[i].test(_value)>>>;
            if (guards[i].test(_value)) {
                //<<<"should only see this if test is not zero !">>>;
                return guards[i].apply(_value);
            }
        }
        return _value; // dont' do nothin
    }
}
    
                
        
    