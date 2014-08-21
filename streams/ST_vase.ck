public class ST_vase extends Stream 
{
    "ST_vase" @=> _type;
    
    float userList[];
    float shuffledList[];
    
    0 => int idx;
    
    fun void init(float _userList[]) {
        _userList @=> userList;
        userList.size() => size;
    }
    
    fun float next() {
        if (idx == 0) {
            cs.copyArrayf(userList) @=> shuffledList;
            cs.shufflef(shuffledList);
            size - 1 => idx;
        }
        return shuffledList[idx--];
    }
}