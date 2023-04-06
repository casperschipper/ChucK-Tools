class ST_funk extends ST_stream {
    Stream input;
    
    fun ST_funk init( Stream arg ) {
        arg @=> input;
        return this;
    }
 
    fun float next() {
        // return doSomething(input.next());
        return input.next();
    }
}