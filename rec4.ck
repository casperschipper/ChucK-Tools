// chuck this with other shreds to record to file
// example> chuck foo.ck bar.ck rec (see also rec2.ck)

// arguments: rec:<filename>

// get name
me.arg(0) => string filename;
if( filename.length() == 0 ) "foo.wav" => filename;

// pull samples from the dac
dac.chan(0) => Gain g1 => WvOut c1 => blackhole;
dac.chan(1) => Gain g2 => WvOut c2 => blackhole;
dac.chan(2) => Gain g3 => WvOut c3 => blackhole;
dac.chan(3) => Gain g4 => WvOut c4 => blackhole;

// this is the output file name
filename + "FL" => c1.wavFilename;
filename + "FR" => c2.wavFilename;
filename + "BL" => c3.wavFilename;
filename + "BR" => c4.wavFilename;

<<<"writing to file:", "'" + c1.filename() + "'">>>;
// any gain you want for the output
.5 => g1.gain;
.5 => g2.gain;
.5 => g3.gain;
.5 => g4.gain;

// infinite time loop...
// ctrl-c will stop it, or modify to desired duration
while( true ) 1::second => now;
