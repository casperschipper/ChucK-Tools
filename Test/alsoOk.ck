OscSend xmit;
xmit.setHost("localhost",57110);
xmit.openBundleTimed(now);
xmit.startMsg("/s_new",",siiisfsfs");
xmit.addString("casper");
xmit.addInt(1000);
xmit.addInt(0);
xmit.addInt(1);
xmit.addString("foo");
xmit.addFloat(440.0);
xmit.addString("bar");
xmit.addFloat(4240.0);
xmit.addString("cor");


//xmit.startMsg("/n_set",",isf");
//xmit.addInt(1000);
//xmit.addString("freq");
//xmit.addFloat(440.0);
//xmit.closeBundle();



