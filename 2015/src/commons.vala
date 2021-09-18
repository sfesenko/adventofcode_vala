namespace advent2015 {

    string read_file (string fname) {

        string content;
        try {
            FileUtils.get_contents (fname, out content);
        } catch (FileError ex) {
            warning (@"can't read file '$fname': $(ex.message)");
            content = "";
        }
        return content.strip ();
    }

    inline uint max (uint a, uint b, uint c) {
        return uint.max (a, uint.max (b, c) );
    }

    inline uint min (uint a, uint b, uint c) {
        return uint.min( uint.min (a, b), c );
    }

    delegate bool Predicate<T> (T val);
    delegate T ReduceArray<T> (T[] array);
    delegate string RunFunc (string input);
}

public interface advent2015.Day {
    protected virtual uint first_u (string data) {
        return 0;
    }
    protected virtual uint second_u (string data) {
        return 0;
    }
    public virtual string first (string input) {
        return first_u (input).to_string ();
    }
    public virtual string second (string input) {
        return second_u (input).to_string ();
    }
}
