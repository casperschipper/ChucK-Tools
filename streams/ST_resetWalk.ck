class Control extends st {
    bus( line( seq(0,6) , rv(20,40) ), "control" );
}

Control control;

class Main extends st {
    PingSynth s => Safe safe => Pan2 p => dac;
    
    s.gain(1); p.gain(0.2);
    p.pan(cs.rvf());
    
    s.timeStep(second);
    
    s.init(
        hold(
            mtof(
                sum(
                    (new ST_reset).init( walk(0,ch([5,7,-7])) , st(0) , bus("control") ) , 50
                   )
                ),
                seq([2,2,2,1]) 
            )
        , st(cs.choosef([0.2,0.4,0.6])),
        seq([0.4,0.4,0.2,0.8]),
        st(1.0)
    );
}

Main main[4];

hour => now;