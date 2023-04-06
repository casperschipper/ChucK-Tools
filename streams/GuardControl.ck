/*
 * Guard control
 * Here a value is not tested, there is a control value
 * If the control is true, the funktor can be applied
 */
public class GuardControl extends Guard { 
     // 
     Stream control;
     
     fun Guard init(Stream controlArg,ST_operator funktorArg) {
         controlArg @=> control;
         funktorArg @=> st_funktor;
         return this $ Guard;
     }
     
     fun int test(float in) {
         // notice that in is ignored
         if (control.next() >= 1) {
             return 1;
         }
     }
     
     fun float apply(float in) {
         // if test is true, apply funktor
         return st_funktor.nextCurry(in);
     }
 }