public class ST_zeroCount extends Stream {
    Stream input;
    null @=> Stream @ dynamicFrameSize;
    
    0 => int n;
    int counter;
    0 => int state;
    4410 => int frameSize;
    
    int currentEstimate;
    
    fun ST_zeroCount init(Stream input, Stream frameSize) {
        frameSize @=> this.dynamicFrameSize;
        input @=> this.input;
        return this;
    }
    
    fun ST_zeroCount init(Stream input, int frameSize) {
        frameSize => this.frameSize;
        input @=> this.input;
        return this;
    }
    
    fun float next() {
        if (n < 1) {
            if (dynamicFrameSize != null) {
                dynamicFrameSize.next() $ int => this.frameSize;
            }
            counter => currentEstimate;
            frameSize => n;
            0 => counter;
            
        }
        (input.next() => Std.sgn) $ int => int newState;
        if (newState != state) {
            counter++;
        }
        newState => state;
        n--;
        return currentEstimate $ float;
    }
}           
/*
testing

ST_zeroCount hello;

hello.init(st.rv(-1,1),441);
*/
