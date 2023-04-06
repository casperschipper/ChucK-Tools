static class ST_tableCap extends Stream {
    float table[];
    fun ST_tableCap(float arg[]) {
        return table @=> table;
    }
    
    fun float next() {
        return table.cap();
    }
}