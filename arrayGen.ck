public class arrayGen
{
    fun int[] clusters(int amount,int low,int high,int num_per,int dev) {
        int output[amount];
        int center;
        int count;
        for (int i;i<amount;i++) {
            if (count == 0) {
                num_per => count;
                Std.rand2(low,high) => center;
            }
            Std.rand2(-dev,dev) + center => output[i];
            count--;
        }
        return output;
    }
}
            