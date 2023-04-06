// Audio examples


LineSynth synth => Clip c => dac;

st.st(1) @=> Stream @ timeStream;

synth.init(st.seq([-1,1]),st.t(st.rv(2,20),st.st(.12)));

minute => now;