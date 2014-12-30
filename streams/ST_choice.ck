public class ST_choice extends Stream 
{
    "ST_choice" @=> _type;
    
    float userList[];
    null @=> Stream @ st_userList[];
    
    int last;
       
    fun ST_choice init(float _userList[]) {
        _userList @=> userList;
        _userList.cap() => size;
        null @=> st_userList;
        return this;
    }
    
    fun ST_choice init(int _userList[]) {
        (cs.int2float(_userList)) @=> userList;
        _userList.cap() => size;
        null @=> st_userList;
        return this;
    }
    
    fun ST_choice init(Stream _userList[]) {
        _userList @=> st_userList;
        _userList.cap() => size;
        return this;
    }
    
    fun float next() {
        if (st_userList != null) {
            if (st_userList[last].more()) {
                return st_userList[last].next();
            }
            Math.random2(0,size-1) => last;
            return (st_userList[last]).next();
        } 
        return userList[Math.random2(0,size-1)];
    }
    
    fun static ST_choice make(float _userList[]) {
        return (new ST_choice).init(_userList);
    }
    
    fun static ST_choice make(int _userList[]) {
        return (new ST_choice).init(cs.int2float(_userList));
    }
    
    fun static ST_choice make(Stream _userList[]) {
        return (new ST_choice).init(_userList);
    }   
}