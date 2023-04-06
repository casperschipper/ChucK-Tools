class HidDecoder {
    fun int translate (int char) {
        if (tmp >= 97 && tmp <= 122) { // a..z
            return tmp - 93;
        }
        if (tmp == 48) { // 0 
            return 39;
        } 
        if (tmp >= 49 && tmp <= 57) { // 1..9
            return tmp - 19;
        }
    }
    
    fun int [] decode(string str) {
        int result[ str.length() ];
        for (int i;i<str.length();i++) {
            str.charAt => translate => result[i];
        }
        return result[i];
    }
}
    
    