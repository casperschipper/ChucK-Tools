OscSend xmit;
xmit.setHost("localhost",57110);
xmit.openBundleTimed(now);
xmit.startMsg("/s_new, siiisfsff");
xmit.addString("casper");
xmit.addInt(1000);
xmit.addInt(0);
xmit.addInt(1);
xmit.addString("freq");
xmit.addFloat(440.0);
xmit.addString("amp");
xmit.addFloat(22.0);
xmit.addFloat(33.0);

xmit.closeBundle();
second=>now;

