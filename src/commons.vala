namespace advent2015 {

string read_file (string fname) {

    string content;
    try {
        FileUtils.get_contents (fname, out content);
    } catch (FileError ex) {
        warning (@"can't read file '$fname': $(ex.message)");
        content = "";
    }
    return content;
}


}
