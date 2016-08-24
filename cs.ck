public class cs
{   
    fun static float rareValue(float normal,float rare, int p) {
        if (chance(1,p)) {
            return rare;
        } else {
            return normal;
        }
    }
    
    fun static float sec(dur arg) {
        return arg / second;
    }
    
    1.0 / 44100.0 => static float samplet;
    
    fun static float [] reversef(float seq[]) {
        seq.cap() - 1 => int n => int size;
        float result[seq.cap()];
        while (n >= 0) {
            seq[size-n] => result[n];
            n--;
        }
        return result;
    }
    
    fun static int [] reverse(int seq[]) {
        seq.cap() - 1 => int n => int size;
        int result[seq.cap()];
        while (n >= 0) {
            seq[size-n] => result[n];
            n--;
        }
        return result;
    }
            
    
    fun static void loadBuffer(Buffer buf,float array[]) {
        array.cap() => int size;
        size * samp => buf.max;
        for (int i;i<size;i++) {
            buf.valueAt(i,array[i]);
        }
    }
    
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
        return array[Math.random()%array.size()];
    }
    
    fun static int ch (int array [] ) {
        return choose(array);
    }
    
    fun static float chf (float array [] ) {
        return choosef(array);
    }

    fun static int w_choice(int list[][])
    {
        int sum;
        for (int i;i<list.size();i++) {
            list[i][1] +=> sum;
        }
        Math.random2(0,sum) => int n;
        for (int i;i<list.size();i++)
        {
            if (n < list[i][1])
            { return list[i][0]; }
            else
            { list[i][1] -=> n; }
        }
        return list[list.size()-1][0];
    }

    fun static float w_choicef(float list[][]) {
        float sum;
        for (int i;i<list.size();i++) {
            list[i][1] +=> sum;
        }
        Math.random2f(0,sum) => float n;
        for (int i;i<list.size();i++)
        {
            if (n < list[i][1])
            { 
                return list[i][0]; 
            }
            else
            { 
                list[i][1] -=> n; 
            }
        }
        return list[list.size()-1][0];
    }
    
    fun static int min (int a, int b) {
        if (a<b) return a;
        else return b;
    }
    
    fun static float [] minArray(float array[]) {
        array.cap() => int size;
        float result[size];
        array[0] => float min;
        for (int i;i<size;i++) {
            Math.min( min, array[i] ) => result[i];
        }
        return result;
    }
    
    fun static int max (int a,int b) {
        if (a>b) return a;
        else return b;
    }
    
    fun static int diff(int a,int b) {
        return Std.abs(b-a);
    }
    
    fun static float inverse(float x) {
        if (x == 0) {return 0.;<<<"divide by zero, a kitten is killed">>>;}
        return 1.0/x;
    }
    
    fun static float [] mapInverse(float seq[]) {
        float output[seq.cap()];
        for (int i;i<seq.cap();++i) {
            1.0 / seq[i] => output[i];
        }
        return output;
    }
    
    fun static dur makedur(float x) {
        return x::second;
    }
    
    fun static void sync(dur T) {
        T - (now % T) => now;
    }
    
    fun static void sync(float t) {
        sync(t*second);
    }
    
    fun static void sync(int t) {
        sync(t*second);
    }
    
    fun static float choosef( float array[] )
    {
        return array[Math.random()%array.size()];
    }
    
    fun static float choosef( int array[] ) {
        return choose(array) $ float;
    }
    
    fun static string choosestr( string array[] )
    {
        return array[Math.random()%array.size()];
    }
    
    fun static dur choosed( float array[] ) 
    {
        return array[Math.random()%array.size()]::second;
    }
    
    fun static dur choosed( int array[] )
    {
        return array[Math.random()%array.size()]::second;
    }
    
    fun static dur choosed( dur array[] )
    {
        return array[Math.random()%array.size()];
    }
    
    fun static int sometimes(int p,int vase) {
        if (rv(0,vase) < p) return 1;
        else return 0;
    }
    
    fun static int[] fill( int amount,int low,int high )  
    {
        int output[amount];
        for (0 => int i;i<amount;i++)
            Math.random2(low,high) => output[i];
        return output;
    }
    
    fun static float[] fillf( int amount,float low, float high )
    {
        float outputf[amount];
        for (0 => int i;i<amount;i++)
            Math.random2f(low,high) => outputf[i];
        return outputf;
    }
    
    fun static float[] fillexpf( int amount,float low, float high,float power )
    {
        float outputf[amount];
        for (0 => int i;i<amount;i++)
            randExp(low,high,power) => outputf[i];
        return outputf;
    }
    
    fun static float[] mirrorf ( float input[] ) {
        input.cap() => int amount;
        float output[amount*2];
        for (0 => int i;i<amount*2;i++) {
            if (i < amount) {
                input[i] => output[i];
            } else {
                input[((2*amount) - i)-1] * -1 => output[i];
            }
        }
        return output;
    }
    
    fun static int[] mirror ( int input[] ) {
        input.cap() => int amount;
        int output[amount*2];
        for (0 => int i;i<amount*2;i++) {
            if (i < amount) {
                input[i] => output[i];
            } else {
                input[((2*amount) - i)-1] * -1 => output[i];
            }
        }
        return output;
    }
    
    fun static int[] append( int input[], int value )
    {
        input.size() => int size;
        int result[size+1];
        for (int i;i<size;i++) { input[i] => result[i]; }
        value => result[size];
        return result;
    }
    
    fun static int[] append(int input[],int input2[]) {
        input.cap() => int size;
        input2.cap() => int size2;
        
        int result[size+size2];
        
        for (int i;i<size;i++) { 
            input[i] => result[i];
        }
        for (int i;i<size2;i++) {
            input2[i] => result[i + size];
        }
        return result;
    }
        
        
    
    fun static float[] appendf( float input[], float value )
    {
        input.size() => int size;
        float result[size+1];
        for (int i;i<size;i++) { input[i] => result[i]; }
        value => result[size];
        return result;
    }
    
    fun static float[] appendf(float input[],float input2[]) {
        input.cap() => int size;
        input2.cap() => int size2;
        
        float result[size+size2];
        
        for (int i;i<size;i++) { 
            input[i] => result[i];
        }
        for (int i;i<size2;i++) {
            input2[i] => result[i + size];
        }
        return result;
    }
    
    fun static float[] insertf (float input[],float value) {
        input.cap() => int size;
        float output[size+1]; // bigger array;
        if (size == 0) { // if size is 0, array with value.
            value => output[0];
            return output;
        }
        
        size - 1 => int i; // start at end;
        // first check i > 0, otherwise error with zero size
        while( (i >= 0) && (value < input[i]) ) { // continue while value is bigger than or end
            input[i] => output[i+1]; // copy 1 cell shifted.
            i--;
        }
        value => output[i+1]; // insert the value
        
        while( i >= 0 ) { // copy remainder to output
            input[i] => output[i]; 
            i--;
        }
        
        return output; 
    }
    
    fun static int[] insert (int input[],int value) {
        input.cap() => int size;
        int output[size+1]; // bigger array;
        if (size == 0) { // if size is 0, array with value.
            value => output[0];
            return output;
        }
        
        size - 1 => int i; // start at end;
        // first check i > 0, otherwise error with zero size
        while( (i >= 0) && (value < input[i]) ) { // continue while value is bigger than or end
            input[i] => output[i+1]; // copy 1 cell shifted.
            i--;
        }
        value => output[i+1]; // insert the value
        
        while( i >= 0 ) { // copy remainder to output
            input[i] => output[i]; 
            i--;
        }
        
        cs.print(output);
        return output; 
    }
    
    fun static float[] splicef(float input[],int index,float value) {
        input.cap() => int size;
        
        float output[size + 1];
        
        if (index > size) {
            <<<"index is bigger than array">>>;
            return input;
        }
        
        for (int i;i<index;i++) {
            input[i] => output[i];
        }
        value => output[index];
        
        for (index+1 => int i;i < (size + 1);i++) {
            input[i-1] => output[i];
        }
        return output;
    }
    
    fun static int[] splice(int input[],int index,int value) {
        input.cap() => int size;
        
        int output[size + 1];
        
        if (index > size) {
            <<<"index is bigger than array">>>;
            return input;
        }
        
        for (int i;i<index;i++) {
            input[i] => output[i];
        }
        value => output[index];
        
        for (index+1 => int i;i < (size + 1);i++) {
            input[i-1] => output[i];
        }
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
   
   fun static int[] range( int low, int high) {
       return range(low,high,1);
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
    
    fun static float [] fillgeo(int steps,float low,float high) {
        return geometric(low,high,steps);
    }
    
    fun static float[] geo (float low,float high,int steps) {
        return geometric(low,high,steps);
    }
    
    fun static float[] warp(float low,float high,int steps,float warp) {
        float output[steps];
        Std.fabs(high - low) => float range;
        Math.min(low,high) => float offset;
        for (int i;i<steps;i++) {
            (Math.pow((i $ float)/steps,warp) * range) + offset => output[i];
        }
        return output;
    }
    
    fun static int [] poly (int x[],int a,int b,int c) {
        int y[x.size()];
        for (int i;i<x.size();i++) {
            (a * x[i] * x[i]) + (b * x[i]) + c => y[i];
        }
        return y;
    }
    
    fun static float [] polyf (float x[],int a, int b, int c) {
        float y[x.size()];
        for (int i;i<x.size();i++) {
            (a * x[i] * x[i]) + (b * x[i]) + c => y[i];
        }
        return y;
    }
    
    fun static int[] shuffle(int array[]) {
        array.size() => int max;
        0 => int tmp;
        0 => int pos;
        while(max-- > 1) {
            Math.random2(0,max-1) => pos;
            array[pos] => tmp;
            array[max] => array[pos];
            tmp => array[max]; 
        }
        return array;
    }
    
    fun static float[] shufflef(float array[]) {
        array.size() => int max;
        0 => float tmp;
        0 => int pos;
        while(max-- > 1) {
            Math.random2(0,max-1) => pos;
            array[pos] => tmp;
            array[max] => array[pos];
            tmp => array[max]; 
        }
        return array;
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
    
    fun static int[] append(int a[],int b[]) {
        return addArray(a,b);
    }
    
    fun static float[] appendf(float a[],float b[]) {
        return addArrayf(a,b);
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
    
    fun static float exprv(float low,float high,float power) {
        return randExp(low,high,power);
    }
    
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
    { return (Math.random2(low,high)); }
    // rv float
    fun static float rvf (float low,float high)
    { return (Math.random2f(low,high)); }
    fun static float rvf() {
        return (Math.random2f(-1,1)); 
    }
    
    fun static int rv(int high) {
        return rv(0,high);
    }
    
    fun static float rvf(float high) {
        return rvf(0,high);
    }
    
    fun static float rf (float low, float high)
    { return mtof(rvf(low,high)); }
    
    fun static float rff (float low, float high)
    { return rf(ftom(low),ftom(high)); }
    
    fun static dur rd (dur low,dur high) {
        dtom(low) => float lowMidi;
        dtom(high) => float highMidi;
        return mtod(rvf(lowMidi,highMidi));
    }
    
    fun static int rindex (float array[]) {
        return rv(0,array.cap()-1);
    }
    
    fun static int rindex (int array[]) {
        return rv(0,array.cap()-1);
    }
    
    fun static float [] rvfRange(float low,float high) {
        float a,b;
        rvf(low,high) => a;
        rvf(low,high) => b;
        return [Math.min(a,b),Math.max(a,b)];
    }
    
    fun static int chance(int p,int n) 
    { return (rv(0,n) < p); }
    
    fun static int ch(int p,int n)
    { return chance(p,n); }
    
    fun static dur BPM(float bpm) {
        return 60::second / bpm;
    }
    
    fun static float ev(float alpha) {
        return Math.log( 1 - (Math.randomf()) / (-alpha));
    }
    
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
    
    fun static int [] print( int input[] )
    {
        for (int i;i<input.size();chout <= input[i++] <= "\t") {
            // nothing
        }
        chout <= IO.newline();
        return input;
    }
    
    fun static float [] printf( float input[] )
    {
        for (int i;i<input.size();chout <= input[i++] <= "\t\t") {
            // nothing
        }
        chout <= IO.newline();
        return input;
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
        if (input <= a) return c;
        if (input >= b) return d;   
        return (((input - Math.min(a,b)) / Std.fabs(a-b)) * Std.fabs(c-d)) + Math.min(c,d);
    }
    
    fun static float scalef (float input,float a,float b,float c,float d,float exp) 
    {
        if (input <= a) return c;
        if (input >= b) return d;
        if (exp < 0) {
            <<<"negative exp">>>;
            return 0.0;
        }
        return (Math.pow((((input - Math.min(a,b)) / Std.fabs(a-b))),exp) * Std.fabs(c-d)) + Math.min(c,d);
    }
    
    fun static float mapf(float in,float a,float b,float c,float d) {
        return scalef(in,a,b,c,d);
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
    
    fun static int safeTableIndex(int x,int size) {
        x % size => x;
        if (x < 0) {
            size + x + 1 => x;
        }
        return x;
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
    
    fun static float sqrf(float sqr) {
        return sqr*sqr;
    }
    
    fun static int sqr(int sqr) {
        return sqr*sqr;
    }
    
    fun static int sum(int seq[])
    {
        int x;
        for (int i;i<seq.size();i++)
            seq[i] +=> x;
        return x;
    }
    

    
    fun static int [] integrate(int seq[],int offset) {
        int output[seq.cap()+1];
        offset => int value;
        for (int i;i<output.cap();i++) {
            value => output[i];
            if (i < seq.cap()) {
                seq[i] + value => value;
                <<<value>>>;
            }
        }
        return output;
    }
    
    fun static int [] integrate(int seq[])
    {
        return integrate(seq,0);
    }
    
    fun static int sum(int seq[]) {
        int x;
        for (int i;i<seq.cap();i++) {
            seq[i] +=> x;
        }
        return x;
    }
    
    fun static float sumf(float seq[])
    {
        float x;
        for (int i;i<seq.size();i++)
            seq[i] +=> x;
        return x;
    }
    
    fun static float [] offsetArray(float arrayArg[],float offsetArg) {
        float result[arrayArg.cap()];
        for (int i;i<arrayArg.cap();i++) {
            arrayArg[i] + offsetArg => result[i];
        }
        return result;
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
    
    fun static int quickSortF(float arr[], int elements)
    {    
        1000 => int MAX_LEVELS;
        
        int i, L, R ;
        float piv;
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
    
    fun static int sort(int list[]) {
        return quickSort(list,list.cap());
    }
    
    fun static int sortf(float list[]) {
        return quickSortF(list,list.cap());
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
    
    fun static int[] copy(int array[]) {
        return copyArray(array);
    }
    
    fun static float[] copyf(float array[]) {
        return copyArrayf(array);
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
    
    fun static float[] splicef(float seq[],int a,int b) {
        if (a < 0) {
            <<<"wrong index">>>;
        }
        if (b > seq.cap() - 1) {
            <<<"wrong index">>>;
        }
        float output[(b - a)+1];
        int idx;
        for (a => int i;i <= b;i++) {
            seq[i] => output[idx++];
        }
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
    
    fun static float rtom(float ratio) {
        return (12 * Math.log2(ratio));
    }

    fun static float midi2time(float midi)
    {
        return 1.0/Std.mtof(midi);
    }
    
    fun static float mtof(float midi)
    {
        return 440.0 * Math.pow(2,((midi-69.0)/12.0));
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
        return (12 * Math.log2(freq/440.0)) + 69.0;
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
    
    fun static float [] slice (float input[],int start, int end) {
        // not quite safe this one !
        if (start > end) {
            end => int tmp;
            start => end;
            tmp => start;
        }
        
        if (end >= input.size()) {
            <<<" Out of bounds !!! ">>>;
            return [0.];
        }
            
        
        float output[(end-start)+1];
        int idx;
        for (start => int i;i<=end;i++) {
            input[i] => output[idx++];
        }
        return output;
    }
    
    fun static float [] createGen10List(float harmonicAndWeight[][]) {
        // this is a function to ease creating arrays for Gen10
        // input is ([[harmonic,amp],[harmonic,amp],[harmonic,amp]]
        
        harmonicAndWeight.cap() => int size;
        (harmonicAndWeight[size-1][0]) $ int => int resultSize;
        float result[resultSize];
        
        int i;
        int harmonicNumber;

        while (i < size) {
            if (harmonicAndWeight[i][0] - 1 == harmonicNumber) {
                harmonicAndWeight[i][1] => result[harmonicNumber];
                ++i;
            } else {
                0 => result[harmonicNumber];
            }
            ++harmonicNumber;
        }
        
        return result;
    }
    
    fun static void monitorShred(UGen ugen,dur cr) {
        while(1) {
            <<<ugen.last()>>>;
            cr => now;
        }
    }
    
    fun static void monitor(UGen ugen,dur cr) {
        spork ~ monitorShred(ugen,cr);
    }
    
    fun static void monitor(UGen ugen) {
        spork ~ monitorShred(ugen,250::ms);
    }
    
    fun static void spray(UGen ugen[]) {
        Pan2 pan[ugen.cap()];
        for (int i;i<ugen.cap();++i) {
            ugen[i] => pan[i] => dac;
            rvf() => pan[i].pan;
        }
    }
    
    fun static void spray(Chubgraph ugen[]) {
        Pan2 pan[ugen.cap()];
        for (int i;i<ugen.cap();++i) {
            ugen[i] => pan[i] => dac;
            rvf() => pan[i].pan;
        }
    }
    
    fun static void normalize(UGen ugen[]) {
        ugen.cap() => int size;
        1.0 / size => float gain;
        for (int i;i<size;++i) gain => ugen[i].gain;
    }
    
    fun static void normalize(float seq[]) {
        float max;
        for (int i;i<seq.cap();i++) {
            Math.max(max,Std.fabs(seq[i])) => max;
        }
        1.0 / max => float scaleFactor;
        for (int i;i<seq.cap();i++) {
            seq[i] * scaleFactor => seq[i];
        }
    }
    
    fun static float[] mapArray(float seqArg[],float minArg,float maxArg) {
        float min,max;
        seqArg.cap() => int size;
        float result[size];
        // find peaks
        seqArg[0] => min;
        seqArg[1] => max;
        for (int i;i<size;i++) {
            Math.max(max,seqArg[i]) => max;
            Math.min(min,seqArg[i]) => min;
        }
        // scale all the values, according to peaks.
        for (int i;i<size;i++) {
            scalef(seqArg[i],min,max,minArg,maxArg) => result[i];
        }
        return result;
    }
    
    fun static void normalize(Chubgraph ugen[]) {
        ugen.cap() => int size;
        1.0 / size => float gain;
        for (int i;i<size;++i) gain => ugen[i].gain;
    }

    fun static int [] fibbo(int size) {
        if (size < 1) {
            <<<"size is too small">>>;
            return null;
        }
        int output[size]; 1 => output[0];
        if (size > 1) {
            1 => output[1];
            for (2 => int i;i<size;++i) {
                output[i-2] + output[i-1] => output[i];
            }
        }
        return output;
    }     
    
    fun static float [] grow(float low,float ratio,int steps) {
        float output[steps];
        low => output[0];
        for (1 => int i;i<steps;i++) {
            output[i-1] * ratio => output[i];
        }
        return output;
    }
    
    fun static float [] sine(int size,float sine_weights[]) {
        sine_weights.cap() => int w_size;
        float output[size];
        float phase;
        float sum;
        
        1.0 / size => float phase_incr;
        
        for (int i;i<size;i++) {
            0.0 => sum;
            for (int j;j<w_size;j++) {
                sine_weights[j] * Math.sin((j+1)*phase*pi*2.0) +=> sum;
            }
            sum => output[i];
            phase_incr +=> phase;
        }
        normalize(output);
        return output;
    }   
    
    fun static float [] sine(int sizeArg)  {
        return sine(sizeArg, [1.0]);
    }
    
    fun static float [] perc( int size, float power ) {
        float result[size];
        if (power < 1) {
            <<<"power < 1, using power = 1.0">>>;
            1 => power;
        }
        1.0 / size => float delta;
        for (0 => int i; i < size ; ++i) {
            Math.pow( 1.0 - (delta * i) , power ) => result[i];
        }
        return result;
    }
    
    fun static float [] perc( int size ) {
        return perc( size, 2.7182818284 );
    }
    
    fun static float [] mupArray(float array1[], float array2[]) {
        float result[array1.cap()];
        if (array1.cap() != array2.cap()) {
            <<<"wrong sizes!">>>;
            return result;
        }
        for (0 => int i; i<array1.cap() ; ++i) {
            array1[i] * array2[i] => result[i];
        }
        return result;
    }
    
    fun static float [] mupArray(float arrArg[],float mupArg) {
        float result[arrArg.cap()];
        for (int i;i<arrArg.cap();i++) {
            arrArg[i] * mupArg => result[i];
        }
        return result;
    }
            
            
    
    fun static float [] diffs( float seq[] ) {
        seq.cap() => int amount;   
        sumOfIntegers(amount-1) => int resultSize;
        
        if (resultSize > 65536) {
            <<<"this is very big, don't bother">>>;
            return [0.];
        }
        
        float result[resultSize-1];
        
        0 => int idx;
        
        for (int i;i < amount;i++) {
            for ((i+1) => int j;j < amount;j++) {
                seq[j] - seq[i] => result[idx++];
            }
        }
        return result;
    }
    
    fun static float [] sums( float seq[] ) {
        seq.cap() => int amount;   
        sumOfIntegers(amount-1) => int resultSize;
       
        
        float result[resultSize-1];
        
        0 => int idx;
        
        for (int i;i < amount;i++) {
            for ((i+1) => int j;j < amount;j++) {
                seq[j] + seq[i] => result[idx++];
            }
        }
        return result;
    }
    
    fun static int factorial ( int x ) {
        1 => int result;
        for (1 => int count;count <= x;count++) {
            count *=> result;
        }
        return result;
    }
    
    fun static int sumOfIntegers( int x ) {
        1 => int result;
        for (1 => int count;count <= x;count++) {
            count +=> result;
        }
        return result;
    }
    
    fun static int [] int2binary( int n ) {
        int result[63];
        
        for (result.cap()-1 => int i;i;i--) {
            1 & n => result[i];
            n >> 1 => n;
        }
        return result;
    }
    
    fun static int [] int2bin( int n ) {
        return int2binary( n );
    }         
    
    fun static float [] pitchClassMap( float seq[] , float minArg, float maxArg ) {
        float result[0];
        seq.cap() => int size;
        for (int i;i<size;i++) {
            seq[i] => float value;
            while( (value / 2.0) > minArg ) {
                value / 2.0 => value;
            }
            while (value < minArg) {
                value * 2.0 => value;
            }
            while( value < maxArg ) {
                appendf(result,value) @=> result;
                value * 2.0 => value;
            }
        }
        return result;
    }  
    
    fun static void testSpeakerShred(int channel) {
        [0.05,0.1,0.2,0.4,0.8,0.33,0.25,0.18,0.9,0.21] @=> float timings[];
        if (channel > dac.channels()) {
            <<<"no such channel:", channel>>>;
            return;
        }
        Noise noise => dac.chan(channel);
        noise.gain(0.1);
        timings[channel] => float timing;
        
        while(1) {
            timing * 0.1 * second => now;
            noise.gain(0);
            timing * second => now;
            noise.gain(0.1);
        }
    }
    
    fun static UGen RandPan() {
        Pan4 pan => dac;
        rvf() => pan.pan;
        return pan;
    }
    
    fun static void testSpeaker(int channel) {
        spork ~ testSpeakerShred(channel);
    }
    
    fun static void testSpeaker(int channels[]) {
        int i;
        for (0 => i;i<channels.cap();i++) {
            .5::second => now;
            spork ~ testSpeakerShred(channels[i]);
        }
    }
    
    fun float [] buffToArray(string path) {
        SndBuf b;
        b.read(path);
        b.samples() => int size;
        float array[size];
        
        for (int i;i<size;i++) {
            b.valueAt(i) => array[i];
        }
        return array;
    }
}



