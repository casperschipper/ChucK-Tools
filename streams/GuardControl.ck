/*
 * Guard control
 * Here a value is not tested, there is a control value
 * If the control is true, the funktor can be applied
 */
class GuardControl extends Guard { 
     // 
     Stream control;
     
     fun Guard init(Stream controlArg,ST_operator funktorArg) {
         controlArg @=> control;
         funktorArg @=> st_funktor;
         return this;
     }
     
     fun int test(float in) {
         if (control.next() > 0) {
             return 1;
         }
     }
     
     fun float apply(float in) {
         // if test is true, apply funktor
         return st_funktor.nextCurry(in);
     }
 }