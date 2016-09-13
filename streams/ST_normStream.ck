public class ST_normStream extends Stream {
    /*
    normStream
    =====================================
    
    This Stream takes an array of streams.
    The values of the streams are normalized so they make a sum of 1.0.
    This is useful when the values are used as time values in a break point like fassion, the pitch would be static.
    
    
    Technically, the first times it runs, it does a seperate call (calculate sum) to 
    get normalized values. 
    After this first run, the calculation of the next chunk is done during the reading of the previous.
    This is done to prevent peaks in the CPU.
    */
    
    null @=> Stream @ st_array[]; // the array of streams
    float nextValues[0][0]; // the array of values to be normalized.
    
    float sum; // the sum.
    float total; // the total used (to normalize with).
    
    0 => int flip;
    
    
    fun ST_normStream init(Stream arg[]) {
        // store the array of streams, store the size, make nextValues the right size
        arg @=> st_array;
        
        st_array.cap() => size;
        nextValues.size(size);
        
        initNextValues();
        calculateSum();
        
        0 => index;
        0 => flip;
        
        return this;
    }
    
    fun void initNextValues( ) {
        // necesarry
        for (int i;i<size;i++) {
            [0.,0.] @=> nextValues[i];
        }
    }
    
    fun void calculateSum() {
        0 => sum;
        for (int i;i<size;i++) {
            st_array[i].next() => nextValues[i][flip] +=> sum;
            samp => now;
            // sum is made
        }
        flip == 0 => flip;
        sum => total; // store the total.
    }
    
    fun float next() {
        // generate the next value in the row, add to sum. Store in the other cell
        st_array[index].next() => nextValues[index][!flip] +=> sum;  
        nextValues[index][flip] / total => float tmp; // use the current cell
        index++;
        // at end of array, use this as a total.
        if (index > (size-1)) {
            flip == 0 => flip; // use the other aaray
            sum => total;
            0 => index;
            0 => sum;
        }
        // return the current index. 
        return tmp;   
    }
    
    
}