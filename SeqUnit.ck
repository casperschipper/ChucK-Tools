public class SeqUnit
{
    CRandom random;
    
    random.seed();
    
    "normal" => string state;
    0 => int last;
    7 => int max;
    0 => int min;
    
    // lemmingvars
    1 => int direction;
    .1 => float plemming;
    
    // grouprep vars
    [[0,1],[1,1],[2,1],[3,1],[4,1],[5,1],[6,1],[7,1]] @=> int whichrepw[][];
    [[1,1],[5,1],[20,1],[500,1]] @=> int nrepw[][];
    int repcount;
    
    // skip
    [[1,10],[3,1],[5,1]] @=> int skipchance[][];
    
    // mutate params
    4 => int mutateSize;
    int mutateT;
    Clist mutateList;
    10 => int minMutateT;
    100 => int maxMutateT;
    int point;
    
    init();
    
    // serial array
    Clist serie,serie2;
    //makeSerie(7);
    serie2.set(serie.toArray());
    
    //Pattern 
    int offset;
    int index;
    int patArray[max];
    
    
    // walk
    [-1,1] @=> int walksteps[];
    
    // thrill
    int tdirection;
    
    // slemming
    int wavesize,slemcount;
    
    // magnet
    float force;
    int trystep;
    
    //select
    int selectArray[];
    int selectSize;
    int idx;
    
    //Clusters
    int center;
    int count;
    4 => int num_per;
    1 => int dev;
    
    // loop
    int current;
    int innerloops;
    int outerloops;
    int loopoffset;
    int loopsize;
    int innerweights[][];
    int outerweights[][];
    
    fun void init()
    {
        initMutate();
    }
    
    fun void initMutate()
    {
        mutateList.fillRand(min,max,mutateSize);
    }
    
    fun int next()
    {
        if (state == "normal") //0
            return normal() => last;
        else if (state == "lemming") //1
            return lemming() => last;
        else if (state == "grouprep") //2
            return grouprep2() => last;
        else if (state == "serial") //3
            return serial() => last;  
        else if (state == "randi") //4
            return randi() => last;
        else if (state == "walk")   //5
            return walk() => last;  
        else if (state == "mutate") //6
            return mutate() => last;  
        else if (state == "skip")    //7
            return skip() => last;
        else if (state == "pattern")  //8
            return pattern() => last;
        else if (state == "turn")     //9
            return turn() => last;
        else if (state == "slemming") //10
            return slemming() => last;
        else if (state == "select") 
            return select() => last; //11
        else if (state == "sequence")
            return sequence() => last;
        else if (state == "grouprep2") 
            return grouprep2() => last;
        else if (state == "clusters") 
            return clusters() => last;
        else {
            return normal() => last;
            <<<"this seqtype does not exist :",state>>>;
        }
        return normal() => last;
    }
    
    fun void setStateNumber(int nr)
    {
        (["grouprep","normal","lemming","mutate","walk","randi","skip","pattern","turn","slemming","select","sequence"])[nr] => state;
    }
    
    fun void randomChange()
    {
        setStateNumber( random.rv(0,11) );
    }
    
    fun int limit(int x)
    { 
        if (min == max) return min;
        while (x < min) {
                Std.abs(max - min) +=> x;   
            }
        return x % max;
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
        return limit(random.rv(min,max));
    }
    
    fun int serial()
    {
        if (serie2.size() == 0)
        { 
            changeSerie(); 
            serie2.set(serie.toArray());
        }
        return limit(serie2.takeRand());
    }
    
    fun void prepareloops() 
    {
        random.w_choice(innerweights) => innerloops;
        random.w_choice(outerweights) => outerloops;
        cs.rv(min,max) => loopoffset;
    }
        
    fun void makeSerie(int amount)
    {
        Clist source;
        source.range(min,max,1);
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
    
    fun int grouprep2() {
        if (repcount == 0) 
        {
            Std.rand2(min,max) => last;
            random.w_choice(nrepw) => repcount;
        }
        repcount--;
        return limit(last);
    }
    
    fun int walk()
    {
        return limit(last + random.choice(walksteps));
    }  
    
    fun int pattern()
    {
        if (index > patArray.size()-1) {
            random.rv(min,max) => offset;
            0 => index;
        }
        return limit(patArray[index++] + offset);
    }  
    
    fun int turn() {
        if (last > (max-1)) 
            0 => tdirection;
        if (last < 1) 
            1 => tdirection;
        if (tdirection == 0) 
            return last - 1;
        else 
            return last + 1;
    }


    fun int mutate()
    {
        if (mutateT == 0)
        {
            mutateList.sv(Std.rand2(0,mutateSize-1),Std.rand2(min,max));
            Std.rand2(minMutateT,maxMutateT) => mutateT;
        }
        mutateT--;
        (point + 1) % mutateSize => point;
        return limit(mutateList.get(point));     
    }
    
    fun int slemming() {
        if (slemcount <= 0) {
            wavesize => slemcount;
            if (random.rvf(0.,1.) < plemming) 
                direction * -1 => direction;
        }
        slemcount--;
        return limit(last + (1 * direction));
    }
    
    fun void initSelect(int select[]) {
        select @=> selectArray;
        selectArray.size() => selectSize;
    }
    
    fun int select() {
        return selectArray[Std.rand2(0,selectSize-1)]; 
    }
    
    fun int sequence() {
        if (idx >= selectArray.size()) 
            {<<<"klaar">>>;me.exit;
        }
        return selectArray[idx++];
    }
    
    fun int clusters() {
        if (count <= 0) {
            num_per => count;
            Std.rand2(min,max) => center;
        }
        count--;
        return limit(Std.rand2(-dev,dev) + center);     
    }
}
        
   