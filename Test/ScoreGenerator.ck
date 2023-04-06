class CsoundScore {
    String fileName = "chuckScore.sco";
   
    Stream instrument;
    Stream timer;
    Stream duration;
    Stream args[];
    
    float length;
    time then;
    
    fun void init (string filename
    , Stream instrument
    , Stream timer
    , Stream duration
    , Stream args[]
    , float endTime ) { // the time to stop generating
        filename => this.fileName;
        timer @=> this.timer;
        duration @=> this.duration;
        args @=> this.args;
        now => then;
    }
    
    fun void generateScore () {
        while ((now - then) / second > length) {
            generateLines();
        }
    }
        
       