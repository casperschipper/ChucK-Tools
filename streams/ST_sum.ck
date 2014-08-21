public class ST_sum extends Stream 
{
    "ST_sum" @=> _type;
    
    Stream @ str1;
    Stream @ str2;
    
    fun void init(Stream _str1,Stream _str2) {
        _str1 @=> str1;
        _str2 @=> str2;
    }
    
    fun float next() {
        return str1.next() + str2.next();
    }
}