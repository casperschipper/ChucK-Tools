// draft !

class ST_sine extends Stream {
    Stream @ st_phase;
    
    2.0 * pi => float twopi;
    
    fun float next() {
        return Math.sin(st_phase.next() * twopi);
    }
    
    fun ST_sine init(Stream arg) {
        arg @=> st_phase;
        return this;
    }
}
