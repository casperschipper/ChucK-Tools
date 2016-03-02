# ChucK-Tools
My tools for chuck, work in progress !

The main point of entry is tools.ck, which should import all the other files.

other important files:
cs.ck contains a lot of little helper functions

st.ck contains stream tools (similar to Supercollider Patterns)

In ceveral files I use some of my own chugins, especially Linseg, so you may need to install/compile them from my chugins repository, or replace the code with something like:

You could also try to construct your own Linseg, since it is basically a just an envelope with constant input 1.0.
