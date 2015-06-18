public class TransformList extends Cflist
{
    float arrayold[0]; // startingpoint
    float arrayt[0];   // target array
    float arrays[0];  // speed array
    int steps,step;
    string type;
    
    fun void init(float arraytg[],int stepsi)
    {
        toArray() @=> arrayold;
        if (size() != arraytg.size())
            <<<"size of arrays is not equal">>>;
        arrays.size(size());
        arrayt.size(size());
        arraytg @=> arrayt;
        stepsi => steps => step;
        for (int i;i<size();i++) {
            (arrayt[i] - array[i]) / steps => arrays[i];
        }
    }
    
    fun void initvar(float deviationratio,int stepsi)
    {
        toArray() @=> arrayold;
        arrays.size(size());
        toArray() @=> arrayt; //copy array
        for (int i;i<size();i++) // deviate array
        {
            arrayt[i] * Std.rand2f(1.-deviationratio,1.+deviationratio) => arrayt[i];
        }
        stepsi => steps => step;
        for (int i;i<size();i++) { //calculate transform speeds
            (arrayt[i] - array[i]) / steps => arrays[i];
        }    
    }
    
    fun void transform()
    {
        if (steps != 0)
        {
            for (int i;i<size();i++) {
                arrays[i] + array[i] => array[i];
            }
            steps--;
        }
        else
            <<<"target reached.">>>;
            
    }
    
    fun void reset(int stepp)
    { 
        cs.copyArrayf(arrayold) @=> array;
        stepp => steps;
    }
    
    fun void reset()
    { reset(step); }
}
        
        
    
    