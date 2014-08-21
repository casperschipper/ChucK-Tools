public class Random
{
    523225901 => static int m_z;
    46053668 => static int m_w;
    Math.pow(2,31) => static float magic;
  
    int vaseArray[];
    int vaseMax;
    
    fun static int rv(int low, int high)
    { 
        return (rand() * Std.abs(high-low+1) + Math.min(low,high)) $ int;
    }
    
    fun static int rv(int high)
    { return rv(0,high); }

    fun static float rvf(float low, float high)
    { 
        return (rand() * Std.fabs(high-low) + Math.min(low,high));
    }   
    
    fun static float rvf(float high)
    { return rvf(0,high); }

    fun static int[] rvArray(int low,int high,int number)
    { 
        int output[number];
        for (int i;i<number;i++)
        { rv(low,high) => output[i];}
        return output;
    }
    
    fun static float[] rvfArray(float low,float high, int number)
    {
        float output[number];
        for (int i;i<number;i++)
        { rvf(low,high) => output[i]; }
        return output;
    }
    
    fun static int choice(int array[])
    {
        return array[rv(0,array.size())];
    }
    
    fun static float gauss()
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
    
    fun static int getInt()
    {
        36969 * (m_z & 65535) + (m_z >> 16) => m_z;
        18000 * (m_w & 65535) + (m_w >> 16) => m_w;
        return ((m_z) << 16) + (m_w & 65535);
    }
    
    fun static float rand()
    {
        return (((getInt()+1) * (1.0 / magic)) + 1) * .5;
    }
    
    fun static void seed(int seed1)
    { seed1 => m_z; }
    
    fun static void seed(int seed1,int seed2)
    { 
        seed1 => m_z;
        seed2 => m_w;
    }   
    
    fun static void seed()
    {
        Std.rand() => m_z;
        Std.rand() => m_w;
    }
    
    fun int[] returnSeed() {
        return [m_z,m_w];
    }
    
    fun int w_choice(int list[][])
    {
        int sum;
        for (int i;i<list.size();i++)
            list[i][1] +=> sum;
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