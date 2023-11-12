public class ST_slide extends Stream {
    Stream st_input;
    Stream st_upslide;
    Stream st_downslide;
    
    0 => float y1;
    
    fun float safe(float x) {
        if (x == 0) {
            return 0.0000001;
        }
        return x;
    }
   
    fun float next() {
        // y (n) = y (n-1) + ((x (n) - y (n-1))/slide).
        st_input.next() => float x;
        
        (x - y1) => float delta;
        
        float step;
        if (delta > 0) {
            delta / st_upslide.next() => step;
        } else {
            delta / st_downslide.next() => step;
        }
        
        y1 + step => float y;
        y => y1;
        return y;
    }
    
    fun ST_slide init ( Stream input, Stream up, Stream down ) {
        input @=> this.st_input;
        up @=> this.st_upslide;
        down @=> this.st_downslide;
        return this;
    }
    
}


        