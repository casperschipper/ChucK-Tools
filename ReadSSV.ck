public class ReadSSV {   // space seperated value files !
    FileIO fio;
    
    fun ReadSSV fileName (string name) {
        fio.open(name,FileIO.READ);
        
        if( !fio.good() )
        {
            cherr <= "can't open file: " <= name <= " for reading..."
            <= IO.newline();
            me.exit();
        }
    }
   
   
   fun string nextLine() {
       if (fio.more()) {
           return fio.readLine();          
       }
   }
   
   fun float [] nextLineSplitFloats() {
       StringTokenizer tok;
       
       float result[1];
       
       int count;
       string token;

       if (fio.more()) {
           tok.set(fio.readLine());
           while(tok.more()) {
               // print
               tok.next() @=> token;
               if ((token == ";") || (token == ",")) {
                   // ignore
               } else {
                   result.size(count+1);
                   Std.atof(token) => result[count];
                   count++;
               }
           }
           return result;
       }
   }
}
 
  
           
    