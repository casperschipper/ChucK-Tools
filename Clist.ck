public class Clist 
{
    int array[0];
    CRandom random;
    -1 => int pos;
    
    fun void print()
    {
        <<<"printing array">>>;
        for (int i;i<size();i++)
            <<<array[i]>>>; 
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
    
    fun void set(int input[])
    { 
        input @=> array;
    }
    
    fun void sv(int index,int value)
    {
        value => array[index];
    }
    
    fun void insert(int index,int value)
    {
        size(size()+1);
        for (size() => int i;i>index;i--)
        { 
            array[i-1] => array[i]; 
        }
        sv(index,value);
    }
    
    fun void crop(int start,int stop)
    {
        cs.copyArray(array) @=> int temp[];
        array.size(stop-start+1);
        for (start => int i;i<=stop;i++)
        { temp[i] => array[i]; }
    }
           
    fun int get(int index)
    { 
        return array[index]; 
    }
    
    fun int next()
    {
        ++pos % array.size() => pos;
        return array[pos];
    }
    
    fun int last()
    { 
        pos % array.size() => pos;
        return array[pos % array.size()];
    }
    
    fun int setPos(int posi) 
    {
        posi => pos;
        return pos;
    }
    
    fun float interp(int a,int b,float x) {
        return (b-a) * x;
    }
        
    fun float geti(float index) {
        return interp(array[Math.floor(index)$int],array[Math.ceil(index)$int],Math.fmod(index,1));
    }
    
    fun int take(int index)
    { 
        array[index] => int temp; 
        remove(index);
        return temp;
    }
    
    fun int pop()
    { return take(size()-1); }
    
    fun void append(int value)
    {
        array.size(size()+1);
        value => array[size()-1];
    }
    
    fun void prepend(int value)
    {
        array.size(size()+1);
        for (int i;i<(size()-1);i++)
        {
            array[i] => array[i+1];
        }
        value => array[0];
    }
    
    fun void addAll(Clist clijst)
    { 
        array.size(size()+clijst.size());
        for (int i;i<clijst.size();i++)
        {
            append(clijst.get(i));
        }
    }
    
   fun void addAll(List clijst)
   { 
       for (int i;i<clijst.size();i++)
       {
           append(clijst.get(i));
       }
   }
        
        
    fun int[] toArray()
    {
        int output[size()];
        for (int i;i<size();i++)
        {
            array[i] => output[i] ;
        }
        return output;
    }
    
    fun Clist duplicate()
    {
        Clist dup;
        dup.size(size());
        for (int i;i<size();i++)
            dup.sv(i,array[i]);
        return dup;
    }
    
    fun Clist dupl()
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
        toArray() @=> int temp[];
        for (int i;i<size();i++)
        { temp[size()-i-1] => array[i]; }
    }
    
    fun void map(int mapper[])
    {
        mapper.size() => int mapsize;
        for (int i;i<size();i++)
        {
            if (array[i] > mapsize-1) <<<"map is too small">>>;
            mapper[(array[i])] => array[i];
        }
    }
    
    fun void invert()
    {
        max() => int maxi;
        for (int i;i<size();i++)
            maxi - array[i] => array[i];
    }
    
    fun void transpose(int amount,int highest) {
        for (int i;i<size();i++)
            (array[i]+amount) % highest => array[i];
    }
    
    fun void transpose(int amount) {
        transpose(amount,max());
    }
        
            
    fun int max()
    {
        int maxi;
        for (int i;i<size();i++)
        {
            if (array[i] > maxi)
                array[i] => maxi;
        }
        return maxi;
    }
    
    fun int min() {
        int mini;
        max() => mini;
        for (int i;i<size();i++)
        {
            if (array[i] < mini)
                array[i] => mini;
        }
        return mini;
    }
    
    fun int find(int value)
    {
        for (int i;i<size();i++)
        {
            if (i == value)
                return i;
        }
        return -1;
    }
    
    fun void delValue(int value)
    {
        for (int i;i<size();i++)
        {
            if (array[i]==value)
            { remove(i); }
        }
    }
    
    fun void order(Clist orderlist)
    {
        toArray() @=> int temp[];
        for (int i;i<orderlist.size();i++)
        {
            temp[orderlist.get(i)] => array[i];
        }
    }
    
// Random methods
    fun int choose()
    {
        return array[random.rv(0,size()-1)];
    }
    
    fun void shuffle()
    {
        cs.shuffle(array);
    }
   
            
    
    fun int takeRand()
    {
        return take(random.rv(0,size()-1));
    }
    
    fun void fillRand(int low,int high,int amount)
    {
        array.size(amount);
        for (int i;i<amount;i++)
        {
            random.rv(low,high) => array[i];
        }
    }
    
    fun void range(int low, int high, int step)
    {
        [0] @=> array;
        0 => int count;
        for (low => int i; i<high ; i + step => i)
        {
            i => array[count];
            size(count+2);
            count++;
        }
        array.size(size()-1);
    }
    
    fun void range(int low,int high) {
        range(low,high,1);
    }
    
    fun void fibbo(int number)
    {
        array.size(number);
        for (int i;i<number;i++)
        {
            if (i == 0 || i == 1)
                1 => array[i];
            else
                array[i-2] + array[i-1] => array[i];
        }
    }
    
    fun int[] difference() {
        int temp[size()-1];
        for (int i;i<size();i++) {
            array[i+1] - array[i] => temp[i];
        }
        return temp;
    }
    
    fun void expand(int factor)
    {
        for (int i;i<size();i++) {
            array[i] * factor => array[i];
        }
    }
    
    fun void removeOffset() {
        transpose(-1*min());
    }
}
       