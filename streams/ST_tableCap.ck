public class ST_tableCap extends Stream {
    float tablef[];
    int table[];
    int flag;
    
    fun ST_tableCap init (float arg[]) {
        arg @=> tablef;
        0 => flag;
        return this;
    }
    
    fun ST_tableCap init(int arg[]) {
        1 => flag;
        arg @=> table;
        return this;
    }
    
    fun float next() {
        if (flag) {
            return table.cap() $ float;
        }
        return tablef.cap() $ float;
    }
}