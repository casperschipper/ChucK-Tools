public class MidiControlStream {
    MidiOut mout;
    MidiMsg msg;
    
    true => int firstrun;
    
    if (mout.open(0)) {
        chout <= "midi port: " <= 0 <= " is open" <= IO.newline();
    } else {
        <<<"port failed">>>;
    }
    
    1 => int _channel;
    1 => int _controllerNumber;
    
    null @=> Stream @ st_value;
    null @=> Stream @ st_delta;
    null @=> Stream @ st_ctrlNumber;
    null @=> Stream @ st_channel;
    
    0xB0 => int _ctrlMsg;

    second => dur _timeStep;
     
    0 => int play;
    
    fun MidiControlStream port(int arg) {
        if (mout.open(arg)) {
            chout <= "midi port: " <= arg <= " is open" <= IO.newline();
        } else {
            <<<"else okay">>>;
        }
        return this;
    }
    
    fun MidiControlStream channel(int arg) {
        arg => _channel;
        null @=> st_channel;
        return this;
    }
    
    fun MidiControlStream channel(Stream arg) {
        arg.nextInt() => _channel;
        return this;
    }
    
    fun MidiControlStream init(Stream valueArg,Stream deltaArg) {
        valueArg @=> st_value;
        deltaArg @=> st_delta;
        spork ~ midiSpork();
        return this;
    }
    
    fun MidiControlStream value(Stream arg) {
        arg @=> st_value;
        return this;
    }
    
    fun MidiControlStream value(float arg) {
        (new ST_value).init( arg ) @=> st_value;
        return this;
    }
    
    fun MidiControlStream timer(Stream arg) {
        arg @=> st_delta;
        return this;
    }
    
    fun MidiControlStream timer(float arg) {
        return timer( (new ST_value).init(arg) );
    }

    
    fun MidiControlStream delta(Stream arg) {
        return timer(arg);
    }
    
    fun MidiControlStream controller(Stream arg) {
        arg @=> st_ctrlNumber;
        return this;
    }
    
    fun MidiControlStream controller(float arg) {
        return controller(arg $ int);   
    }
    
    fun MidiControlStream controller(int arg) {
        arg => _controllerNumber;
        null @=> st_ctrlNumber;
        if ((arg == 0) && firstrun) {
            false => firstrun;
            <<<"please note: ctrl 0, this might result in program change !">>>;
        }
        return this;
    }
    // TODO fix start
    fun MidiControlStream init(Stream valueArg,Stream deltaArg,int ctrlNumberArg) {
        valueArg @=> st_value;
        deltaArg @=> st_delta;
        if ((ctrlNumberArg == 0) && firstrun) {
            false => firstrun;
            <<<"please note: ctrl 0, this might result in program change !">>>;
        }
        ctrlNumberArg => _controllerNumber;
        null @=> st_ctrlNumber;
        spork ~ midiSpork();
        return this;
    }
    
    fun MidiControlStream start() {
        spork ~ midiSpork();
        return this;
    }

    fun MidiControlStream init(Stream valueArg,Stream deltaArg,Stream ctrlNumberArg) {
        valueArg @=> st_value;
        deltaArg @=> st_delta;
        ctrlNumberArg @=> st_ctrlNumber;
        spork ~ midiSpork();
        return this;
    }
    
    fun void midiSpork() {
        1 => play;
        
        while(1) {
            if (st_ctrlNumber != null) {
                st_ctrlNumber.nextInt() => _controllerNumber;
            }
    
            if ((_controllerNumber == 0) && firstrun) {
                    false => firstrun;
                    <<<"please note: ctrl 0, this might result in program change !">>>;
            }
            
            if (st_channel != null) {
                st_channel.nextInt() => _channel;
            }
            
            _ctrlMsg | _channel => msg.data1;

            _controllerNumber => msg.data2;

            st_value.nextInt() => msg.data3;
            
            st_delta.next() * _timeStep => now;

            mout.send( msg );
        }
    }
    
    fun MidiControlStream stop() {
        0 => play;
        return this;
    }
}

/* MidiControlStream str;

str.port(1);
str.channel(0);

str.init(
st.rv(0,127),
st.st(.5),
st.st(1)
);

hour => now;
*/