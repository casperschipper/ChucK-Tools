.1 => float maxT;

st.index([
	st.timed(st.rv(-1,1),st.rv(0,maxT)).st(),
	st.timed(st.rv(-1,1),st.rv(0,maxT)),
	st.timed(st.rv(-1,1),st.rv(0,maxT)),
	st.timed(st.rv(-1,1),st.rv(0,maxT))
	],st.count(3)
	) @=> Stream @ amp;

st.index([
	st.timed(st.rv(1,4),st.rv(0,maxT)).st(),
	st.timed(st.rv(1,4),st.rv(0,maxT)),
	st.timed(st.rv(1,4),st.rv(0,maxT)),
	st.timed(st.rv(1,4),st.rv(0,maxT))
	],st.count(3)
	) @=> Stream @ ts;

StepSynth synth => Clip c => dac;

synth.init(amp,ts);

minute => now;
