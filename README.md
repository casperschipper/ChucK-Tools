# ChucK-Tools

My tools for chuck, work in progress !

The main point of entry is tools.ck, which should import all the other files.

other important files:
cs.ck contains a lot of little helper functions

st.ck contains stream tools (similar to Supercollider Patterns). 
This is actually the part I use most.

In several files I use some of my own chugins, especially Linseg and Buffer, so you will need to install/compile them from my chugins repository : https://github.com/casperschipper/chugins-2019.
You can also make your own Chugen version of linseg, since it is identical to:

    class Linseg extends Chubgraph {
      Step unit => Envelope env => Outlet out;
      1 => unit.next;
      
      fun void target(float x) {
        env.target;
      }
      
      fun void duration(dur dura) {
        env.duration;
      }
    } 
