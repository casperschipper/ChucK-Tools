public class ST_mupWalk extends ST_walk {  
    fun float next() {
        if (st_step != null) {
            st_step.next() => step;
        }
        step * value => value;
        wrap();
        return value;
    }
}
