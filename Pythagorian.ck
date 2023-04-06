220 => float freq;

float freqList[12];
float scale[12];
float deviation[12];

for (int i;i<12;i++) {
    <<<freq>>>;
    freq => freqList[i];
    freq * 3.0/2.0 => freq;
    while(freq > 440) {
        freq * 0.5 => freq;
    }
    220 * Math.pow(2.0,((i $ float)/12.0)) => scale[i];
}

cs.quickSortF(freqList,12);

for (int i;i<12;i++) {
    cs.rtom(freqList[i] / scale[i]) => deviation[i];
}

cs.printf(freqList);
cs.printf(scale);
cs.printf(deviation);