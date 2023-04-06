class Main extends st {
    
    fun Stream four() {
        return line( seq([100,200,300,400]).set(cs.rv(0,2)), rv(1,10));
    }
    
    fun Stream two() {
        return t( boundedMupWalk(100,1200,ch([2.0/3.0,3.0/2.0])), ch([1,2,4,8,16]) );
    }
    
    fun Stream one() {
        return hold( walkList([four(),two(),two(),two(),st(100)]), rv(2,3));
    }
    
    fun Stream pan() {
        return line( seq(-1,1) , ch([4,8,16]) );
    }
    
    fun Stream durlin(float ti) {
        return t( ch([1.4*ti,2.2*ti,0.9*ti,1.5*ti]) , ch([1,2,4,8,16]) );
    }
    
    9 => Math.srandom;
    
    SuperChuck sc;
    sc.instrument("ping");
    sc.timer(ch([0.1,0.2,0.1,0.1]));
    sc.addPar("freq",seq([one().st(),one(),one(),one(),one()]));
    sc.addPar("gain",line(seq(0.1,0.01),rv(1,10)));
    sc.addPar("duration",seq([durlin(1),durlin(1),durlin(1)]));
    sc.addPar("pan",seq([pan(),pan(),pan()]));
    sc.addPar("attack",seq([durlin(0.01),durlin(0.01),durlin(0.01)]));
    
    sc.play();
    
    
}

Main main[3]; hour => now;