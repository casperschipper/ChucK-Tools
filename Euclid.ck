public class Euclid {
    static int bitmap[];
    static int remainder[];
    static int count[];
    
    fun static void buildString (int level) {
        if (level == -1) {
            append(bitmap,0);
        } else if (level == -2) {
            append(bitmap,1);
        } else {
            for (0 => int i; i < count[level]; i++) {
                buildString (level-1);
            } 
            if (remainder[level] != 0) {
                buildString (level-2);
            }
        }
    }
    
    fun static void computeBitmap(int numSlots, int numPulses) {
        numSlots - numPulses => int divisor;
        
        null @=> remainder;
        null @=> count;
        null @=> bitmap;
        
        int a[100] @=> remainder;
        int b[100] @=> count;
        int c[0] @=> bitmap;
        
        numPulses => remainder[0];
        0 => int level;
        do {
            divisor / remainder[level] => count[level];
            divisor % remainder[level] => remainder[level + 1];
            remainder[level] => divisor;
            level++;
        } while (remainder[level] > 1);
        
        divisor => count[level];
        
        buildString (level);    
    }
    
    fun static int [] compute(int slots,int pulse) {
        computeBitmap(slots,pulse);
        return bitmap;
    }
    
    fun static int [] append (int input[],int value) {
        input.size() => int size;
        size + 1 => input.size;
        value => input[size];
        return input;
    }
    
    fun static void [] print () {
        chout <= "Euclid pattern =" <= IO.newline();
        for (int i;i<bitmap.size();chout <= bitmap[i++] <= " ") {
            // nothing
        }
        chout <= IO.newline();
    }
}