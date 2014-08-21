public class ST_seq extends Stream 
{
    "ST_seq" @=> _type;
    float sequence[];
    1 => int loop;
    
    fun void init(float _sequence[]) {
        _sequence @=> sequence;
        _sequence.size() => size;
    }
    
    fun float next() {
        index % size => index;
        if (running() || loop) {
            return sequence[index++];
        }
        else {
            return 0.;
        }
    }
}