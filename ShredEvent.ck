public class ShredEvent extends Event {
    string name;
    
    fun ShredEvent make(string arg) {
        ShredEvent c;
        arg => c.name;
        return c;
    }
}
