public class Cflist
{
    float array[0];
    
    fun void print()
    {
        <<<"printing array">>>;
        for (int i;i<size();i++)
        {
            <<<array[i]>>>; 
        }
        <<<"done!">>>;
    }
    
    fun int size()
    { 
        return array.size(); 
    }
    
    fun int size(int setsize)
    {
        return array.size(setsize);
    }
    
    fun void set(float input[])
    { 
        input @=> array;
    }
    
    fun void sv(int index,float value)
    {
        value => array[index];
    }
    
    fun void insert(int index,float value)
    {
        size(size()+1);
        for (size() => int i;i>index;i--)
        { 
            array[i-1] => array[i]; 
        }
        sv(index,value);
    }
    
    fun float get(int index)
    { 
        return array[index]; 
    }
    
    fun float take(int index)
    { 
        array[index] => float temp; 
        remove(index);
        return temp;
    }
    
    fun void append(float value)
    {
        array.size(size()+1);
        value => array[size()-1];
    }
    
    fun void prepend(float value)
    {
        array.size(size()+1);
        for (int i;i<(size()-1);i++)
        {
            array[i] => array[i+1];
        }
        value => array[0];
    }
    
    fun void addAll(Cflist clijst)
    { 
        array.size(array.size()+clijst.size());
        for (int i;i<clijst.size();i++)
        {
            append(clijst.get(i));
        }
    }
    
    
    fun float[] toArray()
    {
        float output[size()];
        for (int i;i<size();i++)
        {
            array[i] => output[i] ;
        }
        return output;
    }
    
    fun Cflist duplicate()
    { 
        Cflist dup;
        dup.size(size());
        for (int i;i<size();i++)
            dup.sv(i,get(i));
        return dup;
    }
    
    fun Cflist dupl()
    { return duplicate(); }
    
    fun void remove(int index)
    {
        for (index => int i;i<size()-1;i++)
        {
            array[i+1] => array[i];
        }
        array.size(size()-1);
    }
    
    fun void reverse()
    {
        toArray() @=> float temp[];
        for (int i;i<size();i++)
        { temp[size()-i-1] => array[i]; }
    }
    
    fun int find(float value)
    {
        for (int i;i<size();i++)
        {
            if (i == value)
                return i;
        }
        return -1;
    }
    
    fun void delValue(float value)
    {
        for (int i;i<size();i++)
        {
            if (array[i]==value)
            { remove(i); }
        }
    }
    
    fun void order(Clist orderlist)
    // remember indexlist are always integers.
    {
        toArray() @=> float temp[];
        for (int i;i<orderlist.size();i++)
        {
            temp[orderlist.get(i)] => array[i];
        }
    }
    
    // Random methods
    fun float choose()
    {
        return array[Random.rv(0,size()-1)];
    }
    
    fun float takeRand()
    {
        return take(Random.rv(0,size()-1));
    }
    
    fun void fillRand(int amount,float low,float high)
    {
        array.size(amount);
        for (int i;i<amount;i++)
        {
            Random.rvf(low,high) => array[i];
        }
    }
    
    fun void range(float low, float high, float step)
    {
        [0.] @=> array;
        0 => int count;
        for (low => float i; i<=high ; i + step => i)
        {
            i => array[count];
            size(count+2);
            count++;
        }
        array.size(size()-1);
    }
    
    fun void geo(float low,float high,int sections)
    {
        Std.fabs(high-low) / sections => float step;
        range(low,high,step);
    }
        
    fun void exp(float low,float high,float sections,float exp)
    {
        [0.] @=> array;
        Scalerf scaler;
        scaler.setOut(low,high);
        1.0 / sections => float step;
        for (float i;i<=sections;step +=> i)
        { append(scaler.scale(Math.pow(i,exp))); }
    }
}



 