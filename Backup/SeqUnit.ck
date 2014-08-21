public class SeqUnit
{
    Random random;
    
    random.seed();
    
    "normal" => string state;
    0 => int last;
    7 => int max;
    int innerweights[][];
    int outerweight[][];
    // lemmingvars
    1 => int direction;
    .1 => float plemming;
    // grouprep vars
    [[0,1],[1,1],[2,1],[3,1],[4,1],[5,1],[6,1],[7,1]] @=> int whichrepw[][];
    [[1,1],[10,1],[50,1],[100,1]] @=> int nrepw[][];
    int repcount;
    [[1,100],[0,3]] @=> int skipchance[][];
    
    // mutate params
    4 => int mutateSize;
    int mutateT;
    Clist mutateList;
    10 => int minMutateT;
    40 => int maxMutateT;
    int point;
    
    
    // loop
    int innerloopsize;
    int outerloopsize;
    
    // serial array
    Clist serie,serie2;
    //makeSerie(7);
    serie2.set(serie.toArray());
    
    
    // walk
    [-1,1] @=> int walksteps[];
    
    fun void init()
    {
        initMutate();
    }
    
    fun void initMutate()
    {
        mutateList.fillRand(0,max,mutateSize);
    }
    
    fun int next()
    {
        if (state == "normal")
            return normal() => last;
        else if (state == "lemming")
            return lemming() => last;
        else if (state == "grouprep")
            return grouprep() => last;
        else if (state == "serial")
            return serial() => last;
        else if (state == "randi")
            return randi() => last;
        else if (state == "walk")
            return walk() => last;
        else if (state == "mutate")
            return mutate() => last;
        else if (state == "skip")
            return skip() => last;
        else
            <<<"this seqtype does not exist :",state>>>;
    }
    
    fun void setStateNumber(int nr)
    {
        (["grouprep","normal","lemming","mutate","walk","randi","skip"])[nr] => state;
    }
    
    fun void randomChange()
    {
        ["normal","lemming","grouprep","randi","walk","skip"] @=> string options[];
        options[random.rv(0,options.size()-1)] => state;
    }
    
    fun int limit(int x)
    { 
        if (x < 0)
            return max;
        else if (x >= max)
            return x % max;
        else
            return x;
    }
    
    fun int normal()
    { return limit(last + 1); }
    
    fun int skip()
    { return limit(last + random.w_choice(skipchance)); }
    
    fun int lemming()
    {
        if (random.rand()<plemming)
            -1 *=> direction;
        return limit(last + direction);
    }
    
    fun int randi()
    {
        return random.rv(0,max-1);
    }
    
    fun int serial()
    {
        if (serie2.size() == 0)
        { 
            changeSerie(); 
            serie2.set(serie.toArray());
        }
        else
        { return limit(serie2.takeRand()); }        
    }
        
    fun void makeSerie(int amount)
    {
        Clist source;
        source.range(0,max,1);
        source.shuffle();
        source.crop(0,amount);
        serie.set(source.toArray());
    }
    
    fun void changeSerie()
    {
        random.rv(0,3) => int choice;
        if (choice==0)
            serie.reverse();
        if (choice==1)
            serie.invert();
        if (choice==2)
        {
            serie.invert();
            serie.reverse();
        }
        if (choice==3)
        {
            serie.shuffle();
        }
    }
            
    
    fun int grouprep()
    {
        if (repcount == 0)
        { 
            random.w_choice(whichrepw) => last;
            random.w_choice(nrepw) => repcount;
        }
        repcount--;
        return limit(last);
    }
    
    fun int walk()
    {
        return limit(last + random.choice(walksteps));
    }  
    
    fun int mutate()
    {
        if (mutateT == 0)
        {
            mutateList.sv(Std.rand2(0,mutateSize-1),Std.rand2(0,max));
            Std.rand2(minMutateT,maxMutateT) => mutateT;
        }
        mutateT--;
        (point + 1) % mutateSize => point;
        return mutateList.get(point);    
    }
}
        
   