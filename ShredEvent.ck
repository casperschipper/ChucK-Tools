public class ShredEvent extends Event {
    string name;
    int id;
    
    fun ShredEvent make(string arg) {
        ShredEvent c;
        arg => c.name;
        -1 => c.id;
        return c;
    }
    
    fun ShredEvent makeWithId(string arg,int id) {
        ShredEvent c;
        arg => c.name;
        id => c.id;
        return c;
    }        
}
