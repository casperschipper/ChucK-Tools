//
// Basic midi wrapper class. This will act as a wrapper for the MidiOut
// object to provide all the functionality I want to do more usefriendly
// MIDI handling in ChucK
//
// Bruce Murphy
// rattus.net, July 2006.
//
// Current version: alpha-31july2006


public class MIDIsender
{
    MidiOut midiport;
    MidiMsg midimessage;
    
    // so we don't have to distinguish external from internal
    // channels, we'll keep this in the people friendly 1-16 format
    1 => int default_channel;
    
    // this will be used for our notecounting. We'll turn notecounting on by
    // default for now.
    // Note that we have to do it per channel.
    int notecount[16][128];
1=> int countingp;

// internally generated MIDI streams will have this spacing to avoid crashing
// older hardware.
5::ms => dur midigap;

// direct wrapper to the midiport's open function.
fun int open(int portid)
{
    return midiport.open(portid);
}

// This is new. Try to open a MIDI port by finding one whose "name" matches
// the passed-in string.
//
// This is not efficient by a long stretch. Returns 0 on failure 1 on success.
fun int open(string portname)
{
    int portret;
    0 => int portnum;
    
    while(1) {
        midiport.open(portnum) => portret;
        if (!portret) {
            <<< "No matching port found" >>>;
            return 0;
        }
        if (midiport.name() == portname) {
            return 1;
        } 
        portnum++;
    }
}

// sets the default channel for polymorphic functions.
fun void set_channel(int channel)
{
    if (channel < 1 || channel > 16) {
        1 => default_channel;
    } else {
        channel => default_channel;
    }
}

///////////////////
// Utility functions
//
// for notecounting etc.

fun void count_note(int notenum, int channel, int increment)
{
    notenum & 0x7f => notenum;
    (channel - 1) & 0xf => channel;
    increment +=> notecount[channel][notenum]; 
}

// issues noteoffs for all the outstaning notes on a particular channel which 
// this object has sent, but which haven't been called in yet.
//
// as a special case here, if we hand it the channel -1, it will stop the 
// notes for all the channels. Once finished, it will clear the notecount array.
fun void stop_hanging_notes()
{
    stop_hanging_notes(default_channel);
}
fun void stop_hanging_notes(int channel)
{
    if (channel != -1) {
        (channel - 1) & 0xf => channel;
        for (0 => int ii; ii < 128; ii++) {
            if (notecount[channel][ii] > 0) {
                noteoff(ii, channel + 1);
                midigap => now;
            }
        }
    } else { // -1 behavior
        for (0 => int cc; cc < 16; cc++) {
            for (0 => int ii; ii < 128; ii++) {
                if (notecount[cc][ii] > 0) {
                    noteoff(ii, cc + 1);
                    midigap => now;
                }
            }
        }
    }
    
    clear_note_counts(channel);
}
// This just clears the hanging note count arrays. Has the same -1 channel behavior
// as clear_hanging_notes().
fun void clear_note_counts()
{
    clear_note_counts(default_channel);
}

fun void clear_note_counts(int channel)
{
    if (channel != -1) {
        (channel - 1) & 0xf => channel;
        for (0 => int ii; ii < 128; ii++) {
            0 => notecount[channel][ii];
        }
    } else { // -1 behavior
        for (0 => int cc; cc < 16; cc++) {
            for (0 => int ii; ii < 128; ii++) {
                0 => notecount[cc][ii];
            }
        }
    }
    
}


///////////////////
// Interface functions.
//
// These functions map pretty simply onto the MIDI specification messages.


// polymorphic set of functions supplying default values for the MIDI
// noteon() function.
fun void noteon(int notenum)
{
    noteon(notenum, 127, default_channel);
}
fun void noteon(int notenum, int velocity)
{
    noteon(notenum, velocity, default_channel);
}
fun void noteon(int notenum, int velocity, int channel)
{
    send_3bytes(0x9, channel, notenum, velocity);
    
    if (countingp) {
        velocity & 0x7f => velocity;
        if (velocity != 0) {
            count_note(notenum, channel, 1);
        } else {
            count_note(notenum, channel, -1);
        }
        
    }
}

// The basic MIDI noteoff uses noteons with zero velocity.
fun void noteoff(int notenum)
{
    noteon(notenum, 0, default_channel);
}
fun void noteoff(int notenum, int channel)
{
    noteon(notenum, 0, channel);
}

// Some rare synths make use of release velocity. For those we use a different
// MIDI message type.
fun void noteoff_velocity(int notenum, int velocity)
{
    noteoff_velocity(notenum, velocity, default_channel);
}
fun void noteoff_velocity(int notenum, int velocity, int channel)
{
    send_3bytes(0x8, channel, notenum, velocity);
    
    if (countingp) {
        count_note(notenum, channel, -1);
    }
}

// 
// Polyphonic aftertouch message. This controls aftertouch level for individual
// notes.
fun void aftertouch(int notenum, int level)
{
    aftertouch(notenum, level, default_channel);
}
fun void aftertouch(int notenum, int level, int channel)
{
    send_3bytes(0xa, channel, notenum, level);
}


fun void controller(int controllernum, int value)
{
    controller(controllernum, value, default_channel);
}
fun void controller(int controllernum, int value, int channel)
{
    send_3bytes(0xb, channel, controllernum, value);
}

// basic program change functionality. We need to have bank and subbank changes
// available as well, but they're convenience functions.
fun void program_change(int prognum)
{
    program_change(prognum, default_channel);
}
fun void program_change(int program, int channel)
{
    send_2bytes(0xc, channel, program);
}

// channel pressure is what most synths implement to do aftertouch. It isn't
// specific to any one note.
fun void channel_pressure(int pressure)
{
    channel_pressure(pressure, default_channel);
}
fun void channel_pressure(int pressure, int channel)
{
    send_2bytes(0xd, channel, pressure);
}

// pitchbending is actually complicated. We'll take a value of -64 to 63
// for now. This will only send coarse bends, to avoid overwhelming MIDI.
fun void pitchbend(int bend)
{
    pitchbend(bend, default_channel);
}
fun void pitchbend(int bend, int channel)
{
    bend + 64 => bend;
    if (bend > 127) { 127 => bend; }
    
    send_3bytes(0xe, channel, 0, bend);
}
// We'll use these to generate fine bends. Input is a float varying from -1
// to 1.
fun void pitchbend_fine(float bend)
{
    pitchbend_fine(bend, default_channel);
}
fun void pitchbend_fine(float bend, int channel)
{
    ((bend + 1) * 8192) $ int => int bendval;
    if (bendval < 0) {
        0 => bendval;
    }
    if (bendval > 0x3fff) {
        0x3fff => bendval;
    }
    
    send_3bytes(0xe, channel, bendval & 0x7f, (bendval >> 7) & 0x7f);
}

/////////////////////////////
// Convenience functions.
//
// These functions are just calls to the main interface functions with certain
// magic parameters. They are handy to have so you don't have to remember the
// magic parameters.


// This is the MIDI panic message that should turn all MIDI generated notes off
// on the device.
fun void all_notes_off()
{
    all_notes_off(default_channel);
}
fun void all_notes_off(int channel)
{
    controller(123, 0, channel);
}

// Another panic, this one is supposed to kill sound, not just emulate
// note offs and so ignore sustain and long envelopes.
// Less typically implemented.
fun void all_sound_off()
{
    all_sound_off(default_channel);
}
fun void all_sound_off(int channel)
{
    controller(120, 0, channel);
}

// Bank select is magic. Consult synth documentation to figure out which 
// order of bank and program changes your device requires.
//	
// It'll usually be Bank, Sub, Prog. or Sub, Bank, Prog, but some use only one
// of bank or sub :)
fun void select_bank(int bank) 
{
    select_bank(bank, default_channel);
}
fun void select_bank(int bank, int channel)
{
    controller(0, bank, channel);
}
fun void select_subbank(int bank) 
{
    select_subbank(bank, default_channel);
}
fun void select_subbank(int bank, int channel)
{
    controller(32, bank, channel);
}


// Uses only the coarse volume since few things both to implement fine.
fun void volume(int level)
{
    volume(level, default_channel);
}
fun void volume(int level, int channel)
{
    controller(7, level, channel);
}



////////////////////////////
// basic interface functions.
//
// These generate the low-level MIDI messages.

// Basically all the MIDI functions break down into sending one of these
// two things.
fun void send_3bytes(int command, int channel, int byte1, int byte2)
{
    ((command & 0xf) << 4) | ((channel - 1) & 0xf) => midimessage.data1;
    command | channel => command;
    byte1 & 0x7f  => midimessage.data2;
    byte2 & 0x7f => midimessage.data3;
    midiport.send(midimessage);
    
}
// not sure what dance is required to make this only send two bytes.
fun void send_2bytes(int command, int channel, int byte1)
{
    ((command & 0x0f) << 4) | ((channel - 1) & 0xf) => midimessage.data1;
    byte1 & 0x7f => midimessage.data2;
    midiport.send(midimessage);
}

}