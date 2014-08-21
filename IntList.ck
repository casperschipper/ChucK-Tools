class List {
    int values[0];
    int links[0];
    int last;
    int start;
    int size;
    
    fun void set(int input[]) {
        input.size() => int size => values.size => links.size;
        0 => start; size - 1 => last;
        for (int i;i<size;i++) {
            input[i] => values[i];
            i+1 => links[i];
        }
    }

    fun void insert(int pos,int value) {
        size + 1 => size => values.size => links.size;
        size - 1 => links[pos];
        value => values[size - 1];
        pos => links[size - 1];
    }
    
    fun void append(int value) {
        size + 1 => size => values.size => links.size => last;
        value => values[last];
    }
    
    fun void prepend(int value) {
        size + 1 => size => values.size => links.size;
        value => values[size];
        size => start;
    }
        
    
    fun void print(int num) {
        if (num > values.size()) values.size() => num;
        for (int i;i<num;i++) {
            <<<values[i]>>>;
        }
    }
    
    fun void print() {
        print(values.size());
    }
}

List lijst;

lijst.set([1,2,3,4,5,6]);
lijst.print();
lijst.insert(3,100);
<<<lijst.values[0]>>>;
<<<lijst.values[1]>>>;
<<<lijst.values[2]>>>;