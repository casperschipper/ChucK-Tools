public class ST_choice extends Stream 
{
    "ST_choice" @=> _type;
    float userList[];
    
    fun void init(float _userList[]) {
        _userList @=> userList;
    }
    
    fun float next() {
        return cs.choosef(userList);
    }
}