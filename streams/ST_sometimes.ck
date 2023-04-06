public class ST_sometimes extends Stream {
    float x,y;
    int p;
    null @=> Stream @ st_p;
    
    fun float next() {
        if (st_p != null) { 
            Math.ceil( st_p.next() )  $ int => p;
        }
        if (Math.random2(0,p) == 0) {
            return x;
        }
        return y;
    }
    
    fun void init ( float x, float y, float p ) {
        x => this.x;
        y => this.y;
        Math.ceil(p-1) $ int => this.p;
        null @=> this.st_p;
    }
    
    fun void init ( float x, float y, Stream p) {
        x => this.x;
        y => this.y;
        p @=> st_p;
    }        
}
