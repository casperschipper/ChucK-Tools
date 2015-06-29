fun int quickSort(int arr[], int elements)
{    
    1000 => int MAX_LEVELS;
    
    int  piv, i, L, R ;
    int beg[MAX_LEVELS];
    int end[MAX_LEVELS];
    0 => i;
    0 => beg[0]; elements => end[0];
    while (i>=0) 
        {
        beg[i]=>L;
        end[i]-1=>R;
        if (L<R) 
            {
            arr[L] => piv; 
            if (i==MAX_LEVELS-1) return 0;
            while (L<R) 
                {
                while (arr[R]>=piv && L<R) R--; 
                if (L<R) arr[R] => arr[L++];
                while (arr[L]<=piv && L<R) L++; 
                if (L<R) arr[L] => arr[R--]; 
                }
            piv=>arr[L]; 
            L+1=>beg[i+1]; 
            end[i]=>end[i+1]; 
            L=>end[i++]; 
            }
         else 
         { i--;}
    }
    return 1; 
}