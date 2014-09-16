public class ST_seq extends Stream 
{
    "ST_seq" @=> _type;
    float sequence[];
    
    null @=> Stream @ st_sequence[];
    
    1 => int loop;
    
    fun void init(float _sequence[]) {
        _sequence @=> sequence;
        _sequence.size() => size;
    }
    
    fun void init(Stream _sequence[]) {
        _sequence @=> st_sequence;
        _sequence.size() => size;
    }
    
    fun float next() {
        index % size => index;
        if (running() || loop) {
            if (st_sequence != null) {
                return st_sequence[index++].next();
            }
            return sequence[index++];
        }
        else {
            return 0.;
        }
    }
    
    fun static ST_seq make(float _sequence[]) {
        ST_seq stream;
        stream.init(_sequence);
        return stream;
    }
    
    fun static ST_seq make(Stream _sequence[]) {
        ST_seq stream;
        stream.init(_sequence);
        return stream;
    }
}