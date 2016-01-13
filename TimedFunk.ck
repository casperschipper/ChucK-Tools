/*
this is a template for making a Funk that changes itself over time.
update contains the code that does something to the funk.
timer is the stream that controls the timing of calling update().
to use it one only has to implement update() and set a stream for the timer.
class MyTimedFunk extends TimedFunk {
    fun float a;
    
    fun float x(float arg) {
        return a * arg;
    }
    
    fun float update() {
        Math.random2f(0.0,1.0) => a;
    }
}

MyTimedFunk myFunk;
myFunk.timer( st.st(1.0) );
FunkStream myFunkStream;

myFunkStream.init(myFunk,st.count(0,10));
*/

public class TimedFunk extends Funk {  
    null @=> Stream @ _timer;
    
    int play;
    
    second => dur _timeStep;
        
    fun TimedFunk timeStep ( dur arg ) {
        arg => _timeStep;
        return this;
    }
    
    fun TimedFunk timer(Stream arg) {
        0 => play;
        arg @=> _timer;
        spork ~ spark();
        return this;
    }
    
    fun void update() {
        // virtual function,update whatever here;
    }
    
    fun void spark() {
        1 => play;
        while(play) {
            update();
            _timer.next() * second => now;
        }
    }
    
    fun TimedFunk stop() {
        0 => play;
        return this;
    }
}