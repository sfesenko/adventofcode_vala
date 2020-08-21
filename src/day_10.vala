using advent2015;

class Day10 : Day {

    // should be build with optimization
    string look_and_say (string data) {
        char p = data[0];
        uint cnt = 1;
        var result = new StringBuilder ();
        for (var i = 1; i < data.length; ++i) {
            var ch = data [i];
            if (p == ch) {
                cnt += 1;
                continue;
            }
            result.append (cnt.to_string ());
            result.append (p.to_string ());
            cnt = 1;
            p = ch;
        }
        result.append (cnt.to_string ());
        result.append (p.to_string ());
        return result.str;
    }

    uint run_loop (string data, uint count) {
        var s = data;
        for (var i = 0; i < count; ++i) {
            s = look_and_say (s);
            debug ("%02d ~~ %d", i+1, s.length);
        }
        return s.length;

    }

    uint first (string data) {
        return run_loop (data, 40);
    }

    uint second (string data) {
        return run_loop (data, 50);
    }
}

