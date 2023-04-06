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
dac.chan(4) => Gain g5 => WvOut c5 => blackhole;
dac.chan(5) => Gain g6 => WvOut c6 => blackhole;
dac.chan(6) => Gain g7 => WvOut c7 => blackhole;
dac.chan(7) => Gain g8 => WvOut c8 => blackhole;

// this is the output file name
filename + "_1" => c1.wavFilename;
filename + "_2" => c2.wavFilename;
filename + "_3" => c3.wavFilename;
filename + "_4" => c4.wavFilename;
filename + "_5" => c5.wavFilename;
filename + "_6" => c6.wavFilename;
filename + "_7" => c7.wavFilename;
filename + "_8" => c8.wavFilename;

<<<"writing to file:", "'" + c1.filename() + "'">>>;
// any gain you want for the output
.5 => g1.gain;
.5 => g2.gain;
.5 => g3.gain;
.5 => g4.gain;
.5 => g5.gain;
.5 => g6.gain;
.5 => g7.gain;
.5 => g8.gain;

// infinite time loop...
// ctrl-c will stop it, or modify to desired duration
while( true ) 1::second => now;
