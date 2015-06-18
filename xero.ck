public class xero {
    float previous;
    
    fun int xero (float input) {
        if ((previous > 0) && (input < 0)) { 
            input => previous;
            return -1; 
            }
        else if ((previous < 0) && (input > 0)) { 
            input => previous;
            return 1; 
            }
        else { 
            input => previous;
            return 0;
        }
    }
}
        