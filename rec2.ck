// chuck this with other shreds to record to file
// example> chuck foo.ck bar.ck rec (see also rec2.ck)

// arguments: rec:<filename>

// get name
me.arg(0) => string filename;
if( filename.length() == 0 ) "PulseRec" => filename;

// pull samples from the dac
dac.chan(0) => Gain g1 => WvOut w1 => blackhole;
dac.chan(1) => Gain g2 => WvOut w2 => blackhole;
// this is the output file name
filename + "L" => w1.wavFilename;
filename + "R" => w2.wavFilename;

<<<"writing to file:", "'" + w1.filename() + "'", "and '" + w2.filename() + "'">>>;
// any gain you want for the output
.5 => g1.gain => g2.gain;

// infinite time loop...
// ctrl-c will stop it, or modify to desired duration
while( true ) 1::second => now;
