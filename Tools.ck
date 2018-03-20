"/Users/casperschipper/Google Drive/chuck/tools/" @=> string toolsPath;

fun void add(string filename) {
    Machine.add(toolsPath+filename);
}

add("cs.ck");
add("Random.ck");
add("PanFour.ck");
add("PanBin.ck");
add("PanBin8.ck");
add("Pan4.ck");
add("Global.ck");
add("OSC_Read.ck");
add("FeedbackDelay.ck");
add("Safe.ck");
add("List.ck");
add("CList.ck");
add("SeqUnit.ck");
add("ShredEventStack.ck");


add("Synths/SuperSaw.ck");
add("PercEnv.ck");
add("Ping.ck");

add("Streams/Stream");
add("Streams/ST_choice");
add("Streams/ST_count");
add("Streams/ST_count2"); // this can also hold...
add("Streams/ST_delay");
add("Streams/ST_float");
add("Streams/ST_index");
add("Streams/ST_indexLin");
add("Streams/ST_repeat");
add("Streams/ST_latch");
add("Streams/ST_timedLatch");
add("Streams/ST_seq");
add("Streams/ST_value");
add("Streams/ST_vase");
add("Streams/ST_weave");
add("Streams/ST_tri");
//add("Streams/ST_loop");
add("Streams/ST_loop3");
add("Streams/ST_timed");
add("Streams/ST_scale");
add("Streams/ST_scale2");
add("Streams/ST_line");
add("Streams/ST_linseg");
add("Streams/ST_walk");
add("Streams/ST_walkList");
add("Streams/ST_smartWalkList");
add("Streams/ST_mupWalk");
add("Streams/ST_maskedChoice");
add("Streams/ST_boundedMupWalk");
add("Streams/ST_boundedMupResetWalk");
add("Streams/ST_boundedWalk");
add("Streams/ST_bumpyWalk");
add("Streams/ST_bouncyWalk");
add("Streams/ST_jumpWalk");
add("Streams/ST_operator");
add("Streams/ST_sum");
add("Streams/ST_mup");
add("Streams/ST_div");
add("Streams/ST_sub");
add("Streams/ST_max");
add("Streams/ST_min");
add("Streams/ST_rv");
add("Streams/ST_modulo");
add("Streams/ST_floor");
add("Streams/ST_greater");
add("Streams/ST_bitAnd");
add("Streams/ST_bitOr");
add("Streams/ST_bitXor");
add("Streams/ST_equal");
add("Streams/ST_bigger");
add("Streams/ST_smaller");
add("Streams/ST_exprv");
add("Streams/ST_pow");
add("Streams/ST_timedReset");
add("Streams/ST_reset");
add("Streams/ST_write");
add("Streams/ST_append");
add("Streams/ST_readWrite");
add("Streams/ST_diff");
add("Streams/ST_onePole");
add("Streams/ST_tableCap");
add("Streams/ST_hzPhasor");
add("Streams/ST_couple");
add("Streams/ST_overwrite");

add("Streams/Guard");
add("Streams/GuardControl");
add("Streams/GuardTest");
add("Streams/GuardTestValue");
add("Streams/ST_guardedWalk");

add("Streams/ST_bitShiftL");
add("Streams/ST_bitShiftR");

add("Streams/ST_divider");

add("Streams/ST_q");
add("Streams/ST_series");
add("Streams/ST_bus");
add("Streams/ST_weights");
add("Streams/ST_wchoice");// optimized version
add("Streams/ST_weightStream");
add("Streams/ST_trigger");
add("Streams/ST_triggerSend");
add("Streams/ST_mtof");
add("Streams/ST_ftom");
add("Streams/ST_mtor");
add("Streams/ST_mtosamps");
add("Streams/ST_sine");
add("Streams/ST_sineseg");
add("Streams/ST_ugen");
add("Streams/ST_clip");
add("Streams/ST_tanh");
add("Streams/ST_wave");
add("Streams/ST_monitor");
add("Streams/ST_replaceZero");
add("Streams/ST_store");
add("Streams/ST_recall");
add("Streams/ST_define");
add("Streams/ST_apply");


// funkstreams
add("Funk.ck");
add("TimedFunk.ck");
add("Streams/ST_funkStream");
add("Schedule.ck");

// StreamSynth motherclass
add("StreamSynths/StreamSynth");
// Stream dict
add("Streams/StreamDict");
// supercollider link
add("Streams/Superchuck2");

// writing to array with streams
add("StreamSynths/WriteStream");

add("Streams/ST_normStream");



add("StreamSynths/LineSynth");
add("StreamSynths/PulseSynth");
add("StreamSynths/StepSynth");
add("StreamSynths/FMSynth");
add("StreamSynths/PingSynth");
add("StreamSynths/PulsePanSynth");
add("StreamSynths/StepPanSynth");
add("StreamSynths/LinePanSynth");
add("StreamSynths/PulseFBSynth");
add("StreamSynths/PulseFBSynth2");
add("StreamSynths/ChannelSynth");

add("StreamSynths/SinSynth");
add("StreamSynths/SquareSynth");
add("StreamSynths/PwmSynth");
add("StreamSynths/StreamPan");
add("StreamSynths/StreamHPFilter");
add("StreamSynths/StreamBPFilter");
add("StreamSynths/StreamLPFilter");
add("StreamSynths/StreamFeedbackDelay");
add("StreamSynths/WriteSchedule");

add("StreamSynths/MidiStream");
add("StreamSynths/MidiControlStream");

add("StreamSynths/StreamNonLinFilter");

add("OSCTable");
add("Streams/ST_midiCtrl");


add("Streams/st");


add("Buses2.ck");
add("PanFourBus.ck");
add("ReadSSV.ck");


