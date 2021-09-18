using advent2015;

class Day16 : Day {

    static HashTable<string, uint> get_marker () {
        var t = new HashTable<string, uint> (str_hash, str_equal);
        t["children:"] = 3;
        t["cats:"] = 7;
        t["samoyeds:"] = 2;
        t["pomeranians:"] = 3;
        t["goldfish:"] = 5;
        t["trees:"] = 3;
        t["cars:"] = 2;
        t["perfumes:"] = 1;
        return t;
    }

    HashTable<string, uint> parse_line (string line) {
        var p = line.index_of_char (':') + 2;
        var t = line.substring (p).split (" ");
        var table = new HashTable<string, uint> (str_hash, str_equal);

        table [t[0]] = uint.parse (t[1].slice (0, -1));
        table [t[2]] = uint.parse (t[3].slice (0, -1));
        table [t[4]] = uint.parse (t[5]);
        return table;
    }

    bool check (HashTable<string, uint> marker, HashTable<string, uint> item) {
        foreach (var k in item.get_keys ()) {
            if (item[k] != marker[k]) {
                return false;
            }
        }
        return true;
    }

    uint first_u (string data) {
        var lines = data.split ("\n");
        var m = get_marker ();
        for (var i = 0; i < lines.length; ++i) {
            var line = lines [i];
            var h = parse_line (line);
            if (check (m, h)) {
                return i + 1;
            }
        }
        return lines.length;
    }

    bool check_2 (HashTable<string, uint> marker, HashTable<string, uint> item) {
        foreach (var k in item.get_keys ()) {
            var mv = marker[k];
            var iv = item[k];
            bool result;
            switch (k) {
                case "cats:":
                case "trees:":
                    result = iv > mv;
                    break;
                case "pomeranians:":
                case  "goldfish:":
                    result = iv < mv;
                    break;
                default:
                    result = (iv == mv);
                    break;
            }
            if (!result) {
                return false;
            }
        }
        return true;
    }
 
    uint second_u (string data) {
        var lines = data.split ("\n");
        var m = get_marker ();
        for (var i = 0; i < lines.length; ++i) {
            var line = lines [i];
            var h = parse_line (line);
            if (check_2 (m, h)) {
                return i + 1;
            }
        }
        return lines.length;
    }
}
