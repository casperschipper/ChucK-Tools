"/Users/casperschipper/devel/chuck/tools/" @=> string toolsPath;
fun void add(string filename) {
    Machine.add(toolsPath+filename);
}

add("ShredEvent.ck");
add("ShredEventStack.ck");