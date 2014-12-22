// Streams Library
// 
// Streams are generators of floats or ints. They only calculate and values when you send them .next().
// This library was designed for doing direct synthesis in chuck.
// With direct synthesis I mean that a ChucK program is directly generating amplitude values sent to the DAC output, 
// instead of controlling uGens like oscillators, buffer playback, noise generators etc...
// If you want to know more, take a look at: Stochastic Synthesis (Xenakis),SSP (G.M. Koenig) and Pile (Paul Berg).
// Although this library is aimed to be used for direct synthesis,
// it could also be useful for granular synthesis or other algorithmic composition purposes.

// All classes start with st.
// For example: st.rv(0,10), returns a stream returning values between 0 and 10.

// all streams generate floats, but you can also ask a stream to return integers by using .nextInt().
// following below are some more example of basic usage, by printing their output to the console.
// for audio examples see Demo2.ck 

20::ms => dur T;

// Example 0:
chout <= "st.st: stream of a constant value\n\n";
st.st(42)
.test(ms,T);

// Example 1:
// rv
chout <= "rv: random value between two values \nst.rv(0,10)\n\n";
st.rv(0,10)
.test(ms,T);

chout <= "seq: go through a sequence of values\nst.seq([10,11,12,13])\n\n";
// Example 2:
// sequence
st.seq([10,11,12,13])
.test(ms,T);

chout <= "seq: seq also accepts a sequence of streams\n st.seq([st.rv(10,11),st.st(19),st.rv(100,200),st.rv(0,1)])\n\n";
// Example 2b:
// sequence of streams
st.seq([st.rv(10,11),st.st(19),st.rv(100,200),st.rv(0,1)])
.test(ms,T);

chout <= "timed: sample and hold \n st.timed(st.rv(0,10),st.st(0.01))\n\n";
// Example 3:
// timed values, Stream/value , Time distance between
// so underlying is a random value between 3.0 and 4.0 updated every 0.3 seconds
st.timed(st.seq([0.0,100]),st.st(0.01))
.testInt(ms,T);

// Example 4:
// linearly interpolated values
chout <= "sequence: an interpolated line st.line(st.seq([0.0,1.0]),st.st(.01))\n\n";
st.line(st.seq([0.0,1.0]),st.st(.01)).test(ms,T);

// Example 4:
// combination of streams:
st.rv( st.line(st.seq([0.0,100.0]),st.st(0.020))  ,  0  )
.testInt(ms,T);


