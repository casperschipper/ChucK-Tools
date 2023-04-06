// Note that quantizing a rvf is the same as taking a random sampling from a list.
// also a more unusual quantizing can be replaced by using a weighted choice.
// changing weights
// changing steps

public class ST_maskedChoice extends Stream 
{
    "ST_maskedChoice" @=> _type;
    
    int _min;
    int _max;
    
    null @=> Stream @ st_min;
    null @=> Stream @ st_max;
    
    float userList[];
    null @=> Stream @ st_userList[];
    
    fun ST_maskedChoice init(float _userList[]) {
        _userList @=> userList;
        _userList.cap() => size;
        null @=> st_userList;
        return this;
    }
    
    fun ST_maskedChoice init(int _userList[]) {
        (cs.int2float(_userList)) @=> userList;
        _userList.cap() => size;
        null @=> st_userList;
        return this;
    }
    
    fun ST_maskedChoice init(Stream _userList[]) {
        _userList @=> st_userList;
        _userList.cap() => size;
        return this;
    }
    
    fun ST_maskedChoice min(float arg) {
        Math.floor(arg) $ int => _min;
        null @=> st_min;
        return this;
    }
    
    fun ST_maskedChoice max(float arg) {
        Math.floor(arg) $ int => _max;
        null @=> st_max;
        return this;
    }
    
    fun ST_maskedChoice min(int arg){
        arg => _min;
        null @=> st_min;
        return this;
    }
    
    fun ST_maskedChoice max(int arg) {
        arg => _max;
        null @=> st_max;
        return this;
    }
    
    fun ST_maskedChoice min(Stream arg) {
        arg @=> st_min;
        return this;
    }
    
    fun ST_maskedChoice max(Stream arg) {
        arg @=> st_max;
        return this;
    }
    
    fun float next() {
        if (st_min != null) st_min.nextInt() => _min;
        if (st_max != null) st_max.nextInt() => _max;
        
        Math.min(_min,_max) $ int => int tmp;
        Math.max(_min,_max) $ int => _max;
        tmp => _min;
        
        if (_min < 0) 0 => _min;
        if (_max > (size + 1)) size - 1 => _max;
        
        if (st_userList != null) {
            return (st_userList[Math.random2(_min,_max)]).next();
        } 
        return userList[Math.random2(_min,_max)];
    }
}
