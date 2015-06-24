class symList extends Clist
{
    int procedure[];
    int step;
    Clist temp;
    
    fun void setProcedure(int prc[]) {
        prc @=> procedure;
    }
    
    fun void nextIter() {
        if (step > (procedure.size()-1))
            <<<"procedure is finished">>>;
        return null;
        if (procedure[step]) == 0) addSelf();
        if (procedure[step]) == 1) addReverse();
        if (procedure[step]) == 2) addInvert();
        if (procedure[step]) == 3) addCrab();
        
        
    fun void addReverse() {
        dupl() @=> temp;
        temp.reverse();
        addAll(temp);
    }
    
    fun void addInvert() {
        dupl() @=> temp;
        temp.invert();
        addAll(temp);
    }
    
    fun void addCrab() {
        dupl() @=> temp;
        temp.invert();temp.reverse();
        addAll(temp);
    }
    
    fun void addSelf() {
        dupl() @=> temp;
        addAll(temp);
    }
    
    fun void transp
    
    