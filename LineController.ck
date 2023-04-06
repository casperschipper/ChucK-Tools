class LineController {
    time then;
    
    float _timeValues[][];
    
    int length;
    
    fun int init(float timeValues[][]) {
        timeValues @=> _timeValues;
        timeValues.size() => length;
        now => then;
    }
    
    fun float value() {
        (now - then) / second => float tx;
        // find index of t
        indexOf(tx) => int idx; 
        if (idx > (length-2)) {return _timeValues[length-1][1];}
        // linear interp.
        _timeValues[idx][0] => float t1;
        _timeValues[idx + 1][0] => float t2;
        _timeValues[idx][1] => float y1;
        _timeValues[idx + 1][1] => float y2;
        return ((tx-t1) / (t2 - t1)) * (y2 - y1) + y1;
    }
    
    fun int indexOf(float t) {
        0 => int idx;
        if (_timeValues[0][0] > t) {
            return 0;
        } else {
            do { 
                idx++;
                if (idx > (length - 1)) {
                    return length;
                }
            } while (_timeValues[idx][0] < t);
            return idx-1;
        }
    }   
    
    fun float [] accumList(float tlist[]) {
        float output[tlist.size()];
        tlist.size() => int size;
        0 => int i;
        0 => output[i];
        int sum;
        for (1 => i;i<size;i++) {
            sum => output[i];
            tlist[i] +=> output[i];
        }
    }       
}

LineController myLine;
myLine.init([
[5.0,220.],
[10.0,440.0]]);

SinOsc c => Envelope e => dac;


while(1) {
    e.value(1);e.target(0);
    <<<myLine.value()>>> => c.freq;
    //<<<myLine.indexOf((now - then)/second)>>>;
    0.2::second => e.duration => now;
    
}

        
             


        