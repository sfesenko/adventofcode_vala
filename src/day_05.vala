using advent2015;

class Day5 : Day {

    uint count_niceness (string data, StringPredicate is_nice) {
        uint count = 0;
        foreach (var line in data.split ("\n")) {
            if (line.length == 0) {
                continue;
            }
            if (is_nice (line)) {
                count += 1;
            }
        }
        return count;
    }

    uint first (string data) {
        string[] bl = { "ab", "cd", "pq", "xy" };
        char[] w = "aeiou".to_utf8 ();

        StringPredicate is_nice = (s) => {
            uint wovels = 0;
            uint doubles = 0;
            var prev = '_';
            foreach (var c in s.to_utf8 ()) {
                if (c in w) {
                    wovels += 1;
                }

                if (c == prev) {
                    doubles += 1;
                }
                if ( @"$prev$c" in bl) {
                    return false;
                }

               prev = c;
            }
            return wovels >= 3 && doubles > 0;
        };
        return count_niceness (data, is_nice);
    }

    uint second (string data) {

        StringPredicate niceness = (s) => {
            var pairs = new GenericSet<string> ((s) => s.hash(), (a, b) => a == b);
            var doubles = 0;
            var aba = 0;
            char a = '_';
            char b = '_';
            foreach (var c in s.to_utf8 ()) {
                if ( pairs.contains (@"$b$c") ) {
                    doubles += 1;
                }

                if (a == c) {
                    aba += 1;
                }
                pairs.add (@"$a$b");
                a = b;
                b = c;
            }
            return doubles > 0 && aba > 0 ;
        };

        return count_niceness( data, niceness);
    }
}

