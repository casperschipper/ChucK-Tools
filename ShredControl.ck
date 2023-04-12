class Shreds {
    int shred_ids[0];
    
    fun int remove(int shred) {
        shred_ids.cap() => int size;
        if (size == 0) {
            return 0;
        }
        int result[size];
        int j;
        for (0 => int i;i<size;i++) {
            if (shred_ids[i] == shred) {
                result.size(size-1);
                i + 1 => i;
                <<<i,shred_ids[i]>>>;
            }
            shred_ids[i] => result[j];
            j++;
        }
        result @=> shred_ids;
        return 1;
    }
    
    
    fun void print() {
        <<<"print", shred_ids.cap()>>>;
        for (0 => int i;i<shred_ids.cap();i++) {
            chout <= i <= " " <= shred_ids[i] <= IO.newline();
        }
    }
    
    fun void add (int shred) {
        shred_ids.cap() => int size;
        if (size == 0) {
            [shred] @=> shred_ids;
            return;
        }
        int result[size+1];
        0 => int j;
        0 => int done;
        for (0 => int i;i<size;i++) {
            if (shred > this.shred_ids[i] && !done) {
                shred => result[j];
                j++;
                1 => done;
            }
            //<<<"***",i,j,shred_ids.cap(),result.cap()>>>;
            this.shred_ids[i] => result[j];
            j++;
        }
        result @=> this.shred_ids;
    }
}

Shreds shreds;

shreds.add(-1);
shreds.add(10);
shreds.add(41);
shreds.add(55);
shreds.remove(-1);
shreds.remove(55);
shreds.add(76);
shreds.add(42);


shreds.print();

