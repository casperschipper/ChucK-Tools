/*


  0 1 2   3 4 5   6 7 8

0.  1.      2.      3.   
1
2

3
4.   4       5.     6. 
5

6
7.   7.      8.     9.
8
*/

class SudokuSet {
    // class to represent multiple canidates in one object
    // using a bitmask, 1 = 1 , 2 = 2, 5 = 1 and 3, 23 = 1, 2 and 5 etc..
    511 => int value;
    
    fun static SudokuSet [] cloneAll(SudokuSet source[]) {
        SudokuSet result[0];
        for (int i;i<source.cap();i++) {
            result << source[i].clone();
        }
        return result;
    }
    
    fun int contains(int arg) {
        return value & (1 << (arg-1));
    }
    
    fun SudokuSet union (SudokuSet arg) { // find common values between two sets.
        SudokuSet result;
        this.value & arg.value => result.value;
        return result;
    }
    
    fun int count() { // counts set bits!
        return cs.countSetBits(value);
    }
    
    fun int eval() {
        [1,2,4,8,16,32,64,128,256] @=> int table[];
        // if only a single canidate remains, it has a value
        for (int i;i<9;i++) {
            if (value == table[i]) {
                return i + 1;
            }
        }
        // no value yet, return -1
        return -1;
    }
    
   
    fun int insert(int arg) { // arg is single number to be added !
        value | (1 << (arg-1)) => value;
    }
    
    fun int remove(SudokuSet arg) { // from possiblities, remove the ones that are in the other.
        value & ~arg.value => value;
    }
    
    fun int remove(int arg) { // remove number
        value ^ (1 << arg);
    }
    
    fun void printBinary() { // print the binarynumbers
        cs.print(cs.int2binary(value));
    }
    
    fun void print() { // convert mask to actual numbers
        int result[0];
        for (1 => int i;i<10;i++) {
            <<<i>>>;
            if (contains(i)) {
                result << i;
            }
        }
        cs.print(result);
    }
}

class SudokuSetFilter {
    fun int test (SudokuSet arg) {
        return (arg != null);
    }
    
    fun SudokuSet [] filter (SudokuSet sets[]) {
        SudokuSet result[0];
        for (int i;i<sets.cap();i++) {
            if ( test(sets[i]) ) {
                result << sets[i];
            }
        }
        return result;
    }
}

class CountCandidates extends SudokuSetFilter {
    2 => int N;

    fun CountCandidates setN(int arg) {
        arg => N;
        return this;
    }

    fun int test(SudokuSet arg) {
        return arg.count == N;
    }
}

class SetHasValue extends SudokuSetFilter {
    fun int test(SudokuSet arg) {
        return arg.value() != -1;
    }
}

class SetsAreEqual extends SudokuSetFilter {
    SudokuSet value;

    fun SetsAreEqual setValue(SudokuSet arg) {
        arg @=> value;
        return this;
    }

    fun int test(SudokuSet arg) {
        if (value.value == arg.value) {
            return true;
        }
        return false;
    }
}

class SudokuCell {
    -1 => int value; // -1 is empty
    SudokuSet candidates;
    Sudoku @ parent;
    int row;
    int col;
    int block;
    
    fun SudokuCell clone() {
        return (new SudokuCell).init(row,col);
    }        
        
    fun SudokuCell init(int rowArg,int colArg) {
        rowArg => row;
        colArg => col;
        getGroup(row,col) => block;
        return this;
    }
    
    fun int calcCandidates () {
        parent.checkRow(row) @=> SudokuSet rowResult;
        parent.checkCol(col) @=> SudokuSet colResult;
        parent.checkBlock(block) @=> SudokuSet blockResult;
        // combine the results
        (rowResult.union(colResult)).union(blockResult) @=> candidates;
        // try to eval:
        candidates.eval() => value; 
    }
    
    fun int getGroup(int rowIndex,int colIndex) {
        return ((Math.floor(colIndex/3.0) * 3) + (rowIndex / 3)) $ int;
    }
}

class SudokuGroup {
    // a group of cells related to each other, like a row, col or block
    // also called a "house" sometimes
    // within a house, numbers may only appear once.
    SudokuCell members[0];

    fun SudokuGroup addCell(SudokuCell arg) {
        members << arg;
        return this;
    }

    // find options left open in this group
    fun SudokuSet findCandidates() {
        SudokuSet result; // inits with all values;
        for (int i;i<members.cap();i++) {
            if (members[i].value > 0) {
                // remove any number used already:
                result.remove(members[i].value);
            }
        }
        return result; // these are options that are left
    }           
    
    fun SudokuSet findCookGroups() {
        // first create a copy of members:
        SudokuSet.cloneAll(members) @=> SudokuSet tmp[];
        (new SetHasValue).filter(tmp) @=> tmp;
        (new CountCandidates).setN(2).filter(tmp) @=> SudokuSet duo[];

    }
}

class SudokuPrinter {
    fun string line() {
        chout <= "+---+---+---+" <= IO.newline();
    }
    
    fun void print(SudokuCell cells[]) {
        for (int i;i<cells.cap();i++) {
            (i % 9) => int column;
            Math.floor(i / 9) $ int => int row;
            if ((row%3) == 0 && (column == 0)) {
                line();
            }
            if ((column%3) == 0) {
                chout <= "|";
            }
            chout <= cells[i].value;      
            if (column == 8) {
                chout <= "|" <= IO.newline();
            }          
        }  
        line();
    }   
}



class Sudoku {
    SudokuCell cells[81];
    SudokuGroup rows[9];
    SudokuGroup collumns[9];
    SudokuGroup blocks[9];
    
    fun Sudoku init(int values[]) {
        if (values.size() != 81) {
            <<<"init array is not size 81, but "+values.size()>>>;
            return null;
        } 
        for (int i;i<values.cap();i++) {
            values[i] => cells[i].value;
            this @=> cells[i].parent;
        }
        return this;
    }
    
    fun void formGroups() {
        for (int row;row<9;row++) {
            for (int col;col<9;col++) {
                // init cell
                 cells[(row*9)+col].init(row,col) @=> SudokuCell @ newCell;
                 // cell knows to which group it belongs:
                 rows[newCell.row].addCell( newCell );
                 collumns[newCell.col].addCell( newCell );
                 blocks[newCell.block].addCell( newCell );
            }
        }
    }
                     
    fun SudokuSet checkRow( int rowArg ) {  
        return rows[rowArg].findCandidates();         
    }
    
    fun SudokuSet checkCol( int colArg ) {
        return collumns[colArg].findCandidates();
    }
    
    fun SudokuSet checkBlock( int blockArg ) {
        return blocks[blockArg].findCandidates();
    }
}

Sudoku foo;

foo.init([1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9]);

SudokuPrinter bar;
bar.print(foo.cells);

