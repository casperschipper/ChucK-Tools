public class ST_div extends ST_operator 
{
    "ST_div" @=> _type;
    
    fun float next() {
        if (st_v1 != null) st_v1.next() => v1;
        if (st_v2 != null) st_v2.next() => v2;
        return v1 / v2;
    }
}