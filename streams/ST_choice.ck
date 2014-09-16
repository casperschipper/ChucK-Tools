public class ST_choice extends Stream 
{
    "ST_choice" @=> _type;
    
    float userList[];
    null @=> Stream @ st_userList[];
       
    fun void init(float _userList[]) {
        _userList @=> userList;
        null @=> st_userList;
    }
    
    fun void init(int _userList[]) {
        (cs.int2float(_userList)) @=> userList;
        null @=> st_userList;
    }
    
    fun float next() {
        if (st_userList != null) {
            return (st_userList[Math.random2(0,st_userList.size()-1)]).next();
        } 
        return cs.choosef(userList);
    }
    
    fun static ST_choice make(float _userList[]) {
        ST_choice stream;
        _userList @=> stream.userList;
        return stream;
    }
    
    fun static ST_choice make(int _userList[]) {
        ST_choice stream;
        cs.int2float(_userList) @=> stream.userList;
        return stream;
    }
    
    fun static ST_choice make(Stream _userList[]) {
        ST_choice stream;
        _userList @=> stream.st_userList;
        return stream;
    }   
}