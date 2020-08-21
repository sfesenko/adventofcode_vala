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

    inline uint max (uint a, uint b, uint c) {
        return uint.max (a, uint.max (b, c) );
    }

    inline uint min (uint a, uint b, uint c) {
        return uint.min( uint.min (a, b), c );
    }

    delegate bool Predicate<T> (T val);
    delegate T ReduceArray<T> (T[] array);
}

public interface advent2015.Day {
    public abstract uint first (string data);
    public abstract uint second (string data);
}
