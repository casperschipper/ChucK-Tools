// a class to make dynamic switching of streams possible.
// streams are stored in a global static array, ussing a string associated array.

public class ST_bus extends Stream {
    static Stream bus[];
    
    "bus" @=> _type;
    string _name;

    fun ST_bus init (Stream stream,string name) {
    	name @=> _name;
    	stream @=> bus[_name];
    }
    
    fun ST_bus init(string name) {
        if (bus[name] != null) {
        } else {
            <<<"bus:",name," is not yet defined.">>>;
        }
        name @=> _name;
        return this;
    }
    
    fun ST_bus stream(Stream arg) {
        arg @=> bus[_name];
        return this;
    }
    
    fun ST_bus st(Stream arg) {
        return stream(arg);
    }

    fun ST_bus name (string arg) {
    	arg @=> _name;
        return this;
    }
    
    fun int more() {
        if (bus[_name] != null) {
            return bus[_name].more();
        }
    }

    fun float next() {
        if (bus[_name] == null) {
            return 0.;
        } 
    	return bus[_name].next();
    }
}

[(new Stream)] @=> ST_bus.bus;

      