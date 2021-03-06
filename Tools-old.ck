"/Users/casperschipper/Google Drive/chuck/tools/" @=> string toolsPath;

Machine.add(toolsPath + "Index");
Machine.add(toolsPath + "Mod.ck");
Machine.add(toolsPath + "cs.ck");
Machine.add(toolsPath + "Move.ck");
Machine.add(toolsPath + "Random.ck");
Machine.add(toolsPath + "Line.ck");
Machine.add(toolsPath + "tLine.ck");
Machine.add(toolsPath + "Walk.ck");
Machine.add(toolsPath + "PanFour.ck");
Machine.add(toolsPath + "PanBin.ck");
Machine.add(toolsPath + "PanBin8.ck");
Machine.add(toolsPath + "Pan4.ck");
Machine.add(toolsPath + "Scalerf.ck");
Machine.add(toolsPath + "List.ck");
Machine.add(toolsPath + "Clist.ck");
Machine.add(toolsPath + "Cflist.ck");
Machine.add(toolsPath + "TransformList.ck");
Machine.add(toolsPath + "SeqUnit.ck");
Machine.add(toolsPath + "Form.ck");
Machine.add(toolsPath + "xero.ck");
Machine.add(toolsPath + "Toggle.ck");
Machine.add(toolsPath + "TimedList.ck");
Machine.add(toolsPath + "Global.ck");
Machine.add(toolsPath + "OSC_Read.ck");
Machine.add(toolsPath + "arrayGen.ck");
Machine.add(toolsPath + "ShredCounter.ck");
Machine.add(toolsPath + "TriOscTendencyMask.ck");
Machine.add(toolsPath + "Expenv.ck");
Machine.add(toolsPath + "LFOMup.ck");
Machine.add(toolsPath + "FeedbackDelay.ck");
Machine.add(toolsPath + "Safe.ck");


Machine.add(toolsPath + "Synths/SuperSaw.ck");
Machine.add(toolsPath + "PercEnv.ck");
Machine.add(toolsPath + "Ping.ck");

Machine.add(toolsPath + "Streams/Stream");
Machine.add(toolsPath + "Streams/ST_choice");
Machine.add(toolsPath + "Streams/ST_count");
Machine.add(toolsPath + "Streams/ST_count2"); // this can also hold...
Machine.add(toolsPath + "Streams/ST_delay");
Machine.add(toolsPath + "Streams/ST_float");
Machine.add(toolsPath + "Streams/ST_index");
Machine.add(toolsPath + "Streams/ST_indexLin");
Machine.add(toolsPath + "Streams/ST_repeat");
Machine.add(toolsPath + "Streams/ST_latch");
Machine.add(toolsPath + "Streams/ST_timedLatch");
Machine.add(toolsPath + "Streams/ST_seq");
Machine.add(toolsPath + "Streams/ST_value");
Machine.add(toolsPath + "Streams/ST_vase");
Machine.add(toolsPath + "Streams/ST_weave");
Machine.add(toolsPath + "Streams/ST_tri");
//Machine.add(toolsPath + "Streams/ST_loop");
Machine.add(toolsPath + "Streams/ST_loop3");
Machine.add(toolsPath + "Streams/ST_timed");
Machine.add(toolsPath + "Streams/ST_scale");
Machine.add(toolsPath + "Streams/ST_scale2");
Machine.add(toolsPath + "Streams/ST_line");
Machine.add(toolsPath + "Streams/ST_linseg");
Machine.add(toolsPath + "Streams/ST_walk");
Machine.add(toolsPath + "Streams/ST_walkList");
Machine.add(toolsPath + "Streams/ST_smartWalkList");
Machine.add(toolsPath + "Streams/ST_mupWalk");
Machine.add(toolsPath + "Streams/ST_maskedChoice");
Machine.add(toolsPath + "Streams/ST_boundedMupWalk");
Machine.add(toolsPath + "Streams/ST_boundedMupResetWalk");
Machine.add(toolsPath + "Streams/ST_boundedWalk");
Machine.add(toolsPath + "Streams/ST_bumpyWalk");
Machine.add(toolsPath + "Streams/ST_bouncyWalk");
Machine.add(toolsPath + "Streams/ST_operator");
Machine.add(toolsPath + "Streams/ST_sum");
Machine.add(toolsPath + "Streams/ST_mup");
Machine.add(toolsPath + "Streams/ST_div");
Machine.add(toolsPath + "Streams/ST_sub");
Machine.add(toolsPath + "Streams/ST_max");
Machine.add(toolsPath + "Streams/ST_min");
Machine.add(toolsPath + "Streams/ST_rv");
Machine.add(toolsPath + "Streams/ST_modulo");
Machine.add(toolsPath + "Streams/ST_floor");
Machine.add(toolsPath + "Streams/ST_greater");
Machine.add(toolsPath + "Streams/ST_bitAnd");
Machine.add(toolsPath + "Streams/ST_bitOr");
Machine.add(toolsPath + "Streams/ST_bitXor");
Machine.add(toolsPath + "Streams/ST_equal");
Machine.add(toolsPath + "Streams/ST_exprv");
Machine.add(toolsPath + "Streams/ST_timedReset");
Machine.add(toolsPath + "Streams/ST_reset");
Machine.add(toolsPath + "Streams/ST_write");

Machine.add(toolsPath + "Streams/ST_bitShiftL");
Machine.add(toolsPath + "Streams/ST_bitShiftR");

Machine.add(toolsPath + "Streams/ST_divider");

Machine.add(toolsPath + "Streams/ST_q");
Machine.add(toolsPath + "Streams/ST_series");
Machine.add(toolsPath + "Streams/ST_bus");
Machine.add(toolsPath + "Streams/ST_weights");
Machine.add(toolsPath + "Streams/ST_wchoice");// optimized version
Machine.add(toolsPath + "Streams/ST_weightStream");
Machine.add(toolsPath + "Streams/ST_trigger");
Machine.add(toolsPath + "Streams/ST_triggerSend");
Machine.add(toolsPath + "Streams/ST_mtof");
Machine.add(toolsPath + "Streams/ST_ftom");
Machine.add(toolsPath + "Streams/ST_mtor");
Machine.add(toolsPath + "Streams/ST_mtosamps");
Machine.add(toolsPath + "Streams/ST_sine");
Machine.add(toolsPath + "Streams/ST_sineseg");
Machine.add(toolsPath + "Streams/ST_ugen");
Machine.add(toolsPath + "Streams/ST_clip");
Machine.add(toolsPath + "Streams/ST_tanh");
Machine.add(toolsPath + "Streams/ST_wave");
Machine.add(toolsPath + "Streams/ST_monitor");

// funkstreams
Machine.add(toolsPath + "Funk.ck");
Machine.add(toolsPath + "TimedFunk.ck");
Machine.add(toolsPath + "Streams/ST_funkStream");

// Stream dict
Machine.add(toolsPath + "Streams/StreamDict");
// supercollider link
Machine.add(toolsPath + "Streams/Superchuck");

// writing to array with streams
Machine.add(toolsPath + "StreamSynths/WriteStream");

Machine.add(toolsPath + "Streams/ST_normStream");

 

Machine.add(toolsPath + "StreamSynths/LineSynth");
Machine.add(toolsPath + "StreamSynths/PulseSynth");
Machine.add(toolsPath + "StreamSynths/StepSynth");
Machine.add(toolsPath + "StreamSynths/FMSynth");
Machine.add(toolsPath + "StreamSynths/PingSynth");
Machine.add(toolsPath + "StreamSynths/PulsePanSynth");
Machine.add(toolsPath + "StreamSynths/StepPanSynth");
Machine.add(toolsPath + "StreamSynths/LinePanSynth");
Machine.add(toolsPath + "StreamSynths/SinSynth");
Machine.add(toolsPath + "StreamSynths/SquareSynth");
Machine.add(toolsPath + "StreamSynths/PwmSynth");
Machine.add(toolsPath + "StreamSynths/StreamPan");
Machine.add(toolsPath + "StreamSynths/StreamHPFilter");
Machine.add(toolsPath + "StreamSynths/StreamBPFilter");
Machine.add(toolsPath + "StreamSynths/StreamLPFilter");
Machine.add(toolsPath + "StreamSynths/StreamFeedbackDelay");

Machine.add(toolsPath + "StreamSynths/MidiStream");
Machine.add(toolsPath + "StreamSynths/MidiControlStream");

Machine.add(toolsPath + "StreamSynths/StreamNonLinFilter");

Machine.add(toolsPath + "OSCTable");

Machine.add(toolsPath + "Streams/st");


Machine.add(toolsPath + "Buses2.ck");
Machine.add(toolsPath + "PanFourBus.ck");
Machine.add(toolsPath + "ReadSSV.ck");


