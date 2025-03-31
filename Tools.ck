me.dir() => string path;

<<<"2025">>>;

fun void add(string filename) {
    Machine.add(path+filename);
}

add("cs.ck");
.1::second => now;
add("CRandom.ck");
add("PanFour.ck");
add("PanBin.ck");
add("PanBin8.ck");
//add("Pan4.ck");
add("Global.ck");
add("OSC_Read.ck");
add("FeedbackDelay.ck");
add("Safe.ck");
add("List.ck");
add("Clist.ck");
add("SeqUnit.ck");
add("MidiKiller.ck");

add("JsonEncoders/JsonValue");
add("JsonEncoders/JsonObject");
add("JsonEncoders/JsonArray");
add("JsonEncoders/JsonBool");
add("JsonEncoders/JsonInt");
add("JsonEncoders/JsonFloat");
add("JsonEncoders/JsonString");
add("JsonEncoders/Json");

add("ShredEvent.ck");
add("ShredEventStack.ck");


add("Synths/SuperSaw.ck");
add("PercEnv.ck");
add("Ping.ck");

add("streams/Stream");
add("streams/ST_choice");
add("streams/ST_count");
add("streams/ST_count2"); // this can also hold...
add("streams/ST_delay");
add("streams/ST_delayi");
add("streams/ST_float");
add("streams/ST_index");
add("streams/ST_IndexLin");
add("streams/ST_modIndex");
add("streams/ST_mupModIndex");
add("streams/ST_repeat");
add("streams/ST_repeatPlay");
add("streams/ST_latch");
//add("streams/ST_forcedRepeat");
add("streams/ST_timedLatch");
add("streams/ST_compose");
add("streams/ST_seq");
add("streams/ST_value");
add("streams/ST_vase");
add("streams/ST_weave");
add("streams/ST_tri");
//add("streams/ST_loop");
add("streams/ST_loop3");
add("streams/ST_customLoop");
add("streams/ST_timed");
add("streams/ST_scale");
add("streams/ST_scale2");
add("streams/ST_line");
add("streams/ST_linseg");
add("streams/ST_walk");
add("streams/ST_walkList");
add("streams/ST_smartWalkList");
add("streams/ST_latchWalk");
add("streams/ST_mupWalk");
add("streams/ST_maskedChoice");
add("streams/ST_BoundedMupWalk");
add("streams/ST_boundedMupResetWalk");
add("streams/ST_boundedWalk");
add("streams/ST_bumpyWalk");
add("streams/ST_bouncyWalk");
add("streams/ST_collatz");
add("streams/ST_jumpWalk");
add("streams/ST_operator");
add("streams/ST_sum");
add("streams/ST_mup");
add("streams/ST_div");
add("streams/ST_sub");
add("streams/ST_max");
add("streams/ST_min");
add("streams/ST_rv");
add("streams/ST_modulo");
add("streams/ST_floor");
add("streams/ST_greater");
add("streams/ST_bitAnd");
add("streams/ST_bitOr");
add("streams/ST_bitXor");
add("streams/ST_equal");
add("streams/ST_bigger");
add("streams/ST_smaller");
add("streams/ST_overwrite");
add("streams/ST_exprv");
add("streams/ST_pow");
add("streams/ST_bind");
add("streams/ST_timedReset");
add("streams/ST_reset");
add("streams/ST_trigReset");
add("streams/ST_write");
add("streams/ST_writeover");
add("streams/ST_writeHead");
add("streams/ST_append");
add("streams/ST_readWrite");
add("streams/ST_diff");
add("streams/ST_onePole");
add("streams/ST_tableCap");
add("streams/ST_hzPhasor");
add("streams/ST_rampGen");
add("streams/ST_couple");
add("streams/ST_stateMachine");

add("streams/Guard");
add("streams/GuardControl");
add("streams/GuardTest");
add("streams/GuardTestValue");
add("streams/ST_guardedWalk");
add("streams/Otherwise");

add("streams/ST_bitShiftL");
add("streams/ST_bitShiftR");

add("streams/ST_divider");

add("streams/ST_q");
add("streams/ST_series");
add("streams/ST_bus");
add("streams/ST_weights");
add("streams/ST_wchoice");// optimized version
add("streams/ST_weightStream");
add("streams/ST_sometimes");
add("streams/ST_trigger");
add("streams/ST_triggerSend");
add("streams/ST_trig"); // new variant of trigger, releis on wr / rd
add("streams/ST_mtof");
add("streams/ST_ftom");
add("streams/ST_mtor");
add("streams/ST_mtosamps");
add("streams/ST_mtosec");
add("streams/ST_sine");
add("streams/ST_sin");
add("streams/ST_sineseg");
add("streams/ST_ugen");
add("streams/ST_clip");
add("streams/ST_tanh");
add("streams/ST_wave");
add("streams/ST_monitor");
add("streams/ST_replaceZero");
add("streams/ST_ZeroCount");
add("streams/ST_avg");
add("streams/ST_store");
add("streams/ST_recall");
add("streams/ST_define");
add("streams/ST_apply");
add("streams/ST_adc");
add("streams/ST_dacin");
add("streams/ST_biquad");
add("streams/ST_slide");
add("streams/ST_leakDC");
add("streams/ST_invert");
add("streams/ST_abs");

// funkstreams
add("Funk.ck");
add("TimedFunk.ck");
add("streams/ST_funkStream");
add("Schedule.ck");

// StreamSynth motherclass
add("StreamSynths/StreamSynth");
// Stream dict
add("streams/StreamDict");
// supercollider link
add("streams/SuperChuck2");
add("streams/ST_oscin");

// writing to array with streams
add("StreamSynths/WriteStream");

add("streams/ST_normStream");


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
add("StreamSynths/OSCStream");


add("StreamSynths/MidiStream");
add("StreamSynths/MidiNoteChannelSyncStream");
add("StreamSynths/MidiNoteChannelSyncTriggerStream");
add("StreamSynths/MidiNoteChannelTriggerMultiStream");
add("StreamSynths/MidiNoteChannelStream");
add("StreamSynths/MidiNoteCtrlStream");
add("StreamSynths/MidiControlStream");
add("StreamSynths/MidiSyncStream");
add("StreamSynths/SingleKeySynth");
add("StreamSynths/StreamNonLinFilter");
add("StreamSynths/NodeSynth");

add("OSCTable");
add("streams/ST_midiCtrl");
add("streams/ST_key"); 
add("streams/ST_singleKey"); // 


add("streams/st");


add("buses2.ck");
add("PanFourBus.ck");
add("ReadSSV.ck");



