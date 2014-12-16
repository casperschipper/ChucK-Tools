// these ST_... classes are a way to make non-standard-synthesis easier in ChucK.
// ST_ concept is similar to Patterns/Streams in Supercollider, but aimed to be used at sample rate.
// Some of my design aims:
// - short expressive code, a minimalist syntax.
// - modularity: any parameter of a Stream can be controlled by another Stream.
// - extensibility/customisation: classes are designed to be subclassed.
// - where possible, CPU efficiency.

20::ms => dur T;

// Example 0:
chout <= "st.st: stream of a constant value\n\n";
st.st(42)
.test(ms,T);

// Example 1:
// rv
chout <= "rv: random value between zero and 10\nst.rv(0,10)\n\n";
st.rv(0,10)
.test(ms,T);

chout <= "seq: go through a sequence of values\nst.seq([10,11,12,13])\n\n";
// Example 2:
// sequence
st.seq([10,11,12,13])
.test(ms,T);

chout <= "timed: sample and hold\nst.timed(st.rv(0,10),st.st(0.01))\n\n";
// Example 3:
// timed values, Stream/value , Time distance between
// so underlying is a random value between 3.0 and 4.0 updated every 0.3 seconds
st.timed(st.seq([0.0,100]),st.st(0.01))
.testInt(ms,T);

// Example 4:
// linearly interpolated values
chout <= "sequence: sample\n\n";
st.line(st.seq([0.0,1.0]),st.st(.01)).test(1*ms,10*T);


