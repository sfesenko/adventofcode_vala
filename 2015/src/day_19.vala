using advent2015;

class Day19 : Day {

    HashTable<string, GenericArray<string>> get_replacements (string[] lines) {
        var table = new HashTable<string, GenericArray<string>> (str_hash, str_equal);
        foreach (var line in lines) {
            var t = line.split (" => ");
            if (table.contains (t[0])) {
                table[t[0]].add (t[1]);
            } else {
                var a = new GenericArray<string> ();
                a.add (t[1]);
                table [t[0]] = a;
            }
        }
        return table;
    }

    uint first_u (string data) {
        var lines = data.split ("\n");
        var replacements = get_replacements (lines[0:lines.length-2]);
        var initial = lines [lines.length - 1];
        var produced = new GenericSet<string> (str_hash, str_equal);
        replacements.foreach ((k, v) => {
            var idx = initial.index_of (k);
            while (idx >= 0) {
                var prefix = initial.slice (0, idx);
                var suffix = initial.slice (idx + k.length, -1);
                v.foreach ((repl) => {
                    var nl = prefix + repl + suffix;
                    produced.add (nl);
                });
                idx = initial.index_of (k, idx + 1);
            }
        });
        return produced.length;
    }

    // used formula from 
    // https://www.reddit.com/r/adventofcode/comments/3xflz8/day_19_solutions/cy4etju/
    uint second_u (string data) {
        var lines = data.split ("\n");
        var target = lines [lines.length - 1]
            .replace ("Rn", "(")
            .replace ("Ar", ")")
            .replace ("Y", ",");

        uint t = 0, y = 0;
        for (var i = 0; i < target.length; ++i) {
            var c = target[i];
            if (c.isalpha () && c.isupper()) {
                t += 1;
            } else if (c == ',') {
                y += 1;
            }
        }
        return t - y - 1;
    }
}
