public class ST_weightStream extends Stream {
    // a weighted choice stream with streams as parameters (either as the choice stockpile, or as weights)

    ST_weights indexer;

    null @=> Stream @ st_sequence[];
    null @=> Stream @ st_weights[];
    float _sequence[];

    fun ST_weightStream init(Stream arg[],int warg[]) {
        if (arg.cap() != warg.cap()) {
            <<<"weighted stream error: size of arguments is not the same",this>>>;
            return this;
        }
        values(arg);
        weights(warg);        
        return this;
    }
    
    fun ST_weightStream init(Stream arg[],float warg[]) {
        if (arg.cap() != warg.cap()) {
            <<<"weighted stream error: size of arguments is not the same",this>>>;
            return this;
        }
        values(arg);
        weights(warg);        
        return this;
    }

    fun ST_weightStream init(Stream arg[],Stream warg[]) {
        if (arg.cap() != warg.cap()) {
            <<<"weighted stream error: size of arguments is not the same",this>>>;
            return this;
        }
        values(arg);
        weights(warg);        
        return this;
    }

    fun ST_weightStream init(int arg[],Stream warg[]) {
        if (arg.cap() != warg.cap()) {
            <<<"weighted stream error: size of arguments is not the same",this>>>;
            return this;
        }
        values(arg);
        weights(warg);        
        return this;
    }
    
    fun ST_weightStream init(float arg[],Stream warg[]) {
        if (arg.cap() != warg.cap()) {
            <<<"weighted stream error: size of arguments is not the same",this>>>;
            return this;
        }
        values(arg);
        weights(warg);        
        return this;
    }

    fun ST_weightStream values(Stream arg[]) {
        arg @=> st_sequence;
        return this;
    }

    fun ST_weightStream values(float arg[]) {
        null @=> st_sequence;
        arg @=> _sequence;
        return this;
    }

    fun ST_weightStream values(int arg[]) {
        null @=> st_sequence;
        cs.int2float(arg) @=> _sequence;
        return this;
    }

    fun ST_weightStream weights(int intArg[]) {
        cs.int2float(intArg) @=> float arg[];
        float params[arg.cap()][2];
        for (int i;i<arg.cap();i++) {
            i => params[i][0];
            arg[i] => params[i][1];
        }
        indexer.weights(params);
        null @=> st_weights;
        return this;
    }

    fun ST_weightStream weights(float arg[]) {
        float params[arg.cap()][2];
        for (int i;i<arg.cap();i++) {
            i => params[i][0];
            arg[i] => params[i][1];
        }
        indexer.weights(params);
        null @=> st_weights;
        return this;
    }

    fun ST_weightStream weights(Stream arg[]) {
        // initial setting, need to call all the streams:
        float params[arg.cap()][2];
        for (int i;i<arg.cap();i++) {
            i => params[i][0];
            arg[i].next() => params[i][1];
        }
        indexer.weights(params);
        arg @=> st_weights;
        return this;
    }

    fun float next() {
        float result;
        
        if (st_sequence != null) {
            st_sequence[index].next() => result;
        } else {
            _sequence[index] => result;
        }

        updateIndex();
        
        return result;
    }

    fun void updateIndex() {
        if (st_weights != null) {
            for (int i;i<st_weights.cap();i++) {
                st_weights[i].next() => indexer._weights[i][1];
            }
        }
        if (st_sequence != null) {
            if (st_sequence[index].more()) {
                index;
            } else {
                Math.floor(indexer.next()) $ int => index;
            }
        } else {
            Math.floor(indexer.next()) $ int => index;
        }
    }
}

