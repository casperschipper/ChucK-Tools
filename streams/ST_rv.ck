public class ST_rv extends ST_operator
{
    "ST_rv" @=> _type;
        
    fun ST_rv seed(int _seed) {
        _seed => Math.srandom;
        return this;
    }
    
    fun float operator(float a,float b) {
        return Math.random2f(a,b);
    }
}