public class cs
{   
    fun static float[] int2float (int array[]) {
        float output[array.cap()];
        for (int i;i<array.cap();array[i] $ float @=> output[i++]) {;}
        return output;
    }
    
    fun static int[] float2int (float array[]) {
        int output[array.cap()];
        for (int i;i<array.cap();array[i] $ int @=> output[i++]) {;}
        return output;
    }
    
    fun static int choose( int array[] )
    {
        return array[Math.random2(0,array.size()-1)];
    }
    
    fun static int min (int a, int b) {
        if (a<b) return a;
        else return b;
    }
    
    fun static int max (int a,int b) {
        if (a>b) return a;
        else return b;
    }
    
    fun static int diff(int a,int b) {
        return Std.abs(b-a);
    }
    
    fun static float inverse(float x) {
        return 1.0/x;
    }
    
    fun static dur makedur(float x) {
        return x::second;
    }
    
    fun static float choosef( float array[] )
    {
        return array[Std.rand2(0,array.size()-1)];
    }
    
    fun static float choosef( int array[] ) {
        return choose(array) $ float;
    }
    
    fun static string choosestr( string array[] )
    {
        return array[Std.rand2(0,array.size()-1)];
    }
    
    fun static dur choosed( float array[] ) 
    {
        return array[Std.rand2(0,array.size()-1)]::second;
    }
    
    fun static dur choosed( int array[] )
    {
        return array[Std.rand2(0,array.size()-1)]::second;
    }
    
    fun static dur choosed( dur array[] )
    {
        return array[Std.rand2(0,array.size()-1)];
    }
    
    fun static int sometimes(int p,int vase) {
        if (rv(0,vase) < p) return 1;
        else return 0;
    }
    
    fun static int[] fill( int amount,int low,int high )  
    {
        int output[amount];
        for (0 => int i;i<amount;i++)
            Std.rand2(low,high) => output[i];
        return output;
    }
    
    fun static float[] fillf( int amount,float low, float high )
    {
        float outputf[amount];
        for (0 => int i;i<amount;i++)
            Std.rand2f(low,high) => outputf[i];
        return outputf;
    }
    
    fun static int[] append( int input[], int value )
    {
        int output[input.size()+1];
        for (0 => int i; i<input.size() ; i++)
            input[i] => output[i];
        value => output[input.size()];
        return output;
    }
    
    fun static float[] appendf( float input[], float value )
    {
        float output[input.size()+1];
        for (0 => int i; i<input.size() ; input[i++] => output[i]) {}
        value => output[input.size()];
        return output;
    }
    
    fun static int[] fillOne( int amount,int value)
    {
        int output[amount];
        for (int i;i<amount;i++)
            value => output[i];
        return output;
    }
   
   fun static float[] fillOnef( int amount,float value)
   {
       float output[amount];
       for (int i;i<amount;i++)
           value => output[i];
       return output;
   }
    
    fun static int[] range( int low, int high, int step)
    {
        Std.abs(high-low) => int diff;
        Math.min(low,high) $ int => int min;
        Math.max(low,high) $ int => int max;
        int output[(diff/step)+1];
        int x;
        for (min => int i;i<=max;i + step => i) {
            i => output[x++];
        }
        return output;
    }
    
    fun static int[] range( int high ) {
        return range(0,high,1);
    }
    
    fun static int[] range( int low, int high ) {
        return range(low,high,1);
    }   
    
    fun static float[] rangef( float low, float high, float step) {
        Std.fabs(high-low) => float diff;
        Math.min(low,high) => float min;
        Math.max(low,high) => float max;
        float output [Math.floor(((diff/step) + 1))$int];
        int x;
        for (min => float i;i<=max;i + step => i) {
            i => output[x++];
        }
        return output;
    }   
    
    fun static int[] stepper( int start, int step, int amount)
    {
        int output[amount];
        for (int i;i<amount;i++)
        {
            start => output[i];
            start + step => start;
        }
        return output;
    }
    
    fun static float[] stepperf( float start,float step,int amount)
    {
        float output[amount];
        for (int i;i<amount;i++)
        {
            start => output[i];
            start + step => start;
        }
        return output;
    }
        
    
    fun static float[] rangef (float low, float high, float step)
    {
        [0.] @=> float output[];
        int count;
        for (low => float i; i<high ; i + step => i)
        {
            count + 1 => output.size;
            i => output[count++];
        }
        return output;
    }
    
    fun static float[] geometric (float low,float high,int steps) {
        float output[steps];
        Std.fabs(high-low)/(steps-1) => float step;
        low => float value => output[0];
        for (1 => int i;i<steps;i++) {
            value + step => value => output[i];
        }
        return output;
    }
    
    fun static float[] geo (float low,float high,int steps) {
        return geometric(low,high,steps);
    }
    
    fun static int[] shuffle(int array[]) {
        array.size() => int max;
        0 => int tmp;
        0 => int pos;
        while(max-- > 1) {
            Std.rand2(0,max-1) => pos;
            array[pos] => tmp;
            array[max] => array[pos];
            tmp => array[max]; 
        }
    }

    
    fun static int[] addArray( int a[], int b[])
    {
        a.size() + b.size() => int total;
        int output[total];
        for (0 => int i;i < total;i++)
        {
            if (i < a.size())
                a[i] => output[i];
            else
                b[i-a.size()] => output[i];
        }
        return output;
    }
    
    fun static float[] addArrayf( float a[], float b[])
    {
        a.size() + b.size() => int total;
        float output[total];
        for (0 => int i;i < total;i++)
        {
            if (i < a.size())
                a[i] => output[i];
            else
                b[i-a.size()] => output[i];
        }
        return output;
    }
    
    fun static float randExp (float low, float high, float power)
    { return (Math.pow(randomf(),power)) * Std.fabs(high - low) + Math.min(low,high); }
    
    // Fill an array with expo random floats
    fun static float[] fillExpF (int number,float low, float high,float power)
    {
        float output[number];
        for (0 => int i;i<number;i++)
            randExp(low,high,power) => output[i];
        return output;
    }     
    
    fun static int[] fillRand(int number,int low,int high) {
        int output[number];
        for (int i;i<number;i++) rv(low,high) => output[i];
        return output;
    }  
    
    // fill from a small reserve
    fun static int[] fillChoice(int number,int bron[])
    {
        int output[number];
        for (0 => int i;i<number;i++)
            choose(bron) => output[i];
        return output;
    }
    
    fun static float[] fillChoicef(int number,float bron[])
    {
        float output[number];
        for (0 => int i;i<number;i++)
            choosef(bron) => output[i];
        return output;
    }
    
    fun static int[] fibo(int number)
    {
        int output[number];
        for (0 => int i;i<number;i++)
        {
            if (i == 0)
                1 => output[0];
            else if (i == 1)
                1 => output[1];
            else
                output[i-2]+output[i-1] => output[i];
        }
        return output;
    }
    
    fun static int is_prime(int n) {
        int c;       
        if (n < 2) return 0; 
        for (2 => int c;c < (n/2)+1;c++)
        {
            if ((n % c) == 0) return 0;
        }
        return 1;
    }
    
    fun static int[] primes(int number) {
        int output[0];
        for (int i;i<=number;i++) {
            if (is_prime(i)) {
                output.cap()+1 => output.size;
                i => output[output.cap()-1];
            }
        }
        return output;
    }
    
    fun static float randomf ()
    { return (Std.randf() + 1) * 0.5; }
    
    // rv 
    fun static int rv (int low,int high)
    { return (Std.rand2(low,high)); }
    // rv float
    fun static float rvf (float low,float high)
    { return (Std.rand2f(low,high)); }
    
    fun static float rf (float low, float high)
    { return mtof(rvf(low,high)); }
    
    fun static float rff (float low, float high)
    { return rf(ftom(low),ftom(high)); }
    
    fun static dur rd (dur low,dur high) {
        dtom(low) => float lowMidi;
        dtom(high) => float highMidi;
        return mtod(rvf(lowMidi,highMidi));
    }
    
    fun static int chance(int p,int n) 
    { return (rv(0,n) < p); }
    
    fun static int ch(int p,int n)
    { return chance(p,n); }
    
    fun static int[] vintageLoops(int number,int innerlow,int innerhigh,int outerlow,int outerhigh,int maxindex)
    {
        int output[number];
        int i,a,b,inner,outer,outersize,tempindex;
        while (i < number)
        {
            if (a == 0)
            {
                inner => a;
                if (b == 0)
                {
                    rv(innerlow,innerhigh) => inner => a;
                    rv(outerlow,outerhigh) => outersize;
                    outersize / inner => outer;
                    if (outer == 0)
                        1 => outer;
                    outer => b;
                    
                    rv(0,maxindex) => tempindex;
                }
                b--;
            }
            ((inner-a) + tempindex) % (maxindex-1) => output[i];
            i++;
            a--;
        }
        return output;
    }
    
    fun static int[] order(int input[],int order[])
    {
        int output[order.size()];
        for (0 => int i;i < order.size();i++)
            input[order[i]] => output[i];
        return output;
    }
    
    fun static void print( int input[] )
    {
        for (int i;i<input.size();chout <= input[i++] <= " ") {
            // nothing
        }
        chout <= IO.newline();
    }
    
    fun static void printf( float input[] )
    {
        for (int i;i<input.size();chout <= input[i++] <= " ") {
            // nothing
        }
        chout <= IO.newline();
    }
    
    fun static void pr(int input) 
    {
        <<<input>>>;
    }
    
    fun static void pr(float input)
    {
        <<<input>>>;
    }
    
    fun static void pr(string input) 
    {
        <<<input>>>;
    }
    
    fun static int looparray( int input[], int count )
    {
        return input[count%input.size()];
    }
    
    fun static float looparrayf( float input[], int count)
    {
        return input[count%input.size()];
    }
    
    fun static float scalef (float input,float a,float b,float c,float d)
    {        
        return (((input - Math.min(a,b)) / Std.fabs(a-b)) * Std.fabs(c-d)) + Math.min(c,d);
    }

    fun static int clip(int input,int low,int high) {
        if (input<low) return low;
        else if (input>high) return high;
        else return input;
    }
    
    fun static float clipf(float input,float low,float high) {
        if (input<low) return low;
        else if (input>high) return high;
        else return input;
    }
    
    fun static dur clipd(dur input,dur low,dur high) {
        if (input<low) return low;
        else if (input>high) return high;
        else return input;
    }
    
    fun static float wrapf(float x,float low,float high) {
        Math.fabs(high - low) => float range;
        Math.fmod(x-low,range) => x;
        if (x<0)
            return high + x;
        else 
            return low + x;
    }
    
    fun static int wrap(int x,int low, int high) {
        Math.abs(high - low + 1) => int range;
        ((x-low) % range) => x;
        if (x<0)
            return high + 1 + x;
        else 
            return low + x;
    }
    
    fun static float scalefExp(float input,float a,float b,float c,float d,float p)
    {
        return (Math.pow( (input/(Std.fabs(a-b)))  ,p) * Std.fabs(c-d) )+Math.min(c,d);
    }    
    
    fun static float gauss()
    {
        float x1,x2,w,y1,y2;
        do
        {
            2.0 * Math.random() - 1.0 => x1;
            2.0 * Math.random() - 2.0 => x2;
            (x1 * x1) + (x2 * x2) => w;
        } while ( w >= 1.0);
        
        Math.sqrt( (-2.0 * Math.log ( w ) ) / w ) => w;
        x1 * w => y1;
        x2 * w => y2;
        return y1;
    }
    
    fun static int sum(int seq[])
    {
        int x;
        for (int i;i<seq.size();i++)
            seq[i] +=> x;
        return x;
    }
    
    fun static float sumf(float seq[])
    {
        float x;
        for (int i;i<seq.size();i++)
            seq[i] +=> x;
        return x;
    }
    
    fun static int quickSort(int arr[], int elements)
    {    
        1000 => int MAX_LEVELS;
        
        int  piv, i, L, R ;
        int beg[MAX_LEVELS];
        int end[MAX_LEVELS];
        0 => i;
        0 => beg[0]; elements => end[0];
        while (i>=0) 
        {
            beg[i]=>L;
            end[i]-1=>R;
            if (L<R) 
            {
                arr[L] => piv; 
                if (i==MAX_LEVELS-1) return 0;
                while (L<R) 
                {
                    while (arr[R]>=piv && L<R) R--; 
                    if (L<R) arr[R] => arr[L++];
                    while (arr[L]<=piv && L<R) L++; 
                    if (L<R) arr[L] => arr[R--]; 
                }
                piv=>arr[L]; 
                L+1=>beg[i+1]; 
                end[i]=>end[i+1]; 
                L=>end[i++]; 
            }
            else 
            { i--;}
        }
        return 1; 
    }
    
    fun static void QuickSortf( float array[], int start_pos, int end_pos)
    {
        if ( start_pos == end_pos ) // Only one element
            return;
        QSPartition( array, start_pos, end_pos) => int middle_pos;  // Reposition elements
        QuickSortf( array, start_pos, middle_pos);          // Sort left half
        QuickSortf( array, middle_pos + 1, end_pos);     // Sort right half
    }
    
    fun static int QSPartition( float array[], int start_pos, int end_pos)
    {
        array[start_pos] => float pivot;       // Smaller than pivot on left; larger on right
        start_pos => int left_index;    // First element
        end_pos => int right_index; // Last element
        while ( 1 ) // Loop forever; return once partitioning is completed
        {
            // Skip over large elements on right
            while ( array[right_index] > pivot && right_index >= start_pos )
                right_index--;
            // Skip over small elements on left
            while ( array[left_index] < pivot && left_index <= end_pos )
                left_index ++;
            if ( left_index < right_index )          // Exchange if halves aren't complete
            {
                array[left_index] => float temp;
                array[right_index] => array[left_index];
                temp => array[right_index];
                left_index++;                         // Skip over exchanged values
                right_index--;
            }
            else                                            // Otherwise, return location of pivot
                return  right_index;
        }
    }
    
   fun static float[] removeDoublesf(float list[]) {
       float output[list.size()];
       0 => int idx;
       for (int i;i<list.size();i++) {
           if (!inListf(output,list[i])) {
               list[i] => output[idx++];
           }
       }
       output.size(idx);
       return output;
   }
   
   fun static int[] removeDoubles(int list[]) {
       int output[list.size()];
       0 => int idx;
       for (int i;i<list.size();i++) {
           if (!inList(output,list[i])) {
               list[i] => output[idx++];
           }
       }
       output.size(idx);
       return output;
   }
           
       
    
   fun static int inList(int list[],int value)
    {
        if (list.size() == 0)
            return 0;
        for (int i;i<list.size();i++)
        {
            if (list[i] == value)
            { return 1; }
        }
        return 0;
    }
    
    fun static int inListf(float list[],float value)
    {
        if (list.size() == 0)
            return 0;
        for (int i;i<list.size();i++) {
            if (list[i] == value) 
            { return 1; } 
        }
        return 0;
    }
    
    fun static int[] copyArray(int array[])
    {
        int output[array.size()];
        for (int i;i<array.size();i++)
            array[i] => output[i];
        return output;
    }
    
    fun static float[] copyArrayf(float array[])
    {
        float output[array.size()];
        for (int i;i<array.size();i++)
            array[i] => output[i];
        return output;
    }
    
    fun static float amp2db(float amp) {
        return 10 * Math.log10(amp);
    }
    
    fun static float db2amp(float db) {
        return Math.pow(10,(db/10.0));
    }
    
    fun static float midi2ratio(float midi)
    {
        return Math.pow(2,(midi/12.));
    }
    
    fun static float mtor(float midi) 
    {
        return midi2ratio(midi);
    }

    fun static float midi2time(float midi)
    {
        return 1.0/Std.mtof(midi);
    }
    
    fun static float mtof(float midi)
    {
        return 440 * Math.pow(2,((midi-64)/12.0));
    }
    
    fun static dur mtod(float midi) 
    {
        return (1.0/Std.mtof(midi))::second;
    }
    
    fun static float mtodf(float midi) 
    {
        return (1.0/Std.mtof(midi));
    }
    
    fun static float ftom(float freq) 
    { 
        return (12 * Math.log2(freq/440.0)) + 69;
    }
    
    fun static float dtom(dur dura) 
    {
        return ftom((1.0::second) / dura);
    }
    
    fun static dur ftod(float freq)
    {
        return (1.0 / freq)::second;
    }
    
    fun static float[] mtofl(float midi[]) {
        float output[midi.size()];
        for(int i;i<midi.size();i++)
            mtof(midi[i]) => output[i];
        return output;
    }
            
    fun static dur midi2dur(float midi)
    {
        return (1.0/Std.mtof(midi))::second;
    }
    
    fun static dur mtod(float midi)
    {
        return midi2dur(midi);
    }
    
    fun static dur mtosamp(float midi) {
        return (44100.0 / Std.mtof(midi))::samp;
    }
    
    fun static dur mtos(float freq) {
        return (1.0 / Std.mtof(freq))::second;
    }
    
    fun static float ac2dc(float ac) {
        return (ac + 1) * .5;
    }
    
    fun static float dc2ac(float dc) {
        return (dc * 2) - 1;
    }
    
    fun static int limit(int input,int low,int high) {
        if (input < low) return low;
        else if (input > high) return high;
        else return input;
    }
    
    fun static float limitf(float input,float low,float high) {
        if (input < low) return low;
        else if (input > high) return high;
        else return input;
    }
    
    fun static dur limitd(dur input,dur low,dur high) {
        if (input < low) return low;
        else if (input > high) return high;
        else return input;
    }
    
    fun static float twobit(float input) {
        if (input > 0) return 1.;
        return -1.;
    }
    
    fun static float bitcrush(float input,int sterkte) {
        int x,sign;
        (input * 32767) $ int => x;
        if (x < 0) 1 => sign;
        Std.abs(x)>>sterkte => x;
        x<<sterkte => x;
        if (sign == 1) return -(x/32767.0);
        return x/32767.0;
    }
}



