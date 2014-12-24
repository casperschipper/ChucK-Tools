ST_walkList walk;

walk.init([st.st(10),st.rv(40,34),st.line(st.seq([40,50]),st.rv(0,1))],st.t(st.seq([-1.,1]),st.rv(0,st.line(st.rv(0,1),st.rv(1,3))))) @=> Stream pitch;
walk.init([st.st(10),st.rv(40,34),st.line(st.seq([40,50]),st.rv(0,1))],st.t(st.seq([-1.,1]),st.rv(0,st.line(st.rv(0,1),st.rv(1,3))))) @=> Stream timer;


SinOsc c  => dac;
while(1) {
    pitch.next() + 50 => Std.mtof => c.freq;
    timer.next()*samp => now;
}

