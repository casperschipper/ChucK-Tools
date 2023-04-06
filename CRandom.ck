public class CRandom {
    int x, y, z, w;
    // note: numbers are not what they seem !!!, literals can never be fully 64 bit...
    0x1B185FF2F709282F => x;
    0x1B182122F709282F => y;
    0x12AAAB82834FD993 => z;
    0x1AF892839423A891 => w;
    wash();


    
    fun CRandom seed(int arg) {
        0x1B185FF2F709282F => x;
        0x1B182122F709282F => y;
        0x12AAAB82834FD993 => z;

        arg => w;
        wash();
        return this;
    }
    
    fun CRandom seed() {
        0x1B185FF2F709282F => x;
        0x1B182122F709282F => y;
        0x12AAAB82834FD993 => z;
        Math.random() => w;
        wash();
        return this;

    }

    fun void wash() {
        32 => int n;
        while(n--) {
            next();
        }
    }
    
    fun int next() {
        x ^ (x << 11) => int t;
        y => x; z => y; w => z;
        w ^ (w >> 19) ^ t ^ ( t >> 8) => w;
        return w;
    }

    fun void printState() {
        <<<x>>>;
        <<<y>>>;
        <<<z>>>;
        <<<w>>>;
    }
    
    fun float rand() {
        return Std.fabs((next() $ float) / ((1 << 63) - 1));
    }
  
    int vaseArray[];
    int vaseMax;
    
    fun int rv(int low, int high)
    { 
        return (rand() * Std.abs(high-low+1) + Math.min(low,high)) $ int;
    }
    
    fun int rv(int high)
    { return rv(0,high); }

    fun float rvf(float low, float high)
    { 
        return (rand() * Std.fabs(high-low) + Math.min(low,high));
    }   
    
    fun float rvf(float high)
    { return rvf(0,high); }

    fun int[] rvArray(int low,int high,int number)
    { 
        int output[number];
        for (int i;i<number;i++)
        { rv(low,high) => output[i];}
        return output;
    }
    
    fun float[] rvfArray(float low,float high, int number)
    {
        float output[number];
        for (int i;i<number;i++)
        { rvf(low,high) => output[i]; }
        return output;
    }
    
    fun int choice(int array[])
    {
        return array[rv(0,array.size()-1)];
    }
    
    fun float choicef(float array[]) 
    {
        return array[rv(0,array.size()-1)];
    }
    
    fun float gauss()
    {
        float x1,x2,w,y1,y2;
        do
        {
            2.0 * rand() - 1.0 => x1;
            2.0 * rand() - 2.0 => x2;
            (x1 * x1) + (x2 * x2) => w;
        } while ( w >= 1.0);
        
        Math.sqrt( (-2.0 * Math.log ( w ) ) / w ) => w;
        x1 * w => y1;
        x2 * w => y2;
        return y1;
    }
    
    fun int w_choice(int list[][])
    {
        int sum;
        for (int i;i<list.size();i++) {
            list[i][1] +=> sum;
        }
        rv(sum) => int n;
        for (int i;i<list.size();i++)
        {
            if (n < list[i][1])
            { return list[i][0]; }
            else
            { list[i][1] -=> n; }
        }
        return list[list.size()-1][0];
    }
    
    fun float w_choicef(float list[][])
    {
        float sum;
        for (int i;i<list.size();i++)
            list[i][1] +=> sum;
        rvf(sum) => float n;
        for (int i;i<list.size();i++)
        {
            if (n < list[i][1])
            { return list[i][0]; }
            else
            { list[i][1] -=> n; }
        }
        return list[list.size()-1][0];
    }
    
    fun int[] shuffle(int list[]) {
        list.size() => int size;
        
        int output[size];
        int check[size];
        int select;
        
        for (int i;i<list.size();i++) {
            rv(0,size-1) => select;
            until (check[select] == 0) {
                rv(0,size-1) => select;
            }
            list[select] => output[i];
            1 => check[select];
        }
        return output;
    }
            
            
        
    
    fun void stupidshuffle(int list[],int shuffles)
    {
        int temp,a,b;
        for (int i;i<shuffles;i++)
        {
            rv(0,list.size()) => a;
            rv(0,list.size()) => b;
            list[a] => temp;
            list[b] => list[a];
            temp => list[b];
        }
    }
    
    fun void stupidshuffle(int list[])
    { stupidshuffle(list,list.size()*2); }
    
    fun void initVase(int amount) {
        amount - 1 => vaseMax;
        vaseArray.size(amount);
        for (int i;i<amount;i => vaseArray[i++]) ;
    }
    
    fun int takeVase() {
        rv(0,vaseMax) => int idx;
        vaseArray[idx] => int value;
        vaseArray[vaseMax--] => vaseArray[idx];
        return value;
    }
}      