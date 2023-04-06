class ST_updatingStream extends Stream {
    /* 
    this is a template to be subclassed
    update gets called controlled by timer 
    */
    
    Stream @ _timer;
    
    int loop;
    
    second => dur _timeStep;
    
    fun UpdatingStream timer(Stream arg) {
        timer @=> _timer;
        return this;
    }
    
    fun UpdatingStream init(Stream arg) {
        timer(arg);
        spork ~ play(); 
        return this;
    }
    
    fun void play() {
        true => loop;
        while(loop) {
            _timer.next() * _timeStep => now;
            update();
        }
    }
    
    fun void stop() {
        false => loop;
    }
    
    fun void update() {
        // do something here
    }
    
    fun float next() {
        return 0.0;
    }
}