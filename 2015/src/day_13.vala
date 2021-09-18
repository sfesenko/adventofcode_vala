using advent2015;

class Day13 : Day {

    HashTable<uint, int> happiness = new HashTable<uint, int>((i) => i, (a, b) => a == b);

    uint idx (uint x, uint y) {
        return y * 16 + x;
    }

    uint populate_data (string data) {
        happiness.remove_all ();

        var name_index = new HashTable<string, uint> (str_hash, str_equal);

        foreach (var line in data.split ("\n")) {
            var tokens = line.split (" ");
            var name1 = tokens [0];
            uint n1;
            if (name_index.contains (name1) ) {
                n1 = name_index [ name1 ];
            } else {
                n1 = name_index.length;
                name_index [ name1 ] = n1;
            }
            var name2 = tokens [ 10 ].slice (0, -1);
            uint n2;
            if (name_index.contains (name2) ) {
                n2 = name_index [ name2 ];
            } else {
                n2 = name_index.length;
                name_index [ name2 ] = n2;
            }
            var joy = int.parse (tokens [3]);
            if (tokens [2] == "lose") {
                joy = -joy;
            }
            happiness [ idx (n1, n2) ] = joy;
            // debug (@" '$name1'~$n1 -> '$name2'~$n2 == $joy");
        }
        return name_index.length;
    }

    int calculate_joy (uint8[] pos) {
        var len = pos.length;
        int result = 0;
        for (var i = 0; i < len; ++i) {
            var c = pos [ i ];
            var l = pos [ (i + len - 1) % len ];
            var r = pos [ (i + len + 1) % len ];
            result += happiness [ idx (c, l) ] + happiness [ idx (c, r) ];
        }
        return result;
    }

    int recursive_joy_1 (uint length, uint8[] positions, uint n = 0, uint mask = 0) {
        if (n >= length) {
            return calculate_joy (positions);
        }
        var max_joy = int.MIN;
        for (var i = 0; i < length; ++i) {
            var mx = 1 << i;
            if ((mx & mask) > 0) {
                continue;
            }
            positions [n] = i;
            var joy = recursive_joy_1 (length, positions, n + 1, mask | mx);
            max_joy = int.max (max_joy, joy);
        }
        return max_joy;
    }

    int recursive_joy (uint length) {
        return recursive_joy_1 (length, new uint8 [ length ]);
    }

    uint first_u (string data) {
        var n = populate_data (data);
        return recursive_joy (n);
    }

    uint second_u (string data) {
        var n = populate_data (data);
        return recursive_joy (n + 1);
    }
}
