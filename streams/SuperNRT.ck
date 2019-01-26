// Server Command Reference

/*
string	synth definition name
int	synth ID
int	add action (0,1,2, 3 or 4 see below)
int	add target ID
N *	
int or string	a control index or name
float or int or string	floating point and integer arguments are interpreted as control value. a symbol argument consisting of the letter 'c' or 'a' (for control or audio) followed by the bus's index.
*/

//Server Command Reference

// x = [

// [0.0, [ \s_new, \NRTsine, 1000, 0, 0,  \freq, 1413 ]],

class SuperNRT {
    string synthName;
    SCPar pars[0];
    Stream timer;
    0.0 => float currentTime;
    0 => int loop;
    
    
    fun SuperNRT init ( string synthNameArg, Stream timerArg, int endTime) {
        synthNameArg @=> synthName;
        timerArg @=> timer;
        1 => loop;
        spork ~ runShred();
        spork ~ stopShred();
    }
    
    fun runShred( ) {
        while(loop) {
            timer.next() => float entryDelay;
            entryDelay +=> currentTime;
            entryDelay * second => now;
        }
    }
            
            
    
    fun void stopShred(int seconds) {
        seconds * second => now;
        0 => loop;
    }
    
    fun SuperNRT addPar (string parName, Stream controller) {
        pars << (new SCPar).init(parName,controller);
    }
}

class Score {
    SCEvent events[];
        
    fun void toString() {
        "[\n" +=> string result;
        for (int i;i<events.cap();i++) {
            result + events[i].toString() + "\n";
        }
        "]" +=>  result;
    }
    
    fun addEvent( SCEvent arg ) {
        arg @=> events;
    }
}

class SCEvent{
    "\s_new" @=> string cmd;
    0.0 => float startT;
    "ping" @=> string synthName;
    -1 => int synthID; // -1 defaults to don't care
    0 => int synthAction;
    0 => int synthTarget;
    SCPar @ parArray [];
    
    fun string toString() {
        Template template;
        template.init(" [ [@startT] , [ [@command] , [@synthName] , [@synthID] , [@action] , [@target] ,  [@arguments] ]]");
        template.set("startT",startT);
        template.set("command",command);
        template.set("synthName",synthName);
        template.set("action",synthAction);
        template.set("target",synthTarget);

        "" @=> string combined;
        for (var i;i<parArray.cap();i++) {
            combined + parArray[i].toString() + ",";
        }
    }
}

class SCPar {
    string par;
    Stream value;
    
    fun SCPar init(string nameArg, Stream st_value) {
        nameArg @=> par;
        st_value @=> value;
    }
    
    fun string toString() {
        return nameArg + "," + value.next();
    }
}

class Template {
    string template;
    
    fun Template init(string templateArg) {
        templateArg @=> template;
    }
    
    fun string dressKey(string key) {
        return "[@" + key + "]";
    }
    
    
    fun Template set(string key, float value) {
        replaceString(key,value+"");
        return this;
    }
    
    fun Template set(string key, int value) {
        replaceString(key,value+"");
        return this; 
    }
    
    fun Template set(string key, string value) {
        replaceString(key,value);
        return this;
    }
    
    fun void replaceString( string key, string value) {
        dressKey(key) => key;
        template.replace(template.find(key),key.length(),value);
    }
    
    fun string result() {
        return template;
    }
}


    
    