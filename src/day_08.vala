using advent2015;

class Day8 : Day {

    delegate int length_counter (string line);

    int char_length (string line) {
        uint i = 0;
        int count = 0;
        char p = 0;
        while (++i < line.length - 1) {
            var ch = line [i];
            if (p == '\\' && (ch == '\\' || ch == '\"')) {
                p = 0;
                continue;
            }
            if (p == '\\' && ch == 'x') {
                var code = line.substring (i + 1, 2);
                int ichar;
                int.try_parse (code, out ichar, null, 16);
                p = (char) ichar;
                // debug (@"code = $code, p = $p");
                i += 2;
                continue;
            }
            count += 1;
            p = ch;
        }
        return count;
    }

    uint count_length (string data, length_counter f) {
        var lines = data.split ("\n");
        int count = 0;
        foreach (var line in lines) {
            if (line.length == 0 ) {
                continue;
            }
            var chars = f (line);
            var dx = (line.length - chars).abs ();
            // debug (@"line = $line, len = $(line.length), chars = $chars, dx = $dx");
            count += dx;
        }
        return count;
    }

    uint first (string data) {
        return count_length (data, char_length);
    }

    int char_length2 (string line) {
        var count = 0;
        foreach (var ch in line.to_utf8 ()) {
            if (ch == '\\' || ch == '\"') {
                count += 1;
            }
            count += 1;
        }
        return count + 2;
    }

    uint second (string data) {
        return count_length (data, char_length2);
    }
}
